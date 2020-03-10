<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>{{ config('app.name') }} | Tax Invoice</title>
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <!-- All Css -->
        <link rel="stylesheet" type="text/css" href="{{ asset('css/app.css') }}">
    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            @include('layout/head')
            @include('layout/menu')
                <div class="content-wrapper">
                    <section class="content-header">
                        <div class="container-fluid">
                            <div class="row mb-2">
                                <div class="col-sm-6">
                                    <h1>Tax Invoice 
                                    <button type="button" class="btn btn-sm btn-success" id="btn_create_tax_no" onclick="Create_tax_no();"><i class="fas fa-plus"></i> สร้าง Tax</button>
                                    </h1>
                                </div>
                                <div class="col-sm-6">
                                    <!--
                                    <ol class="breadcrumb float-sm-right">
                                        <li class="breadcrumb-item active">Tax Invoice</li>
                                    </ol>
                                    -->
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="content">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-row">
                                            <div class="form-group col-md-2 text-center">
                                                <b>เลขที่ใบกำกับภาษี : </b>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <input type="text" class="form-control form-control-sm" id="no_invoice" disabled>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <button type="button" class="btn btn-sm btn-secondary" onclick="Open_modal_search_address();"><i class="fas fa-search"></i> ค้นหาลูกค้า</button>
                                                <button type="button" class="btn btn-sm btn-success" onclick="Open_modal_add_address();"><i class="far fa-address-book"></i> เพิ่มข้อมูลลูกค้า</button>
                                            </div>
                                            <div class="form-group col-md-2 text-right">
                                                <b>{{ now() }}</b>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-2 text-center">
                                                <b>ชื่อ / บริษัท : </b>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <input type="text" class="form-control form-control-sm" id="company" disabled>
                                            </div>
                                            <div class="form-group col-md-2 text-center">
                                                <b>Ref : </b>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <input type="text" class="form-control form-control-sm" id="ref_no">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-2 text-center">
                                                <b>ที่อยู่ : </b>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <input type="text" class="form-control form-control-sm" id="address" disabled>
                                            </div>       
                                            <div class="form-group col-md-2 text-center">
                                                <b>Vat : </b>
                                            </div>           
                                            <div class="form-group col-md-4">
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio" id="vat_radio_1" name="vat_radio" class="custom-control-input" value="in_vat" checked>
                                                    <label class="custom-control-label" for="vat_radio_1">In Vat</label>
                                                </div>
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio" id="vat_radio_2" name="vat_radio" class="custom-control-input" value="ex_vat">
                                                    <label class="custom-control-label" for="vat_radio_2">Ex Vat</label>
                                                </div>
                                            </div>                      
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-2 text-center">
                                                <b>ประเภท : </b>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <div class="input-group input-group-sm">
                                                    <input type="text" class="form-control form-control-sm" id="company_type" disabled>              
                                                </div>                                  
                                            </div>
                                            <div class="form-group col-md-2 text-center">
                                                <b>เบอร์มือถือ : </b>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <div class="input-group input-group-sm">
                                                    <input type="text" class="form-control form-control-sm" id="phone_show" disabled>    
                                                    <input type="hidden" id="address_no">          
                                                </div>                                  
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-2 text-right">
                                                <button type="button" class="btn btn-sm btn-secondary btn-block" onclick="Open_modal_add_list_tax();"><i class="fas fa-list"></i> เพิ่ม List รายการ</button>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <div class="input-group input-group-sm">
                                                    <select class="form-control form-control-sm" id="list_item"></select>              
                                                </div>                                  
                                            </div>
                                            <div class="form-group col-md-2">
                                                <input type="number" class="form-control form-control-sm" min="1" id="money_count" placeholder="จำนวนเงิน">
                                            </div>
                                            <div class="form-group col-md-2">
                                                <button type="button" class="btn btn-sm btn-block btn-info" onclick="Add_display_item();"><i class="fas fa-plus"></i> ทำรายการเพิ่ม</button>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <button type="button" class="btn btn-sm btn-block btn-danger" onclick="Del_tbody_data_all();"><i class="fas fa-trash"></i> ล้างรายการ</button>
                                            </div>
                                        </div>
                                        <hr>
                                        <table class="table table-sm" id="table_list_menu">
                                            <thead>
                                                <tr class="text-center">
                                                    <th width='10%'>ลำดับ</th>
                                                    <th width='60%'>รายการ</th>
                                                    <th width='15%'>จำนวนเงิน</th>
                                                    <th width='15%'>เครื่องมือ</th>
                                                </tr>
                                            </thead>
                                            <tbody id="table_list_menu_body"></tbody>
                                            <tfoot id="table_list_menu_foot"><tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12 text-center">
                                                <button type="button" class="btn btn-sm btn-block btn-success" onclick="Save_invoice_on();"><i class="fas fa-save"></i> บันทึกข้อมูล</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <!-- Modal Search address -->
                <div class="modal fade" id="search_address_modal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="search_address_modalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-secondary p-2 pl-3">
                                <h5 class="modal-title" id="search_address_modalLabel"><i class="fas fa-search"></i> ค้นหาลูกค้า</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="search_select_address">เลือก บริษัท / ลูกค้า</label>
                                            <select class="form-control form-control-sm" id="search_select_address"></select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer" style="display:inline;">
                                <div class="row">
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-sm btn-block btn-danger" data-dismiss="modal"><i class="fas fa-times"></i> ยกเลิก</button>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-sm btn-block btn-success" onclick="Save_search_address();"><i class="fas fa-save"></i> บันทึกข้อมูล</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal Add address -->
                <div class="modal fade" id="add_address_modal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="add_address_modalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-success p-2 pl-3">
                                <h5 class="modal-title" id="add_address_modalLabel"><i class="far fa-address-book"></i> เพิ่มข้อมูลลูกค้า</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label for="company_name">ชื่อบริษัท / ชื่อลูกค้า</label>
                                                    <input type="text" class="form-control form-control-sm" id="company_name" placeholder="กรอก ชื่อบริษัท / ชื่อลูกค้า">                                           
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="type_address">ประเภท</label>
                                                    <select class="custom-select custom-select-sm" id="type_address">
                                                        <option value="company" selected>บริษัท</option>
                                                        <option value="customer">ลูกค้า</option>
                                                    </select>                                                
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="company_address">ที่อยู่บริษัท / ที่อยู่ลูกค้า</label>
                                            <textarea class="form-control" id="company_address" placeholder="กรอก ที่อยู่บริษัท / ที่อยู่ลูกค้า" row="3"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label for="tax_id">เลขประจำตัวผู้เสียภาษี</label>
                                                    <input type="text" class="form-control form-control-sm" id="tax_id" placeholder="กรอก เลขประจำตัวผู้เสียภาษี">                                                  
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="phone">เบอร์มือถือ</label>
                                                    <input type="text" class="form-control form-control-sm" id="phone" placeholder="กรอก เบอร์มือถือ">                                                         
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-12 text-center">
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input type="radio" id="radio_company_1" name="radio_company" class="custom-control-input" value="company" checked>
                                                        <label class="custom-control-label" for="radio_company_1">สำนักงานใหญ่</label>
                                                    </div>
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <input type="radio" id="radio_company_2" name="radio_company" class="custom-control-input" value="branch_company">
                                                        <label class="custom-control-label" for="radio_company_2">สาขา</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group branch_company">
                                        <hr>
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <input type="text" class="form-control form-control-sm" id="branch_company_on" value="0000">                                                
                                                </div>
                                                <div class="col-md-10">
                                                    <input type="text" class="form-control form-control-sm" id="branch_company_name" placeholder="สำนักงาน / เลขที่สาขา">                                                
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer" style="display:inline;">
                                <div class="row">
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-sm btn-block btn-danger" data-dismiss="modal"><i class="fas fa-times"></i> ยกเลิก</button>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-sm btn-block btn-success" onclick="Save_modal_search_address();"><i class="fas fa-save"></i> บันทึกข้อมูล</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal Add list tax -->
                <div class="modal fade" id="add_list_tax_modal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="add_list_tax_modalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-secondary p-2 pl-3">
                                <h5 class="modal-title" id="add_list_tax_modalLabel"><i class="fas fa-list"></i> เพิ่ม List รายการ</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="text" class="form-control form-control-sm" id="list_tax" placeholder="กรอก รายการ List">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer" style="display:inline;">
                                <div class="row">
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-sm btn-block btn-danger" data-dismiss="modal"><i class="fas fa-times"></i> ยกเลิก</button>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="button" class="btn btn-sm btn-block btn-success" onclick="Save_modal_add_list_tax();"><i class="fas fa-save"></i> บันทึกข้อมูล</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @include('layout/footer')
        </div>
    </body>
        <!-- All Js -->
        <script type="text/javascript" src="{{ asset('js/app.js') }}"></script>
        <script type="text/javascript" src="{{ asset('js/page/tax_invoice.js') }}"></script>
</html>
