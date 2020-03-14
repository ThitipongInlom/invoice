$(document).ready(function () {
    // ดึงข้อมูลใส่ table ครั้งแรก
    table_dashboard();
});

var table_dashboard = function table_dashboard() {
    $.fn.dataTable.ext.errMode = 'throw';
    $('#table_dashboard').DataTable({
        "processing": true,
        "serverSide": true,
        "bPaginate": true,
        "responsive": true,
        "fixedHeader": true,
        "aLengthMenu": [
            [10, 20, -1],
            ["10", "20", "ทั้งหมด"]
        ],
        "ajax": {
            "url": 'api/v1/table_dashboard',
            "type": 'get',
            "data": function (d) {
                d.hotel = $('#select_hotel').val();
            }
        },
        "columns": [{
            "data": 'invoice_no',
            "name": 'invoice_no',
        }, {
            "data": 'invoice_address',
            "name": 'invoice_address',
        }, {
            "data": 'vat_money',
            "name": 'vat_money',
            "render": function (data) {
                return formatNumber(data);
            },
        }, {
            "data": 'user_create',
            "name": 'user_create',
        }, {
            "data": 'action',
            "name": 'action',
        }],
        "columnDefs": [{
                "className": 'text-left',
                "targets": []
            }, {
                "className": 'text-center',
                "targets": [3]
            }, {
                "className": 'text-right',
                "targets": [2]
            }, {
                "className": 'text-truncate',
                "targets": []
            },
        ],
        "language": {
            "lengthMenu": "แสดง _MENU_ รายการ",
            "search": "ค้นหา:",
            "info": "แสดง _START_ ถึง _END_ ทั้งหมด _TOTAL_ รายการ",
            "infoEmpty": "แสดง 0 ถึง 0 ทั้งหมด 0 รายการ",
            "infoFiltered": "(จาก ทั้งหมด _MAX_ ทั้งหมด รายการ)",
            "processing": "กำลังโหลดข้อมูล...",
            "zeroRecords": "ไม่มีข้อมูล",
            "paginate": {
                "first": "หน้าแรก",
                "last": "หน้าสุดท้าย",
                "next": "ต่อไป",
                "previous": "ย้อนกลับ"
            },
        },
        "search": {
            "regex": true
        },
        "order": [
            [0, 'desc']
        ]
    });
}

var Change_select_hotel = function Change_select_hotel() {
    $('#table_dashboard').DataTable().draw();
}

var Api_print_invoice = function Api_print_invoice(e) {
    var imgWindow;
    var url_root = $("#url_root").val();
    var invoice_no = $(e).attr('invoice_no');
    imgWindow = window.open(url_root + '/' + 'print/' + invoice_no, "", "width=600, height=600");
}

var Open_view_invoice = function Open_view_invoice(e) {
    var Toastr = Set_Toastr();
    var data = {
        invoice_no: $(e).attr('invoice_no')
    }
    axios({
        method: 'post',
        url: 'api/v1/Open_view_invoice',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: data
    })
    .then(function (response) {
        console.log(response);
        // เซ็ตข้อมูลบน Modal
        $("#view_invoice_no").html(response.data.invoiceno);
        // ตั้งค่าส่วนหัว Table
        $(response.data.invocedata).each(function (index, value) {
            $("#view_company_name").html(value.company_name);
            $("#view_company_address").html(value.company_address);
            $("#view_tax_id").html(value.tax_id);
            // เช็คว่า เป็นสำนักงานใหญ่หรือไม่
            if (value.company_type == 'company') {
                $('#view_company_type_company').prop('checked', true);
                $('#view_company_type_branch_company').prop('checked', false);
                $("#view_company_type_branch_company_text").html('..............................');
            }else {
                $('#view_company_type_company').prop('checked', false);
                $('#view_company_type_branch_company').prop('checked', true);
                $("#view_company_type_branch_company_text").html(value.branch_company_on);
            }
        });
        // ตั้งค่าส่วน Table Tbody
        $("#view_modal_table_tbody").html('');
        $(response.data.invoiceitem).each(function (index, value) {
            var i = index + 1;
            var table = "<tr>" + 
                            "<th class='text-center'>" + i + "</th>" +
                            "<td>" + value.list_item + "</td>" +
                            "<td class='text-right' style='padding-right: 5px;'>" + formatNumber(value.money) + "</td>" +
                        "</tr>";
            $("#view_modal_table").append(table);
        });
        // ตั้งค่าส่วน Table Foot
        $(response.data.invocedata).each(function (index, value) {
            $("#view_modal_full_money").html(formatNumber(value.full_money));
            $("#view_modal_not_vat_money").html(formatNumber(value.not_vat_money));
            $("#view_modal_vat_money").html(formatNumber(value.vat_money));
        });
        //ตั้งค่าส่วน ตัวเลขที่เป็นภาษาไทย
        $("#view_cover_invoicebath").html(response.data.cover_invoicebath);
        $("#view_invoice").modal('show');
    })
    .catch(function (error) {
        console.log(error);
        Toastr['error']('ไม่สามารถเปิด ได้ เนื่องจากพบ ปัญหา หรือไม่มีข้อมูล !');
    });
}

