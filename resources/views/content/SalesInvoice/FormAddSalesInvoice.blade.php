@inject('SalesInvoice','App\Http\Controllers\SalesInvoiceController' )
@extends('adminlte::page')

@section('title', 'MOZAIC Minimarket')
@section('js')
<script>
    // window.close();
    function function_elements_add(name, value){
        console.log("name " + name);
        console.log("value " + value);
		$.ajax({
				type: "POST",
				url : "{{route('add-elements-sales-invoice')}}",
				data : {
                    'name'      : name, 
                    'value'     : value,
                    '_token'    : '{{csrf_token()}}'
                },
				success: function(msg){
			}
		});
	}

    // $(document).ready(function(){
    //     $("#item_unit_price").change(function(){
    //         var unit_price = $("#item_unit_price").val();
    //         var quantity   = $('#quantity').val();
    //         var subtotal_amount = unit_price * quantity;

    //         $("#subtotal_amount").val(subtotal_amount);
    //         $("#subtotal_amount_view").val(toRp(subtotal_amount));
    //     });

    //     $("#quantity").change(function(){
    //         var unit_price = $("#item_unit_price").val();
    //         var quantity   = $('#quantity').val();
    //         var subtotal_amount = unit_price * quantity;

    //         $("#subtotal_amount").val(subtotal_amount);
    //         $("#subtotal_amount_view").val(toRp(subtotal_amount));
    //     });

    //     $("#quantity").change(function(){
    //         var unit_price = $("#item_unit_price").val();
    //         var quantity   = $('#quantity').val();
    //         var subtotal_amount = unit_price * quantity;

    //         $("#subtotal_amount_after_discount").val(subtotal_amount);
    //         $("#subtotal_amount_after_discount_view").val(toRp(subtotal_amount));
    //     });

    //     $('#discount_percentage').change(function(){
    //         var subtotal_amount = $("#subtotal_amount").val();
    //         var discount_percentage = $("#discount_percentage").val();
    //         var discount_amount = (discount_percentage * subtotal_amount) / 100;
    //         var subtotal_amount_after_discount = subtotal_amount - discount_amount;

    //         $("#discount_amount").val(discount_amount);
    //         $("#discount_amount_view").val(toRp(discount_amount));
    //         $("#subtotal_amount_after_discount").val(subtotal_amount_after_discount);
    //         $("#subtotal_amount_after_discount_view").val(toRp(subtotal_amount_after_discount));
    //     });

    //     $("#discount_percentage_total").change(function(){
    //         var discount_percentage_total = $("#discount_percentage_total").val();
    //         var subtotal_amount1 = $("#subtotal_amount1").val();
    //         var discount_amount_total = (discount_percentage_total * subtotal_amount1) / 100;
    //         var total_amount = subtotal_amount1 - discount_amount_total;

    //         $("#discount_amount_total").val(discount_amount_total);
    //         $("#discount_amount_total_view").val(toRp(discount_amount_total));
    //         $("#total_amount").val(total_amount);
    //         $("#total_amount_view").val(toRp(total_amount));
    //     });

    //     $("#paid_amount").change(function(){
    //         var paid_amount = $("#paid_amount").val();
    //         var total_amount = $("#total_amount").val();
    //         var change_amount = paid_amount - total_amount;

    //         $("#change_amount").val(change_amount);
    //         $("#change_amount_view").val(toRp(change_amount));
    //     });
    // });

    // function processAdd(){
    //     var sales_invoice_date		= document.getElementById("sales_invoice_date").value;
    //     var subtotal_amount		    = document.getElementById("subtotal_amount").value;
    //     var subtotal_amount_change  = document.getElementById("subtotal_amount_change").value;
    //     var paid_amount		        = document.getElementById("paid_amount").value;
    //     var change_amount           = document.getElementById("change_amount").value;
    //     var customer_id             = document.getElementById("customer_id").value;
    //     var subtotal_item           = document.getElementById("subtotal_item").value;

    //     $.ajax({
    //         type: "POST",
    //         url : "{{route('process-add-sales-invoice')}}",
    //         data: {
    //             'sales_invoice_date'        : sales_invoice_date,
    //             'subtotal_amount'    		: subtotal_amount, 
    //             'subtotal_amount_change'    : subtotal_amount_change,
    //             'paid_amount'               : paid_amount,
    //             'change_amount'             : change_amount,
    //             'customer_id'               : customer_id,
    //             'subtotal_item'             : subtotal_item,
    //             '_token'                    : '{{csrf_token()}}'
    //         },
    //         success: function(msg){
    //             location.reload();
    //         }
    //     });
    // }

    function reset_add(){
		$.ajax({
				type: "GET",
				url : "{{route('add-reset-sales-invoice')}}",
				success: function(msg){
                    location.reload();
			}

		});
	}

    // $(document).ready(function(){
    //     $("#item_category_id").select2("val", "0");
    //     $("#item_unit_id").select2("val", "0");
    //     $("#item_id").select2("val", "0");

    //     $("#item_category_id").change(function(){
    //         $("#item_unit_id").select2("val", "0");
    //         $("#item_id").select2("val", "0");
	// 		var id 	= $("#item_category_id").val();
    //         $.ajax({
    //             url: "{{ url('select-item') }}"+'/'+id,
    //             type: "GET",
    //             dataType: "html",
    //             success:function(data)
    //             {
    //                 $('#item_id').html(data);
                    
    //             }
    //         });
	// 	});

    //     $("#item_id").change(function(){
    //         $("#item_unit_id").select2("val", "0");
	// 		var id 	= $("#item_id").val();
    //         $.ajax({
    //             url: "{{ url('select-item-unit') }}"+'/'+id,
    //             type: "GET",
    //             dataType: "html",
    //             success:function(data)
    //             {
    //                 $('#item_unit_id').html(data);

    //             }
    //         });
	// 	});
	// });

    function function_change_quantity(key,no, value){
        quantity = parseInt(document.getElementById((no)+'_quantity').value);
        total_price = parseInt(document.getElementById((no)+'_price').value);
        var total_amount = quantity * total_price;

        $.ajax({
            url: "{{ url('sales-invoice/change-qty') }}"+'/'+key+'/'+value,
            type: "GET",
            dataType: "html",
            success:function(data)
            {
                // if (data != "") {
                //     location.reload();
                // }
                console.log(data);
                // var a = JSON.parse(data);
                // $('#table_data').html(a.item_name);
                // console.log(a);
            }
        });
        
        $('#'+no+'_price_amount').text(toRp(total_amount));

        first_key = parseInt(document.getElementById('first_key').value);
        end_key = parseInt(document.getElementById('end_key').value) + 1;
        // console.log(first_key)
        var subtotal = 0;
        var subtotal_item = 0;
        for (let i = first_key; i < end_key; i++) {
            quantity = parseInt(document.getElementById((i)+'_quantity').value);
            price = parseInt(document.getElementById((i)+'_price').value);
            $('#'+i+'_price_amount').text(toRp(quantity * price));
            subtotal += quantity * price;
            subtotal_item += quantity;
            
        }
        
        $('#subtotal_amount_view').text(toRp("Rp. "+subtotal));
        $('#subtotal_amount').val(subtotal);
        $('#subtotal_amount_change').val(subtotal);
        $('#subtotal_item').val(subtotal_item);
        // kunci = document.getElementById('kunci').value;
        // var subtotal = total_amount;
        // for (let i = 0; i < kunci; i++) {
        //     subtotal = document.getElementById((i)+'_total_amount').value; 
        //     console.log(i);
        // }
        // $('#subtotal_total').val(subtotal);
        subtotal_amount = $('#subtotal_amount').val();
        discount_percentage_total = $('#discount_percentage_total').val();
        // if (discount_percentage_total == "") {
        //     discount_percentage_total = 0;
        // }
        discount_amount_total = (subtotal_amount * discount_percentage_total) / 100;
        total_amount = subtotal_amount - discount_amount_total;

        $('#subtotal_amount_view').text(toRp("Rp. "+total_amount));
        $('#subtotal_amount_change').val(total_amount);
        $('#discount_amount_total').val(discount_amount_total);
        console.log(discount_percentage_total);

        subtotal_amount = $('#subtotal_amount_change').val();
        paid_amount = $('#paid_amount').val();
        change_amount = paid_amount - subtotal_amount;

        $('#change_amount').val(change_amount);
        $('#change_amount_view').val(toRp(change_amount));
        

        subtotal_amount = $('#subtotal_amount_change').val();
        paid_amount = $('#paid_amount').val();
        change_amount = paid_amount - subtotal_amount;

        $('#change_amount').val(change_amount);
        $('#change_amount_view').val(toRp(change_amount));
    }

    $(document).ready(function(){
        first_key = parseInt(document.getElementById('first_key').value);
        end_key = parseInt(document.getElementById('end_key').value) + 1;
        // console.log(first_key)
        var subtotal = 0;
        
        $('body').on('input','#paid_amount',function(){

        });
        for (let i = first_key; i < end_key; i++) {
            quantity = parseInt(document.getElementById((i)+'_quantity').value) || 0;
            price = parseInt(document.getElementById((i)+'_price').value) || 0;
            // console.log(quantity);
            $('#'+i+'_price_amount').text(toRp(quantity * price));
            subtotal += quantity * price;

        }
        $('#subtotal_amount_view').text(toRp("Rp. "+subtotal));
        $('#subtotal_amount').val(subtotal);
        $('#subtotal_amount_change').val(subtotal);

        var customer_id = {!! json_encode($datases['customer_id']) !!}
        if (customer_id == null) {
            $('#customer_id').select2('val','0');
        }

        var subtotal_item = $('#subtotal_item1').val();
        $('#subtotal_item').val(subtotal_item);

        $('body').on('input','#item_code',function(){
            var item_code = $('#item_code').val();
            $.ajax({
                url: "{{ url('select-sales') }}"+'/'+item_code,
                type: "GET",
                dataType: "html",
                success:function(data)
                {
                    if (data != "") {
                        location.reload();
                        // location.reload();
                    }
                    // console.log(data);
                    // var a = JSON.parse(data);
                    // $('#table_data').html(a.item_name);
                    // console.log(a);
                }
            });
            
        });
    });

    $('body').on('input','#discount_percentage_total',function(){

        subtotal_amount = $('#subtotal_amount').val();
        discount_percentage_total = $('#discount_percentage_total').val();
        // if (discount_percentage_total == "") {
        //     discount_percentage_total = 0;
        // }
        discount_amount_total = (subtotal_amount * discount_percentage_total) / 100;
        total_amount = subtotal_amount - discount_amount_total;

        $('#subtotal_amount_view').text(toRp("Rp. "+total_amount));
        $('#subtotal_amount_change').val(total_amount);
        $('#discount_amount_total').val(discount_amount_total);
        console.log(discount_percentage_total);

        subtotal_amount = $('#subtotal_amount_change').val();
        paid_amount = $('#paid_amount').val();
        change_amount = paid_amount - subtotal_amount;

        $('#change_amount').val(change_amount);
        $('#change_amount_view').val(toRp(change_amount));
    }); 
    
    $('body').on('input','#paid_amount',function(){
        subtotal_amount = $('#subtotal_amount_change').val();
        paid_amount = $('#paid_amount').val();
        change_amount = paid_amount - subtotal_amount;

        $('#change_amount').val(change_amount);
        $('#change_amount_view').val(toRp(change_amount));
    });
 
    $('#form-prevent').on('keyup keypress', function(e) {
        var keyCode = e.keyCode || e.which;
        if (keyCode === 13) { 
            e.preventDefault();
            return false;
        }
    }); 

    function function_add_item(item_id,unit_id,item_name){

        $('#item_name').val('');
        $('#item_name').val(item_name);
        
        $.ajax({
            url: "{{ url('select-sales') }}"+'/'+item_id+'/'+unit_id,
            type: "GET",
            dataType: "html",
            success:function(data)
            {
                if (data != "") {
                    $('#item_name').val('');
                    location.reload();
                }
            }
        });
            
    }

    // $('.button-prevent').click(function(){
        
        // if  ()
        // window.open("{{ route('print-sales-invoice') }}",'_blank');
        // var myWindow=window.open('{{ route('print-sales-invoice') }}','','width=200,height=100');
            // myWindow.document.write("<p>This is 'myWindow'</p>");
            
            // myWindow.document.close();
            // myWindow.focus();
            // myWindow.print();
            // if (myWindow.click() == true) {
            //     myWindow.close();
            // }
            // setTimeout(myWindow.close(), 5000 );
        // myWindow.close();
    // });
    // $('#item_code').keyup(function(){
    //     var value = $('#item_code').val();
    //     $.ajax({
    //             type: "POST",
    //             url : "{{url('select-sales')}}",
    //             data : {
    //                 'value'     : value,
    //                 '_token'    : '{{csrf_token()}}'
    //             },
    //             success: function(msg){
    //                 console.log(msg)
    //         }
    //     });
    // });

    $(document).ready(function(){
        var msg = {!! json_encode(session('msg')) !!}
        // console.log(msg);

        if (msg != null) {
            var myWindow = window.open("{{ route('print-sales-invoice') }}",'_blank');
            myWindow.print();
        }
    });
