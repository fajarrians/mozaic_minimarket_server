@inject('ISARC','App\Http\Controllers\InvtStockAdjustmentReportController' )

@extends('adminlte::page')

@section('title', 'MOZAIC Minimarket')
@section('js')
    <script>
        $(document).ready(function(){
            var warehouse_id    = {!! json_encode($warehouse_id) !!}
            var category_id     = {!! json_encode($category_id) !!}

            if (warehouse_id == "") {
                $('#warehouse_id').select2('val', ' ');
            }
            if (category_id == "") {
                $('#category_id').select2('val', ' ');
            }
        });

        function function_change_stock(key,value){
            change_stock = document.getElementById('change_stock_'+(key)).value;
            stock_amount = document.getElementById('stock_amount_'+(key)).value;
            btn_submit = document.getElementById('btn_submit_'+(key));
            var difference_stock = stock_amount - change_stock;
            // console.log(change_stock);

            if (change_stock == '') {
                $('#alert_'+key).html('<div id="alert_'+(key)+'"></div>');
                btn_submit.classList.add('disabled');
            } else if (change_stock != '' && difference_stock < 0) {
                $('#alert_'+key).html('<div class="alert alert-danger mb-3" role="alert" id="alert_'+(key)+'">Sisa Stock Kurang Dari '+change_stock+'</div>');
                btn_submit.classList.add('disabled');
            } else if (change_stock != 0 && difference_stock >= 0) {
                $('#alert_'+key).html('<div id="alert_'+(key)+'"></div>');
                btn_submit.classList.remove('disabled');
            } else if (change_stock == 0 && change_stock != '') {
                $('#alert_'+key).html('<div id="alert_'+(key)+'"></div>');
                btn_submit.classList.add('disabled');
            }
            
            // if (difference_stock < 0 && change_stock != NaN) {
            //     $('#alert_'+key).html('<div class="alert alert-danger mb-3" role="alert" id="alert_'+(key)+'">Sisa Stock Kurang Dari '+change_stock+'</div>');
            //     btn_submit.classList.add('disabled');
            // } else {
            //     $('#alert_'+key).html('<div id="alert_'+(key)+'"></div>');
            //     btn_submit.classList.remove('disabled');
            // }



            // console.log(difference_stock);
        }
    </script>
@endsection

@section('content_header')
    
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="{{ url('home') }}">Beranda</a></li>
      <li class="breadcrumb-item active" aria-current="page">Stok Barang</li>
    </ol>
</nav>

@stop

@section('content')

<h3 class="page-title">
    <b>Stok Barang</b>
</h3>
<br/>
@if(session('msg'))
<div class="alert alert-info" role="alert">
    {{session('msg')}}
</div>
@endif 
<div id="accordion">
    <form  method="post" action="{{ route('stock-adjustment-report-filter') }}" enctype="multipart/form-data">
    @csrf
        <div class="card border border-dark">
        <div class="card-header bg-dark" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            <h5 class="mb-0">
                Filter
            </h5>
        </div>
    
        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
            <div class="card-body">
                <div class = "row">
                    <div class = "col-md-6">
                        <div class="form-group form-md-line-input">
                            <section class="control-label">Nama Gudang
                                <span class="required text-danger">
                                    *
                                </span>
                            </section>
                            {!! Form::select('warehouse_id',  $warehouse, $warehouse_id, ['class' => 'selection-search-clear select-form', 'id' => 'warehouse_id', 'name' => 'warehouse_id']) !!}
                        </div>
                    </div>
                    <div class = "col-md-6">
                        <div class="form-group form-md-line-input">
                            <section class="control-label">Nama Kategori Barang
                                <span class="required text-danger">
                                    *
                                </span>
                            </section>
                            {!! Form::select('item_category_id',  $category, $category_id, ['class' => 'selection-search-clear select-form', 'id' => 'category_id', 'name' => 'category_id']) !!}
                        </div>
                    </div>

                    {{-- <div class = "col-md-6">
                        <div class="form-group form-md-line-input">
                            <section class="control-label">Nama Gudang</section>
                            {!! Form::select('warehouse_id',  $warehouse, 0, ['class' => 'selection-search-clear select-form', 'id' => 'warehouse_id', 'name' => 'warehouse_id']) !!}
                            
                        </div>
                    </div> --}}
                </div>
            </div>
            <div class="card-footer text-muted">
                <div class="form-actions float-right">
                    <a href="{{ route('stock-adjustment-report-reset') }}" type="reset" name="Reset" class="btn btn-danger"><i class="fa fa-times"></i> Batal</a>
                    <button type="submit" name="Find" class="btn btn-primary" title="Search Data"><i class="fa fa-search"></i> Cari</button>
                </div>
            </div>
        </div>
        </div>
    </form>
