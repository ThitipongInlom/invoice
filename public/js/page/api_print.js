var data = {
    invoice_no: $("#api_print_invoice_no").val()
}
axios({
    method: 'post',
    url: '../api/v1/Api_print_invoice',
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    },
    data: data
})
.then(function (response) {
    console.log(response);
    // เซ็ตข้อมูลบน Modal
    $(".view_invoice_no").html(response.data.invoiceno);
    // ตั้งค่าส่วนหัว Table
    $(response.data.invocedata).each(function (index, value) {
        $(".view_company_name").html(value.company_name);
        $(".view_company_address").html(value.company_address);
        $(".view_tax_id").html(value.tax_id);
        // เช็คว่า เป็นสำนักงานใหญ่หรือไม่
        if (value.company_type == 'company') {
            // ใบภาษี ต้นฉบับ
            $('#view_company_type_company1').prop('checked', true);
            $('#view_company_type_branch_company1').prop('checked', false);
            $("#view_company_type_branch_company_text1").html('..............................');
            // ใบภาษี ก็อปปี้
            $('#view_company_type_company2').prop('checked', true);
            $('#view_company_type_branch_company2').prop('checked', false);
            $("#view_company_type_branch_company_text2").html('..............................');
        } else {
            // ใบภาษี ต้นฉบับ
            $('#view_company_type_company1').prop('checked', false);
            $('#view_company_type_branch_company1').prop('checked', true);
            $("#view_company_type_branch_company_text1").html(value.branch_company_on);
            // ใบภาษี ก็อปปี้
            $('#view_company_type_company2').prop('checked', false);
            $('#view_company_type_branch_company2').prop('checked', true);
            $("#view_company_type_branch_company_text2").html(value.branch_company_on);
        }
    });
    // ตั้งค่าส่วน Table Tbody
    $("#view_modal_table_tbody1").html('');
    $(response.data.invoiceitem).each(function (index, value) {
        var i = index + 1;
        var table = "<tr>" +
            "<th class='text-center'>" + i + "</th>" +
            "<td>" + value.list_item + "</td>" +
            "<td class='text-right' style='padding-right: 5px;'>" + formatNumber(value.money) + "</td>" +
            "</tr>";
        $("#view_modal_table1").append(table);
    });
    $("#view_modal_table_tbody2").html('');
    $(response.data.invoiceitem).each(function (index, value) {
        var i = index + 1;
        var table = "<tr>" +
            "<th class='text-center'>" + i + "</th>" +
            "<td>" + value.list_item + "</td>" +
            "<td class='text-right' style='padding-right: 5px;'>" + formatNumber(value.money) + "</td>" +
            "</tr>";
        $("#view_modal_table2").append(table);
    });
    // เพิ่มช่องว่าง
    var count_td_blank = parseInt(21) - parseInt(response.data.invoiceitem.length);
    for (i_bank = 1; i_bank < count_td_blank; i_bank++) {
        var table_blank = "<tr>" +
            "<th class='text-center'>&nbsp</th>" +
            "<td></td>" +
            "<td class='text-right' style='padding-right: 5px;'></td>" +
            "</tr>";
        $("#view_modal_table1").append(table_blank);
        $("#view_modal_table2").append(table_blank);
    }
    // ตั้งค่าส่วน Table Foot
    $(response.data.invocedata).each(function (index, value) {
        $(".view_modal_full_money").html(formatNumber(value.full_money));
        $(".view_modal_not_vat_money").html(formatNumber(value.not_vat_money));
        $(".view_modal_vat_money").html(formatNumber(value.vat_money));
    });
    //ตั้งค่าส่วน ตัวเลขที่เป็นภาษาไทย
    $(".view_cover_invoicebath").html(response.data.cover_invoicebath);

    window.print();
    window.onafterprint = window.close();
})
.catch(function (error) {
    console.log(error);
});

var formatNumber = function formatNumber(num) {
    return parseFloat(num).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')
}