</script>
@stop
@section('content_header')
    
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ url('home') }}">Beranda</a></li>
        <li class="breadcrumb-item"><a href="{{ url('sales-invoice') }}">Daftar Penjualan</a></li>
        <li class="breadcrumb-item active" aria-current="page">Tambah Penjualan</li>
    </ol>
  </nav>

@stop

@section('content')

<h3 class="page-title">
    Form Tambah Penjualan
</h3>
<br/>
@if(session('msg'))
<div class="alert alert-info" role="alert">
    {{session('msg')}}
</div>
@endif

@if(count($errors) > 0)
<div class="alert alert-danger" role="alert">
    @foreach ($errors->all() as $error)
              <li>{{ $error }}</li>
    @endforeach
</div>
@endif

<form action="{{ route('process-add-sales-invoice') }}" method="post" id="form-prevent">
    @csrf
    <div class="row">
        <div class="col-md-4">
            <div class="card border border-dark h-100">
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-sm-4">
                            <a class="text-dark col-form-label">Tanggal<a class='red'> *</a></a>
                        </div>
                        <div class="col-sm-8">
                            <input class="form-control input-bb" name="sales_invoice_date" id="sales_invoice_date" type="date" data-date-format="dd-mm-yyyy" autocomplete="off" value="{{ $datases['sales_invoice_date'] == '' ? date('Y-m-d') : $datases['sales_invoice_date'] }}" onchange="function_elements_add(this.name, this.value)"/>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-sm-4">
                            <a class="text-dark col-form-label">Pelanggan<a class='red'> *</a></a>
                        </div>
                        <div class="col-sm-8">
                          {!! Form::select('customer_id', $customers, $datases['customer_id'], ['class' => 'form-control selection-search-clear select-form', 'id' => 'customer_id','name' => 'customer_id','onchange'=>'function_elements_add(this.name, this.value)']) !!}
                        </div>
                    </div>
                    {{-- <div class="row mt-4">
                        <div class="col-sm-4">
                            <a class="text-dark col-form-label">Barcode</a><a class='red'> *</a></a>
                        </div>
                        <div class="col-sm-8">
                            <input class="form-control input-bb" id="item_code" autocomplete="off" autofocus />
                        </div>
                    </div> --}}
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card border border-dark h-100">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-4">
                            <a class="text-dark col-form-label">Barcode</a><a class='red'> *</a></a>
                        </div>
                        <div class="col-sm-8">
                            <input class="form-control input-bb" id="item_code" autocomplete="off" autofocus />
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-sm-4">
                            <a class="text-dark col-form-label">Nama Barang</a>
                        </div>
                        <div class="col-sm-8">
                            <input class="form-control input-bb" id="item_name" value="" autocomplete="off" data-bs-toggle="modal" data-bs-target="#staticBackdrop"/>
                            {{-- <button type="button" class="btn btn-sm btn-outline-warning" data-bs-toggle="modal" data-bs-target="#staticBackdrop{{ $row['item_stock_id'] }}">Pecah Stok</button> --}}
                              
                              <!-- Modal -->
                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel">Daftar Barang<b></b></h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="table-responsive">
                                                <table id="example" style="width:100%" class="table table-striped table-bordered table-hover table-full-width">
                                                    <thead>
                                                        <tr>
                                                            <th width="5%" style='text-align:center'>No</th>
                                                            <th width="40%" style='text-align:center'>Nama Barang</th>
                                                            <th width="40%" style='text-align:center'>Satuan</th>
                                                            <th width="15%" style='text-align:center'>Aksi</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                       <?php $no = 1; ?>
                                                       @foreach ($item_packges as $row)
                                                            @if ($row['item_unit_id'] != '')
                                                                <tr>
                                                                    <td class="text-center">{{ $no++ }}.</td>
                                                                    <td>{{ $row['item_name'] }}</td>
                                                                    <td>{{ $SalesInvoice->getItemUnitName($row['item_unit_id']) }}</td>
                                                                    <td class="text-center">
                                                                        <button type="button" data-bs-dismiss="modal" class="btn btn-success btn-sm" onclick="function_add_item({{ $row['item_id'] }} , {{ $row['item_unit_id'] }} ,'{{ $row['item_name'] }}')">Pilih</button>
                                                                    </td>
                                                                </tr>
                                                            @endif
                                                       @endforeach
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        {{-- <div class="modal-footer">
                                            <button type="reset" class="btn btn-danger" data-bs-dismiss="modal"><i class="fa fa-times"></i> Batal</button>
                                        </div> --}}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card border border-dark h-100">
                <div class="card-body">
                    <div class="text-left mb-3">
                        <div style="font-weight: bold; font-size: 25px">TOTAL</div>
                    </div>
                    <div class="text-right">
                        <div class="text-danger" style="font-weight: bold; font-size: 46px" id="subtotal_amount_view"></div>
                        <input type="text" id="subtotal_amount" name="subtotal_amount" hidden>
                        <input type="text" id="subtotal_amount_change" name="subtotal_amount_change" hidden>
                    </div>
                </div>
            </div>
        </div>
    </div>

