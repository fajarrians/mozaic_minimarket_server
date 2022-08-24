<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\InvtItem;
use App\Models\InvtItemCategory;
use App\Models\InvtItemPackge;
use App\Models\InvtItemStock;
use App\Models\InvtItemUnit;
use App\Models\InvtStockAdjustment;
use App\Models\InvtWarehouse;
use Elibyy\TCPDF\Facades\TCPDF;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use Ramsey\Uuid\Type\Decimal;

class InvtStockAdjustmentReportController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        
    }
    
    public function index(){
        if(!$category_id = Session::get('category_id')){
            $category_id = '';
        } else {
            $category_id = Session::get('category_id');
        }
        if(!$warehouse_id = Session::get('warehouse_id')){
            $warehouse_id = '';
        } else {
            $warehouse_id = Session::get('warehouse_id');
        }
        $category = InvtItemCategory::where('data_state',0)
        ->where('company_id', Auth::user()->company_id)
        ->get()
        ->pluck('item_category_name','item_category_id');
        $warehouse = InvtWarehouse::where('data_state',0)
        ->where('company_id', Auth::user()->company_id)
        ->get()
        ->pluck('warehouse_name','warehouse_id');
        // $data = InvtStockAdjustment::join('invt_stock_adjustment_item','invt_stock_adjustment.stock_adjustment_id','=','invt_stock_adjustment_item.stock_adjustment_id')
        // ->where('invt_stock_adjustment_item.item_category_id',$category_id)
        // ->where('invt_stock_adjustment.warehouse_id',$warehouse_id)
        // ->where('invt_stock_adjustment.company_id', Auth::user()->company_id)
        // ->where('invt_stock_adjustment.data_state',0)
        // ->get();
        if ($warehouse_id == ""){
            if ($category_id == "") {
                $data = InvtItemStock::where('data_state',0)
                ->where('company_id', Auth::user()->company_id)
                ->get();
            } else {
                $data = InvtItemStock::where('data_state',0)
                ->where('item_category_id',$category_id)
                ->where('company_id', Auth::user()->company_id)
                ->get();
            }
        } else if ($category_id == "") {
            if ($warehouse_id == "") {
                $data = InvtItemStock::where('data_state',0)
                ->where('company_id', Auth::user()->company_id)
                ->get();
            } else {
                $data = InvtItemStock::where('data_state',0)
                ->where('warehouse_id',$warehouse_id)
                ->where('company_id', Auth::user()->company_id)
                ->get();
            }
        } else if ($warehouse_id == "" && $category_id == "") {
            $data = InvtItemStock::where('data_state',0)
            ->where('company_id', Auth::user()->company_id)
            ->get();
        } else {
            $data = InvtItemStock::where('data_state',0)
            ->where('item_category_id',$category_id)
            ->where('warehouse_id',$warehouse_id)
            ->where('company_id', Auth::user()->company_id)
            ->get();
        }
        // if ($category_id == "" && $warehouse_id == "" ) {
        //     $data = InvtItemStock::where('data_state',0)
        //     ->where('company_id', Auth::user()->company_id)
        //     ->get();
        // } else {
        //     $data = InvtItemStock::where('data_state',0)
        //     ->where('item_category_id',$category_id)
        //     ->where('warehouse_id',$warehouse_id)
        //     ->where('company_id', Auth::user()->company_id)
        //     ->get();
        // }
        return view('content.InvtStockAdjustmentReport.ListInvtStockAdjustmentReport',compact('category','warehouse','category_id','warehouse_id','data'));
    }

    public function changeStockAdjustmentReport(Request $request)
    {
        // dd($request->all());
        $item_stock_id = $request->item_stock_id;
        $request->validate([
            'change_stock_'.$item_stock_id => 'required',
            'item_unit_id_'.$item_stock_id => 'required',
        ]);

        $first_data_stock = InvtItemStock::where('item_stock_id', $item_stock_id)
        ->first();
        
        $first_data_packge = InvtItemPackge::where('item_id', $first_data_stock['item_id'])
        ->where('item_unit_id', $first_data_stock['item_unit_id'])
        ->where('item_category_id', $first_data_stock['item_category_id'])
        ->first();

        $end_data_packge = InvtItemPackge::where('item_id', $first_data_stock['item_id'])
        ->where('item_unit_id', $request['item_unit_id_'.$item_stock_id])
        ->where('item_category_id', $first_data_stock['item_category_id'])
        ->first();

        if ($first_data_packge['item_default_quantity'] > $end_data_packge['item_default_quantity']) {
            $change_data_stock = InvtItemStock::where('item_id', $first_data_stock['item_id'])
            ->where('item_unit_id', $request['item_unit_id_'.$item_stock_id])
            ->where('item_category_id', $first_data_stock['item_category_id'])
            ->update(['last_balance' => $first_data_stock['last_balance'] + ($request['change_stock_'.$item_stock_id] * $end_data_packge['item_default_quantity'])]);
    
            $end_data_stock = InvtItemStock::where('item_stock_id', $item_stock_id)
            ->update(['last_balance' => $first_data_stock['last_balance'] - $request['change_stock_'.$item_stock_id]]);
        } else {
            // if (($end_data_packge['last_balance'] + ($request['change_stock_'.$item_stock_id] / $end_data_packge['item_default_quantity'])) !=  Decimal) {

            // }
            $change_data_stock = InvtItemStock::where('item_id', $first_data_stock['item_id'])
            ->where('item_unit_id', $request['item_unit_id_'.$item_stock_id])
            ->where('item_category_id', $first_data_stock['item_category_id'])
            ->update(['last_balance' => $end_data_packge['last_balance'] + ($request['change_stock_'.$item_stock_id] / $end_data_packge['item_default_quantity'])]);
    
            $end_data_stock = InvtItemStock::where('item_stock_id', $item_stock_id)
            ->update(['last_balance' => $first_data_stock['last_balance'] - $request['change_stock_'.$item_stock_id]]);
        }

        // dd($data_packge);

        if($end_data_stock == true && $change_data_stock == true){
            $msg = "Pecah Stok Berhasil";
            return redirect('/stock-adjustment-report')->with('msg', $msg);
        } else {
            $msg = "Pecah Stok Gagal";
            return redirect('/stock-adjustment-report')->with('msg', $msg);
        }
    }

    public function filterStockAdjustmentReport(Request $request)
    {
        $category_id = $request->category_id;
        $warehouse_id = $request->warehouse_id;

        Session::put('category_id',$category_id);
        Session::put('warehouse_id',$warehouse_id);

        return redirect('/stock-adjustment-report');
    }

    public function resetStockAdjustmentReport()
    {
        Session::forget('category_id');
        Session::forget('warehouse_id');

        return redirect('/stock-adjustment-report');
    }

    public function getItemName($item_id)
    {
        $data = InvtItem::where('item_id', $item_id)->first();
        return $data['item_name'];
    }

    public function getSelectItemUnit($item_id,$item_unit_id)
    {
        $data = InvtItemPackge::join('invt_item_unit','invt_item_unit.item_unit_id','=','invt_item_packge.item_unit_id')
        ->where('invt_item_packge.item_id', $item_id)
        ->where('invt_item_packge.item_unit_id','!=', $item_unit_id)
        ->get()
        ->pluck('item_unit_name','item_unit_id');
        return $data;
    }

    public function getWarehouseName($warehouse_id)
    {
        $data = InvtWarehouse::where('warehouse_id', $warehouse_id)->first();
        return $data['warehouse_name'];
    }

    public function getItemUnitName($item_unit_id)
    {
        $data = InvtItemUnit::where('item_unit_id', $item_unit_id)->first();
        return $data['item_unit_name'];
    }

    public function getItemCategoryName($item_category_id)
    {
        $data = InvtItemCategory::where('item_category_id',$item_category_id)->first();
        return $data['item_category_name'];
    }

    public function getStock($item_id, $item_category_id, $item_unit_id, $warehouse_id)
    {
        $data = InvtItemStock::where('item_id',$item_id)
        ->where('item_category_id',$item_category_id)
        ->where('item_unit_id', $item_unit_id)
        ->where('warehouse_id',$warehouse_id)
        ->first();

        return $data['last_balance'];
    }

    public function printStockAdjustmentReport()
    {
        if(!$category_id = Session::get('category_id')){
            $category_id = '';
        } else {
            $category_id = Session::get('category_id');
        }
        if(!$warehouse_id = Session::get('warehouse_id')){
            $warehouse_id = '';
        } else {
            $warehouse_id = Session::get('warehouse_id');
        }
        // $data = InvtStockAdjustment::join('invt_stock_adjustment_item','invt_stock_adjustment.stock_adjustment_id','=','invt_stock_adjustment_item.stock_adjustment_id')
        // ->where('invt_stock_adjustment_item.item_category_id',$category_id)
        // ->where('invt_stock_adjustment.warehouse_id',$warehouse_id)
        // ->where('invt_stock_adjustment.company_id', Auth::user()->company_id)
        // ->where('invt_stock_adjustment.data_state',0)
        // ->get();
        if ($warehouse_id == ""){
            if ($category_id == "") {
                $data = InvtItemStock::where('data_state',0)
                ->where('company_id', Auth::user()->company_id)
                ->get();
            } else {
                $data = InvtItemStock::where('data_state',0)
                ->where('item_category_id',$category_id)
                ->where('company_id', Auth::user()->company_id)
                ->get();
            }
        } else if ($category_id == "") {
            if ($warehouse_id == "") {
                $data = InvtItemStock::where('data_state',0)
                ->where('company_id', Auth::user()->company_id)
                ->get();
            } else {
                $data = InvtItemStock::where('data_state',0)
                ->where('warehouse_id',$warehouse_id)
                ->where('company_id', Auth::user()->company_id)
                ->get();
            }
        } else if ($warehouse_id == "" && $category_id == "") {
            $data = InvtItemStock::where('data_state',0)
            ->where('company_id', Auth::user()->company_id)
            ->get();
        } else {
            $data = InvtItemStock::where('data_state',0)
            ->where('item_category_id',$category_id)
            ->where('warehouse_id',$warehouse_id)
            ->where('company_id', Auth::user()->company_id)
            ->get();
        }

        $pdf = new TCPDF('P', PDF_UNIT, 'F4', true, 'UTF-8', false);

        $pdf::SetPrintHeader(false);
        $pdf::SetPrintFooter(false);

        $pdf::SetMargins(10, 10, 10, 10); // put space of 10 on top

        $pdf::setImageScale(PDF_IMAGE_SCALE_RATIO);

        if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
            require_once(dirname(__FILE__).'/lang/eng.php');
            $pdf::setLanguageArray($l);
        }

        $pdf::SetFont('helvetica', 'B', 20);

        $pdf::AddPage();

        $pdf::SetFont('helvetica', '', 8);

        $tbl = "
        <table cellspacing=\"0\" cellpadding=\"2\" border=\"0\">
            <tr>
                <td><div style=\"text-align: center; font-size:14px; font-weight: bold\">LAPORAN STOK</div></td>
            </tr>
        </table>
        ";
        $pdf::writeHTML($tbl, true, false, false, false, '');
        
        $no = 1;
        $tblStock1 = "
        <table cellspacing=\"0\" cellpadding=\"1\" border=\"1\" width=\"100%\">
            <tr>
                <td width=\"3%\" ><div style=\"text-align: center;\">No</div></td>
                <td width=\"16%\" ><div style=\"text-align: center;\">Nama Gudang</div></td>
                <td width=\"16%\" ><div style=\"text-align: center;\">Nama Kategori</div></td>
                <td width=\"16%\" ><div style=\"text-align: center;\">Nama Barang</div></td>
                <td width=\"16%\" ><div style=\"text-align: center;\">Nama Satuan</div></td>
                <td width=\"16%\" ><div style=\"text-align: center;\">Stok Sistem</div></td>
            </tr>
        
             ";

        $no = 1;
        $tblStock2 =" ";
        foreach ($data as $key => $val) {
            $id = $val['purchase_invoice_id'];

            if($val['purchase_invoice_id'] == $id){
                $tblStock2 .="
                    <tr>			
                        <td style=\"text-align:center\">$no.</td>
                        <td>".$this->getWarehouseName($val['warehouse_id'])."</td>
                        <td>".$this->getItemCategoryName($val['item_category_id'])."</td>
                        <td>".$this->getItemName($val['item_id'])."</td>
                        <td>".$this->getItemUnitName($val['item_unit_id'])."</td>
                        <td style=\"text-align:center\">".$this->getStock($val['item_id'],$val['item_category_id'],$val['item_unit_id'],$val['warehouse_id'])."</td>
                    </tr>
                    
                ";
                $no++;
            }
        }
        $tblStock3 = " 

        </table>";

        $pdf::writeHTML($tblStock1.$tblStock2.$tblStock3, true, false, false, false, '');

        $filename = 'Laporan_Stok.pdf';
        $pdf::Output($filename, 'I');
    }

    public function exportStockAdjustmentReport()
    {
        if(!$category_id = Session::get('category_id')){
            $category_id = '';
        } else {
            $category_id = Session::get('category_id');
        }
        if(!$warehouse_id = Session::get('warehouse_id')){
            $warehouse_id = '';
        } else {
            $warehouse_id = Session::get('warehouse_id');
        }
        // $data = InvtStockAdjustment::join('invt_stock_adjustment_item','invt_stock_adjustment.stock_adjustment_id','=','invt_stock_adjustment_item.stock_adjustment_id')
        // ->where('invt_stock_adjustment_item.item_category_id',$category_id)
        // ->where('invt_stock_adjustment.warehouse_id',$warehouse_id)
        // ->where('invt_stock_adjustment.company_id', Auth::user()->company_id)
        // ->where('invt_stock_adjustment.data_state',0)
        // ->get();
        if ($warehouse_id == ""){
            if ($category_id == "") {
                $data = InvtItemStock::where('data_state',0)
                ->where('company_id', Auth::user()->company_id)
                ->get();
            } else {
                $data = InvtItemStock::where('data_state',0)
                ->where('item_category_id',$category_id)
                ->where('company_id', Auth::user()->company_id)
                ->get();
            }
        } else if ($category_id == "") {
            if ($warehouse_id == "") {
                $data = InvtItemStock::where('data_state',0)
                ->where('company_id', Auth::user()->company_id)
                ->get();
            } else {
                $data = InvtItemStock::where('data_state',0)
                ->where('warehouse_id',$warehouse_id)
                ->where('company_id', Auth::user()->company_id)
                ->get();
            }
        } else if ($warehouse_id == "" && $category_id == "") {
            $data = InvtItemStock::where('data_state',0)
            ->where('company_id', Auth::user()->company_id)
            ->get();
        } else {
            $data = InvtItemStock::where('data_state',0)
            ->where('item_category_id',$category_id)
            ->where('warehouse_id',$warehouse_id)
            ->where('company_id', Auth::user()->company_id)
            ->get();
        }
        
        $spreadsheet = new Spreadsheet();

        if(count($data)>=0){
            $spreadsheet->getProperties()->setCreator("IBS CJDW")
                                        ->setLastModifiedBy("IBS CJDW")
                                        ->setTitle("Stock Adjustment Report")
                                        ->setSubject("")
                                        ->setDescription("Stock Adjustment Report")
                                        ->setKeywords("Stock, Adjustment, Report")
                                        ->setCategory("Stock Adjustment Report");
                                 
            $sheet = $spreadsheet->getActiveSheet(0);
            $spreadsheet->getActiveSheet()->getPageSetup()->setFitToWidth(1);
            $spreadsheet->getActiveSheet()->getPageSetup()->setFitToWidth(1);
            $spreadsheet->getActiveSheet()->getColumnDimension('B')->setWidth(5);
            $spreadsheet->getActiveSheet()->getColumnDimension('C')->setWidth(20);
            $spreadsheet->getActiveSheet()->getColumnDimension('D')->setWidth(20);
            $spreadsheet->getActiveSheet()->getColumnDimension('E')->setWidth(20);
            $spreadsheet->getActiveSheet()->getColumnDimension('F')->setWidth(20);
            $spreadsheet->getActiveSheet()->getColumnDimension('G')->setWidth(20);
    
            $spreadsheet->getActiveSheet()->mergeCells("B1:G1");
            $spreadsheet->getActiveSheet()->getStyle('B1')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
            $spreadsheet->getActiveSheet()->getStyle('B1')->getFont()->setBold(true)->setSize(16);

            $spreadsheet->getActiveSheet()->getStyle('B3:G3')->getBorders()->getAllBorders()->setBorderStyle(\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN);
            $spreadsheet->getActiveSheet()->getStyle('B3:G3')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

            $sheet->setCellValue('B1',"Laporan Stok");	
            $sheet->setCellValue('B3',"No");
            $sheet->setCellValue('C3',"Nama Gudang");
            $sheet->setCellValue('D3',"Nama Kategori");
            $sheet->setCellValue('E3',"Nama Barang");
            $sheet->setCellValue('F3',"Nama Satuan");
            $sheet->setCellValue('G3',"Stok Sistem");
            
            $j=4;
            $no=0;
            
            foreach($data as $key=>$val){

                if(is_numeric($key)){
                    
                    $sheet = $spreadsheet->getActiveSheet(0);
                    $spreadsheet->getActiveSheet()->setTitle("Laporan Stok");
                    $spreadsheet->getActiveSheet()->getStyle('B'.$j.':G'.$j)->getBorders()->getAllBorders()->setBorderStyle(\PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN);

                    $spreadsheet->getActiveSheet()->getStyle('H'.$j.':G'.$j)->getNumberFormat()->setFormatCode('0.00');
            
                    $spreadsheet->getActiveSheet()->getStyle('B'.$j)->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
                    $spreadsheet->getActiveSheet()->getStyle('C'.$j)->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT);
                    $spreadsheet->getActiveSheet()->getStyle('D'.$j)->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT);
                    $spreadsheet->getActiveSheet()->getStyle('E'.$j)->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT);
                    $spreadsheet->getActiveSheet()->getStyle('F'.$j)->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT);
                    $spreadsheet->getActiveSheet()->getStyle('G'.$j)->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);


                    $id = $val['purchase_invoice_id'];

                    if($val['purchase_invoice_id'] == $id){

                        $no++;
                        $sheet->setCellValue('B'.$j, $no);
                        $sheet->setCellValue('C'.$j, $this->getWarehouseName($val['warehouse_id']));
                        $sheet->setCellValue('D'.$j, $this->getItemCategoryName($val['item_category_id']));
                        $sheet->setCellValue('E'.$j, $this->getItemName($val['item_id']));
                        $sheet->setCellValue('F'.$j, $this->getItemUnitName($val['item_unit_id']));
                        $sheet->setCellValue('G'.$j, $this->getStock($val['item_id'],$val['item_category_id'],$val['item_unit_id'],$val['warehouse_id']));
                    }
                           
                    
                }else{
                    continue;
                }
                $j++;
        
            }
            
            $filename='Laporan_Stok.xls';
            header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="'.$filename.'"');
            header('Cache-Control: max-age=0');

            $writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet, 'Xls');
            $writer->save('php://output');
        }else{
            echo "Maaf data yang di eksport tidak ada !";
        }
    }
}