var Open_edit_invoice = function Open_edit_invoice(e) {
    $("#save_invoice_btn_edit").attr('invoice_no', $(e).attr('invoice_no'));
    // ถ้า เป็นสิทธิ์ Admin และมี สิทธิ์ในการ Cancel ไม่ต้อง กรอก Username Password
    if ($("#user_type").val() == 'admin' || $("#user_action").val() >= '2') {
        $("#edit_invoice_username").val($("#user_username").val());
        $("#edit_invoice_password").val($("#user_username").val());
        this.Save_edit_invoice();
    } else {
        $("#edit_invoice").modal('show');
        setTimeout(function () {
            $("#edit_invoice_username").focus();
        }, 500);
    }

   $('#edit_invoice').on('hidden.bs.modal', function (e) {
       $("#edit_invoice_username").val('').removeClass('is-invalid').removeClass('is-valid');
       $("#edit_invoice_password").val('').removeClass('is-invalid').removeClass('is-valid');
   });
}

var Save_edit_invoice = function Save_edit_invoice(e) {
    var Toastr = Set_Toastr();
    var array = [
        'edit_invoice_username',
        'edit_invoice_password',
    ];
    var data = {
        username: $("#edit_invoice_username").val(),
        password: $("#edit_invoice_password").val(),
        invoice_no: $("#save_invoice_btn_edit").attr('invoice_no')
    };
    var check_data = Check_null_input(array);
    if (check_data == true) {
        axios({
            method: 'post',
            url: 'api/v1/Save_edit_invoice',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: data
        })
        .then(function (response) {
            console.log(response);
            Toastr[response.data.status](response.data.error_text);
            if (response.data.status == 'success') {
                $('#table_dashboard').DataTable().draw();
                $("#edit_invoice").modal('hide');
                window.location.href = response.data.url_edit;
            }else {
                $("#edit_invoice").modal('hide');
            }
        })
        .catch(function (error) {
            console.log(error);
        });
    }else {
        Toastr['error']('กรุณา กรอกข้อมูล ให้ครบ !');
    }
}

var Open_cancel_invoice = function Open_cancel_invoice(e) {
    $("#save_invoice_btn_cancel").attr('invoice_no', $(e).attr('invoice_no'));
    // ถ้า เป็นสิทธิ์ Admin และมี สิทธิ์ในการ Cancel ไม่ต้อง กรอก Username Password
    if ($("#user_type").val() == 'admin' || $("#user_action").val() >= '3') {
        $("#cancel_invoice_username").val($("#user_username").val());
        $("#cancel_invoice_password").val($("#user_username").val());
        this.Save_cancel_invoice();
    }else{
        $("#cancel_invoice").modal('show');
        setTimeout(function () {
            $("#cancel_invoice_username").focus();
        }, 500);
    }
    $('#cancel_invoice').on('hidden.bs.modal', function (e) {
        $("#cancel_invoice_username").val('').removeClass('is-invalid').removeClass('is-valid');
        $("#cancel_invoice_password").val('').removeClass('is-invalid').removeClass('is-valid');
    });
}

var Save_cancel_invoice = function Save_cancel_invoice() {
    var Toastr = Set_Toastr();
    var array = [
        'cancel_invoice_username',
        'cancel_invoice_password',
    ];
    var data = {
            username: $("#cancel_invoice_username").val(),
            password: $("#cancel_invoice_password").val(),
            invoice_no: $("#save_invoice_btn_cancel").attr('invoice_no')
    };
    var check_data = Check_null_input(array);
    if (check_data == true) {
        axios({
            method: 'post',
            url: 'api/v1/Save_cancel_invoice',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: data
        })
        .then(function (response) {
            console.log(response);
            $('#table_dashboard').DataTable().draw();
            $("#cancel_invoice").modal('hide');
            Toastr[response.data.status](response.data.error_text);
        })
        .catch(function (error) {
            console.log(error);
        });
    }else {
        Toastr['error']('กรุณา กรอกข้อมูล ให้ครบ !');
    }
}

var formatNumber = function formatNumber(num) {
    if (num == null) {
        return '0.00';
    }else {
        return parseFloat(num).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')
    }
}

var Set_axios_data = function Set_axios_data(array) {
    // สร้าง json
    var result = {};
    // นำ ข้อมูลจาก array แล้วให้ดึงค่าจาก id นั้นๆ ใส่ไว้ใน json
    $(array).each(function (index, value) {
        result[value] = $("#" + value).val();
    });

    return result;
}

var Check_null_input = function Check_null_input(array) {
    var success_rows = 0;
    var error_rows = 0;

    $(array).each(function (index, value) {
        function Check_null_Input() {
            if ($("#" + value).val() == '') {
                $("#" + value).removeClass('is-valid');
                $("#" + value).addClass('is-invalid');
                $("#" + value).focus();
                return false;
            } else {
                $("#" + value).removeClass('is-invalid');
                $("#" + value).addClass('is-valid');
                return true;
            }
        }
        var Check_null_Input = Check_null_Input() == true ? success_rows++ : error_rows++;
    });
    var result = success_rows == array.length ? true : false;
    return result;
}

var Set_Toastr = function Set_Toastr() {
    // Toastr Options
    Toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": true,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "3000",
        "timeOut": "3000",
        "extendedTimeOut": "3000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
    return Toastr;
}
