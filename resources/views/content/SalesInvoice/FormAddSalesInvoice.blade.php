@inject('SalesInvoice','App\Http\Controllers\SalesInvoiceController' )
@extends('adminlte::page')

@section('title', 'MOZAIC Minimarket')
@section('js')
<script>
    // function function_elements_add(name, value){
    //     console.log("name " + name);
    //     console.log("value " + value);
	// 	$.ajax({
	// 			type: "POST",
	// 			url : "{{route('add-elements-purchase-return')}}",
	// 			data : {
    //                 'name'      : name, 
    //                 'value'     : value,
    //                 '_token'    : '{{csrf_token()}}'
    //             },
	// 			success: function(msg){
	// 		}
	// 	});
	// }

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

    // function processAddArraySalesInvoice(){
    //     var item_category_id		        = document.getElementById("item_category_id").value;
    //     var item_id		                    = document.getElementById("item_id").value;
    //     var item_unit_id		            = document.getElementById("item_unit_id").value;
    //     var item_unit_price		            = document.getElementById("item_unit_price").value;
    //     var quantity                        = document.getElementById("quantity").value;
    //     var subtotal_amount                 = document.getElementById("subtotal_amount").value;
    //     var discount_percentage             = document.getElementById("discount_percentage").value;
    //     var discount_amount                 = document.getElementById("discount_amount").value;
    //     var subtotal_amount_after_discount  = document.getElementById("subtotal_amount_after_discount").value;

    //     $.ajax({
    //         type: "POST",
    //         url : "{{route('add-array-sales-invoice')}}",
    //         data: {
    //             'item_category_id'                  : item_category_id,
    //             'item_id'    		                : item_id, 
    //             'item_unit_id'                      : item_unit_id,
    //             'item_unit_price'                   : item_unit_price,
    //             'quantity'                          : quantity,
    //             'subtotal_amount'                   : subtotal_amount,
    //             'discount_percentage'               : discount_percentage,
    //             'discount_amount'                   : discount_amount,
    //             'subtotal_amount_after_discount'    : subtotal_amount_after_discount,
    //             '_token'                            : '{{csrf_token()}}'
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

    function function_change_amount(key, value){
        quantity = document.getElementById((key)+'_quantity').value;
        total_price = document.getElementById((key)+'_total_price').value;
        total_amount = quantity * total_price;
        
        $('#'+key+'_total_amount').val(total_amount);
    }

    $(document).ready(function(){
        var subtotal = $('#subtotal').val();
        if (subtotal != undefined) {
            $("#subtotal_total").text(toRp("Rp. "+subtotal));
        }

        $('body').on('input','#item_code',function(){
            var item_code = $('#item_code').val();
            $.ajax({
                url: "{{ url('select-sales') }}"+'/'+item_code,
                type: "GET",
                dataType: "html",
                success:function(data)
                {
                    location.reload();
                    // var a = JSON.parse(data);
                    // $('#table_data').html(a.item_name);
                    // console.log(a);
                }
            });
        });
    });
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

<div class="row">
    <div class="col-md-4">
        <div class="card border border-dark h-100">
            <div class="card-body">
                <div class="row mb-3">
                    <div class="col-sm-4">
                        <a class="text-dark col-form-label">Tanggal<a class='red'> *</a></a>
                    </div>
                    <div class="col-sm-8">
                        <input class="form-control input-bb" name="purchase_invoice_date" id="purchase_invoice_date" type="date" data-date-format="dd-mm-yyyy" autocomplete="off" value=""/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <a class="text-dark col-form-label">Pelanggan<a class='red'> *</a></a>
                    </div>
                    <div class="col-sm-8">
                      <select class="form-control selection-search-clear"></select>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card border border-dark h-100">
            <div class="card-body">
                <div class="row mb-3">
                    <div class="col-sm-4">
                        <a class="text-dark col-form-label">Barcode<a class='red'> *</a></a>
                    </div>
                    <div class="col-sm-8">
                        <input class="form-control input-bb"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-sm-4">
                        <a class="text-dark col-form-label">Kode Barang</a><a class='red'> *</a></a>
                    </div>
                    <div class="col-sm-8">
                        <input class="form-control input-bb" id="item_code"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card border border-dark h-100">
            <div class="card-body">
                <div class="text-left mb-3">
                    <div style="font-weight: bold; font-size: 20px">TOTAL</div>
                </div>
                <div class="text-right">
                    <div class="text-danger" style="font-weight: bold; font-size: 50px" id="subtotal_total">Rp. 00,0000,00</div>
                </div>
            </div>
        </div>
    </div>
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
                            <th style="width: 20%;">Kategori Barang</th>
                            <th style="width: 20%;">Nama Barang</th>
                            <th style="width: 20%;">Satuan Barang</th>
                            <th style="width: 20%;">Jumlah Barang</th>
                        </thead>
                        @if ($dataitem !== null)
                            <?php 
                            $subtotal = 0;
                            $total_amount = 0;
                            $no = 1; 
                            ?>
                            @foreach ($dataitem as $key=>$val)
                            <tr>
                                <td style="text-align: center">{{ $no++ }}.</td>
                                <td>{{ $SalesInvoice->getCategoryName($val['item_category_id']) }}</td>
                                <td>{{ $SalesInvoice->getItemName($val['item_id']) }}</td>
                                <td>{{ $SalesInvoice->getItemUnitName($val['item_unit_id']) }}</td>
                                <td>
                                    <input type="number" name="{{ $key }}_quantity" id="{{ $key }}_quantity" style="width: 100%; text-align: center; height: 30px; font-weight: bold; font-size: 15px" class="form-control input-bb" value="{{ $val['quantity'] }}" autocomplete="off" onchange="function_change_amount({{ $key }}, this.value)">
                                    <input type="number" name="{{ $key }}_total_price" id="{{ $key }}_total_price" value="{{ $val['item_unit_price'] }}" >
                                    <input type="number" name="{{ $key }}_total_amount" id="{{ $key }}_total_amount" value="{{ $total_amount = $val['item_unit_price'] * $val['quantity']}}" >
                                     <?php $subtotal += $total_amount ?>
                                </td>
                            </tr>
                            @endforeach
                            <input type="number" name="subtotal" id="subtotal" value="{{ $subtotal }}" >
                            {{-- <input type="text" value="{{ $key }}" hidden id="key"> --}}
                        @else
                        <tr>
                            <td colspan="5" style="text-align: center; font-weight: bold">Data Kosong</td>
                        </tr>
                        @endif
                        <div id="table_data"></div>
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
                        <a class="text-dark col-form-label">Diskon (%)<a class='red'> *</a></a>
                    </div>
                    <div class="col-sm-8">
                        <input class="form-control input-bb"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-sm-4">
                        <a class="text-dark col-form-label">Bayar</a><a class='red'> *</a></a>
                    </div>
                    <div class="col-sm-8">
                        <input class="form-control input-bb" id="myText"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-sm-4">
                        <a class="text-dark col-form-label">Kembalian</a><a class='red'> *</a></a>
                    </div>
                    <div class="col-sm-8">
                        <input class="form-control input-bb" disabled/>
                    </div>
                </div>
                <br>
                <div class="">
                    <div class="form-actions float-right">
                        <button type="reset" name="Reset" class="btn btn-danger" onclick="reset_add();"><i class="fa fa-times"></i> Reset Data</button>
                        <button type="submit" name="Save" class="btn btn-success" title="Save"><i class="fa fa-check"></i> Simpan</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>




@stop

@section('footer')
    
@stop

@section('css')
    
@stop