<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>{{ config('app.name') }} | Print {{ $invoice_no }}</title>
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <!-- All Css -->
        <link rel="stylesheet" type="text/css" href="{{ asset('css/app.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ asset('css/api_print.css') }}">
    </head>
    <body class="A4">
        <input type="hidden" id="api_print_invoice_no" value="{{ $invoice_no }}">
        <section class="sheet padding-10mm">
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
                        <p class="mb-4" style="font-size:18px">NO. <span class="view_invoice_no"></span></p>
                        <p class="mb-0" style="font-size:18px">ต้นฉบับ</p>
                        <p class="mb-0" style="font-size:14px">วันที่ออกใบกำกับภาษี {{ date("d/m/Y") }}</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <p class="mb-0" style="font-size:14px;">นามผู้ซื้อ : <span class="view_company_name"></span></p>
                            <p class="mb-0" style="font-size:14px;">ที่อยู่ : <span class="view_company_address"></span></p>
                            <div class="d-flex justify-content-between">
                                <p class="mb-0" style="font-size:14px;">เลขประจำตัวผู้เสียภาษีอากร : <span class="view_tax_id"></span></p>
                                <p class="mb-0" style="font-size:14px;">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="view_company_type_company1">
                                        <label class="custom-control-label" for="view_company_type_company" style="font-weight: 100">สำนักงานใหญ่</label>
                                    </div>
                                </p>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="view_company_type_branch_company1">
                                        <label class="custom-control-label" for="view_company_type_branch_company" style="font-weight: 100">สาขา <span id="view_company_type_branch_company_text1"></span><label>
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
                            <table class="table table-sm table-bordered" id="view_modal_table1">
                                <thead>
                                    <tr class="text-center">
                                        <th width="15%">ลำดับที่</th>
                                        <th width="65%">รายการสินค้าหรือบริการ</th>
                                        <th width="20%">จำนวนเงิน</th>
                                    </tr>
                                </thead>
                                <tbody id="view_modal_table_tbody1"></tbody>
                                <tfoot>
                                    <tr>
                                        <td class="text-right" colspan="2">จำนวนเงินรวมทั้งสิ้น</td>
                                        <td class="text-right"><span class="view_modal_full_money"></span></td>
                                    </tr>
                                    <tr>
                                        <td class="text-right" colspan="2">จำนวนภาษีมูลค่าเพิ่ม</td>
                                        <td class="text-right"><span class="view_modal_not_vat_money"></span></td>
                                    </tr>
                                    <tr>
                                        <td class="text-right" colspan="2">ราคาสินค้าหรือบริการ</td>
                                        <td class="text-right"><span class="view_modal_vat_money"></span></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>                            
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-12">
                    <p class="mb-2" style="forn-szie:14px;">จำนวนเงินรวมทั้งสิ้น (ตัวอักษร) : <span class="view_cover_invoicebath"></span></p>
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
        </section>
        <section class="sheet padding-10mm">
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
                        <p class="mb-4" style="font-size:18px">NO. <span class="view_invoice_no"></span></p>
                        <p class="mb-0" style="font-size:18px">ก็อปปี้</p>
                        <p class="mb-0" style="font-size:14px">วันที่ออกใบกำกับภาษี {{ date("d/m/Y") }}</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <p class="mb-0" style="font-size:14px;">นามผู้ซื้อ : <span class="view_company_name"></span></p>
                            <p class="mb-0" style="font-size:14px;">ที่อยู่ : <span class="view_company_address"></span></p>
                            <div class="d-flex justify-content-between">
                                <p class="mb-0" style="font-size:14px;">เลขประจำตัวผู้เสียภาษีอากร : <span class="view_tax_id"></span></p>
                                <p class="mb-0" style="font-size:14px;">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="view_company_type_company2">
                                        <label class="custom-control-label" for="view_company_type_company" style="font-weight: 100">สำนักงานใหญ่</label>
                                    </div>
                                </p>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="view_company_type_branch_company2">
                                        <label class="custom-control-label" for="view_company_type_branch_company" style="font-weight: 100">สาขา <span id="view_company_type_branch_company_text2"></span><label>
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
                            <table class="table table-sm table-bordered" id="view_modal_table2">
                                <thead>
                                    <tr class="text-center">
                                        <th width="15%">ลำดับที่</th>
                                        <th width="65%">รายการสินค้าหรือบริการ</th>
                                        <th width="20%">จำนวนเงิน</th>
                                    </tr>
                                </thead>
                                <tbody id="view_modal_table_tbody2"></tbody>
                                <tfoot>
                                    <tr>
                                        <td class="text-right" colspan="2">จำนวนเงินรวมทั้งสิ้น</td>
                                        <td class="text-right"><span class="view_modal_full_money"></span></td>
                                    </tr>
                                    <tr>
                                        <td class="text-right" colspan="2">จำนวนภาษีมูลค่าเพิ่ม</td>
                                        <td class="text-right"><span class="view_modal_not_vat_money"></span></td>
                                    </tr>
                                    <tr>
                                        <td class="text-right" colspan="2">ราคาสินค้าหรือบริการ</td>
                                        <td class="text-right"><span class="view_modal_vat_money"></span></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>                            
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-12">
                    <p class="mb-2" style="forn-szie:14px;">จำนวนเงินรวมทั้งสิ้น (ตัวอักษร) : <span class="view_cover_invoicebath"></span></p>
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
        </section>
    </body>
        <!-- All Js -->
        <script type="text/javascript" src="{{ asset('js/app.js') }}"></script>
        <script type="text/javascript" src="{{ asset('js/page/api_print.js') }}"></script>
</html>