</div>
<br/>
<div class="card border border-dark">
  <div class="card-header bg-dark clearfix">
    <h5 class="mb-0 float-left">
        Daftar
    </h5>
  </div>

    <div class="card-body">
        <div class="table-responsive">
            <table id="example" style="width:100%" class="table table-striped table-bordered table-hover table-full-width">
                <thead>
                    <tr>
                        <th style='text-align:center; width: 5%'>No</th>
                        <th style='text-align:center'>Nama Gudang</th>
                        <th style='text-align:center'>Kategori Barang</th>
                        <th style='text-align:center'>Nama Barang</th>
                        <th style='text-align:center'>Satuan Barang</th>
                        <th style='text-align:center'>Stok Sistem</th>
                        {{-- <th style='text-align:center'>Aksi</th> --}}
                    </tr>
                </thead>
                <tbody>
                   <?php $no =1; ?>
                   @foreach ($data as $key=>$row )
                       <tr>
                        <td class="text-center">{{ $no++ }}.</td>
                        <td>{{ $ISARC->getWarehouseName($row['warehouse_id']) }}</td>
                        <td>{{ $ISARC->getItemCategoryName($row['item_category_id']) }}</td>
                        <td>{{ $ISARC->getItemName($row['item_id']) }}</td>
                        <td>{{ $ISARC->getItemUnitName($row['item_unit_id']) }}</td>
                        <td class="text-center">{{ $ISARC->getStock($row['item_id'],$row['item_category_id'],$row['item_unit_id'],$row['warehouse_id']) }}</td>
                        {{-- <td class="text-center">
                            <button type="button" class="btn btn-sm btn-outline-warning" data-bs-toggle="modal" data-bs-target="#staticBackdrop{{ $row['item_stock_id'] }}">Pecah Stok</button>
                              
                              <!-- Modal -->
                            <div class="modal fade" id="staticBackdrop{{ $row['item_stock_id'] }}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <form action="{{ route('change-stock-adjustment-report') }}" method="POST">
                                        @csrf
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel">Pecah Stock <b>{{  $ISARC->getItemName($row['item_id']) }}</b> Satuan <b>{{ $ISARC->getItemUnitName($row['item_unit_id']) }}</b></h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body text-left">
                                                <div id="alert_{{ $row['item_stock_id'] }}"></div>
                                                <div class="row form-group">
                                                    <div class="col-md-6">
                                                        <a class="text-dark">Jumlah Stok Yang Dipecah<a class='red'> *</a></a>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input type="number" class="form-control input-bb" name="change_stock_{{ $row['item_stock_id'] }}" id="change_stock_{{ $row['item_stock_id'] }}" type="text" autocomplete="off" value="" oninput="function_change_stock({{ $row['item_stock_id'] }}, this.value)"/>
                                                        <input class="form-control input-bb" name="item_stock_id" id="item_stock_id" type="text" autocomplete="off" value="{{ $row['item_stock_id'] }}" hidden/>
                                                        <input class="form-control input-bb" name="stock_amount_{{ $row['item_stock_id'] }}" id="stock_amount_{{ $row['item_stock_id'] }}" type="text" autocomplete="off" value="{{ $row['last_balance'] }}" hidden/>
                                                    </div>
                                                    <div class="col-md-6 mt-4">
                                                        <a class="text-dark">Ke Satuan<a class='red'> *</a></a>
                                                    </div>
                                                    <div class="col-md-6 mt-4">
                                                        {!! Form::select(0, $ISARC->getSelectItemUnit($row['item_id'],$row['item_unit_id']), 0,['class' => 'form-control selection-search-clear select-form','name'=>'item_unit_id_'.$row['item_stock_id'],'id'=>'item_unit_id_'.$row['item_stock_id']]) !!} 
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="reset" class="btn btn-danger" data-bs-dismiss="modal"><i class="fa fa-times"></i> Batal</button>
                                                <button type="submit" class="btn btn-success disabled" id="btn_submit_{{ $row['item_stock_id'] }}"><i class="fa fa-check" ></i> Pecah Stok</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </td> --}}
                       </tr>
                   @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer text-muted">
        <div class="form-actions float-right">
            <a class="btn btn-secondary" href="{{ url('stock-adjustment-report/print') }}"><i class="fa fa-file-pdf"></i> Pdf</a>
            <a class="btn btn-dark" href="{{ url('stock-adjustment-report/export') }}"><i class="fa fa-download"></i> Export Data</a>
        </div>
    </div>
  </div>
</div>

@stop

@section('footer')
    
@stop

@section('css')
    
@stop

@section('js')
    
@stop   