<div class="row">
    <div class="col-md-12 mt-4">
        <div class="card border border-dark h-100">
            <div class="card-header border-dark bg-dark">
                <h5 class="mb-0 float-left">
                    Daftar Barang
                </h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-advance table-hover">
                        <thead style="text-align: center">
                            <th style="width: 5%;">No.</th>
                            {{-- <th style="width: 19%;">Kategori Barang</th> --}}
                            <th style="width: 19%;">Nama Barang</th>
                            <th style="width: 19%;">Satuan Barang</th>
                            <th style="width: 19%;">Harga Satuan</th>
                            <th style="width: 19%;">Jumlah Barang</th>
                            <th style="width: 19%;">Total</th>
                        </thead>
                        @if ($data_itemses !== null)
                            <?php 
                            $subtotal_item = 0;
                            $no = 1; 
                            ?>
                            @foreach ($data_itemses as $key=>$val)
                            <?php 
                                $subtotal_item += $val['quantity'];
                                ?>
                            <tr>
                                <td style="text-align: center">{{ $no++ }}.</td>
                                <input type="text" value="{{ $no }}" id="first_key" hidden>
                                {{-- <td>{{ $SalesInvoice->getCategoryName($val['item_category_id']) }}</td> --}}
                                <td>{{ $SalesInvoice->getItemName($val['item_id']) }}</td>
                                <td>{{ $SalesInvoice->getItemUnitName($val['item_unit_id']) }}</td>
                                <td style="text-align: right">{{ number_format($val['item_unit_price'],2,',','.') }}</td>
                                <td>
                                    <input oninput="function_change_quantity({{ $key }},{{ $no }}, this.value)" type="number" name="{{ $no }}_quantity" id="{{ $no }}_quantity" style="width: 100%; text-align: center; height: 30px; font-weight: bold; font-size: 15px" class="form-control input-bb" value="{{ $val['quantity'] }}" autocomplete="off">
                                    <input type="number" name="{{ $no }}_price" id="{{ $no }}_price" value="{{ $val['item_unit_price'] }}" hidden>
                                </td>
                                <td>
                                    <div id="{{ $no }}_price_amount" name="{{ $no }}_price_amount" class="text-right"></div>
                                    {{-- <input type="number" name="{{ $no }}_price_amount" id="{{ $no }}_price_amount" value="{{ $val['item_unit_price'] }}"> --}}
                                </td>
                            </tr>
                            @endforeach
                            <input type="text" value="{{ $no }}" id="end_key" hidden>
                            <input type="text" value="{{ $subtotal_item }}" id="subtotal_item1" hidden>
                            @else
                            <tr>
                                <td colspan="6" style="text-align: center; font-weight: bold">Data Kosong</td>
                            </tr>
                            <input type="text" value="" id="first_key" hidden>
                            <input type="text" value="" id="end_key" hidden>
                            @endif
                        </table>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4 mt-4">
        <div class="card border border-dark h-100">
            <div class="card-body">
                <div class="row mb-3">
                    <div class="col-sm-4">
                        <a class="text-dark col-form-label">Diskon (%)</a>
                    </div>
                    <div class="col-sm-8">
                        <input class="form-control input-bb" id="discount_percentage_total" name="discount_percentage_total" autocomplete="off"/>
                        <input id="discount_amount_total" name="discount_amount_total" autocomplete="off" hidden/>
                        <input type="text" value="" id="subtotal_item" name="subtotal_item" hidden>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-sm-4">
                        <a class="text-dark col-form-label">Bayar</a><a class='red'> *</a></a>
                    </div>
                    <div class="col-sm-8">
                        <input class="form-control input-bb text-right" id="paid_amount" name="paid_amount" autocomplete="off"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-sm-4">
                        <a class="text-dark col-form-label">Kembalian</a><a class='red'> *</a></a>
                    </div>
                    <div class="col-sm-8">
                        <input class="form-control input-bb text-right" id="change_amount_view" name="change_amount_view" disabled/>
                        <input class="form-control input-bb" id="change_amount" name="change_amount" hidden/>
                    </div>
                </div>
                <br>
                <div class="">
                    <div class="form-actions float-right">
                        <button type="reset" name="Reset" class="btn btn-danger" onclick="reset_add();"><i class="fa fa-times"></i> Reset Data</button>
                        <button type="submit" name="Save" class="btn btn-success button-prevent" title="Save"><i class="fa fa-check"></i> Simpan</button>
                        {{-- <a  href="{{ route('print-sales-invoice') }}" target="__blank" class="btn btn-success"><i class="fa fa-check"></i> print</a> --}}
                    </div>
                </div>
                {{-- <div class="row mb-3">
                    <div class="col-sm-4">
                        <a class="text-dark col-form-label">Barcode</a><a class='red'> *</a></a>
                    </div>
                    <div class="col-sm-8">
                        <input class="form-control input-bb" id="item_code" autofocus/>
                    </div>
                </div> --}}
            </div>
        </div>
    </div>
</form>

</div>
</div>




@stop

@section('footer')
    
@stop

@section('css')
    
@stop