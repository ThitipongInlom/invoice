<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>{{ config('app.name') }} | Dashboard</title>
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <!-- All Css -->
        <link rel="stylesheet" type="text/css" href="{{ asset('css/app.css') }}">
    </head>
    <body class="hold-transition sidebar-mini">
        <!-- Hidden Data Setting -->
        <input type="hidden" id="url_root" value="{{ $url_root }}">
        <input type="hidden" id="user_username" value="{{ Auth::user()->username }}">
        <input type="hidden" id="user_type" value="{{ Auth::user()->type_user }}">
        <input type="hidden" id="user_action" value="{{ Auth::user()->action }}">
        <div class="wrapper">
            @include('layout/head')
            @include('layout/menu')
                <div class="content-wrapper">
                    <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>List Invoice</h1>
                            </div>
                            <div class="col-sm-6">
                                <!--
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item active">Dashboard</li>
                                </ol>
                                -->
                            </div>
                        </div>
                    </div>
                    </section>

                    <section class="content">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title"><b>ข้อมูล Invoice</b></h3>
                                <div class="card-tools">

                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table table-sm dt-responsive nowrap row-border table-bordered table-hover" cellspacing="0" cellpadding="0" id="table_dashboard" width="100%">
                                            <thead>
                                                <tr class="bg-primary">
                                                    <th>Invoice</th>
                                                    <th>Company</th>
                                                    <th>TotolVat</th>
                                                    <th>Create</th>
                                                    <th>Tool</th>
                                                </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>                                   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            @include('layout/footer')
        </div>

        <!-- Modal -->
        <div class="modal fade" id="view_invoice" tabindex="-1" role="dialog" aria-labelledby="view_invoiceLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-secondary mb-2 pb-2">
                        <h5 class="modal-title" id="view_invoiceLabel"><i class="fas fa-file-invoice"></i> ข้อมูล Invoice No</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <!-- ข้อมูล บนซ้ายมือ -->
                            <div class="col-6 col-md-7">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="mb-0" style="font-size:18px;"><b>บริษัท อัญชลีวัน จำกัด สำนักงานใหญ่</b></p>
                                        <p class="mb-0" style="font-size:16px;"><b>โรงแรม เดอะซายน์</b></p>
                                        <p class="mb-0" style="font-size:14px;">555/65 หมู่ 5 ต.นาเกลือ อ.บางละมุง จ.ชลบุรี 20150</p>
                                        <p class="mb-0" style="font-size:14px;">โทร. 038-909800-20 แฟ๊กซ์ : 038-909888</p>
                                        <p class="mb-0" style="font-size:14px;">เลขประจำตัวผู้เสียภาษีอากร 0 2055 45003 03 5 อัตราภาษีร้อนละ 7</p>
                                    </div>
                                </div>                                
                            </div>
                            <!-- ข้อมูล บนขวามือ -->
                            <div class="col-6 col-md-5 align-self-center">
                                <div class="text-center">
                                    <p class="mb-0" style="font-size:18px">ใบกำกับภาษี/ใบเสร็จรับเงิน</p>
                                    <p class="mb-5" style="font-size:18px">NO. <span id="view_invoice_no"></span></p>
                                    <p class="mb-0" style="font-size:14px">วันที่ออกใบกำกับภาษี {{ date("d/m/Y") }}</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="mb-0" style="font-size:14px;">นามผู้ซื้อ : <span id="view_company_name"></span></p>
                                        <p class="mb-0" style="font-size:14px;">ที่อยู่ : <span id="view_company_address"></span></p>
                                        <div class="d-flex justify-content-between">
                                            <p class="mb-0" style="font-size:14px;">เลขประจำตัวผู้เสียภาษีอากร : <span id="view_tax_id"></span></p>
                                            <p class="mb-0" style="font-size:14px;">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="view_company_type_company">
                                                    <label class="custom-control-label" for="view_company_type_company" style="font-weight: 100">สำนักงานใหญ่</label>
                                                </div>
                                            </p>
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="view_company_type_branch_company">
                                                    <label class="custom-control-label" for="view_company_type_branch_company" style="font-weight: 100">สาขา <span id="view_company_type_branch_company_text"></span><label>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-md-12">
                                <div class="card">
                                    <div class="card-body p-0">
                                        <table class="table table-sm table-bordered" id="view_modal_table">
                                            <thead>
                                                <tr class="text-center">
                                                    <th width="15%">ลำดับที่</th>
                                                    <th width="65%">รายการสินค้าหรือบริการ</th>
                                                    <th width="20%">จำนวนเงิน</th>
                                                </tr>
                                            </thead>
                                            <tbody id="view_modal_table_tbody"></tbody>
                                            <tfoot>
                                                <tr>
                                                    <td class="text-right" colspan="2">จำนวนเงินรวมทั้งสิ้น</td>
                                                    <td class="text-right"><span id="view_modal_full_money"></span></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right" colspan="2">จำนวนภาษีมูลค่าเพิ่ม</td>
                                                    <td class="text-right"><span id="view_modal_not_vat_money"></span></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right" colspan="2">ราคาสินค้าหรือบริการ</td>
                                                    <td class="text-right"><span id="view_modal_vat_money"></span></td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>                            
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-md-12">
                                <p class="mb-2" style="forn-szie:14px;">จำนวนเงินรวมทั้งสิ้น (ตัวอักษร) : <span id="view_cover_invoicebath"></span></p>
                                <div class="d-flex justify-content-end">
                                    <p class="mb-0" style="forn-szie:14px;">ลงชื่อ  .......................................  ผู้รับเงิน</p>
                                </div>
                                <div class="d-flex justify-content-end">
                                    <p class="mb-2" style="forn-szie:14px;">(  ...........................................................  )</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <p class="mb-0" style="font-size:14px"><b>ในกรณีชำระเป็นเช็ค ใบเสร็จฉบับนี้จะสมบูรณ์ก็ต่อเมื่อเรียกเก็บเงินตามเช็คได้เรียบร้อยแล้ว</b></p>
                        </div>
                    </div>
                    <div class="modal-footer" style="display:inline;">
                        <div class="row">
                            <div class="col-12">
                                <button type="button" class="btn btn-block btn-sm btn-danger" data-dismiss="modal">ปิด</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="edit_invoice" tabindex="-1" role="dialog" aria-labelledby="edit_invoiceLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-warning mb-2 pb-2">
                        <h5 class="modal-title" id="edit_invoiceLabel"><i class="fas fa-file-invoice"></i> แก้ไข ใบกำกับภาษี/ใบเสร็จรับเงิน</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-6 col-md-6">
                                <div class="form-group">
                                    <label for="edit_invoice_username">ใส่ Username เพื่อแก้ไข</label>
                                    <input type="text" class="form-control form-control-sm" id="edit_invoice_username">
                                </div>                               
                            </div>
                            <div class="col-6 col-md-6">
                                <div class="form-group">
                                    <label for="edit_invoice_password">ใส่ Password เพื่อแก้ไข</label>
                                    <input type="password" class="form-control form-control-sm" id="edit_invoice_password">
                                </div>                               
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="display:inline;">
                        <div class="row">
                            <div class="col-12 col-md-12">
                                <button type="button" class="btn btn-sm btn-block btn-warning" id="save_invoice_btn_edit" onclick="Save_edit_invoice(this);"><i class="far fa-edit"></i> ยืนยันการยกเลิก</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Cancel -->
        <div class="modal fade" id="cancel_invoice" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-danger mb-2 pb-2">
                        <h5 class="modal-title" id="cancel_invoiceLabel"><i class="fas fa-file-invoice"></i> ยกเลิก ใบกำกับภาษี/ใบเสร็จรับเงิน</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-6 col-md-6">
                                <div class="form-group">
                                    <label for="cancel_invoice_username">ใส่ Username เพื่อยกเลิก</label>
                                    <input type="text" class="form-control form-control-sm" id="cancel_invoice_username">
                                </div>                               
                            </div>
                            <div class="col-6 col-md-6">
                                <div class="form-group">
                                    <label for="cancel_invoice_password">ใส่ Password เพื่อยกเลิก</label>
                                    <input type="password" class="form-control form-control-sm" id="cancel_invoice_password">
                                </div>                               
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="display:inline;">
                        <div class="row">
                            <div class="col-6 col-md-6">
                                <button type="button" class="btn btn-sm btn-block btn-danger" data-dismiss="modal"><i class="fas fa-times"></i> ปิด</button>
                            </div>
                            <div class="col-6 col-md-6">
                                <button type="button" class="btn btn-sm btn-block btn-success" id="save_invoice_btn_cancel" onclick="Save_cancel_invoice();"><i class="fas fa-check"></i> ยืนยันการยกเลิก</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
        <!-- All Js -->
        <script type="text/javascript" src="{{ asset('js/app.js') }}"></script>
        <script type="text/javascript" src="{{ asset('js/page/dashboard.js') }}"></script>
</html>
