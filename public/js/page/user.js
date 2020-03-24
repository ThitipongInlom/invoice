$(document).ready(function () {
    // ดึงข้อมูลใส่ table ครั้งแรก
    table_user();
    // Select 2 เพิ่มในการเลือก ประเภท user
    $('#type').select2();
    // Select 2 เพิ่มการเลือก ประเภทการใช้งานของแต่ล่ะ สิทธิ์
    $("#action").select2();
    // Select 2 เพิ่มการเลือก โรงแรม หมายโรงแรมได้
    $("#hotel").select2({
        multiple: true,
    });
});

var table_user = function table_user() {
    $.fn.dataTable.ext.errMode = 'throw';
    $('#table_user').DataTable({
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
            "url": 'api/v1/table_user',
            "type": 'get',
        },
        "columns": [{
            "data": 'username',
            "name": 'username',
        }, {
            "data": 'name',
            "name": 'name',
        }, {
            "data": 'hotel',
            "name": 'hotel',
        }, {
            "data": 'department',
            "name": 'department',
        }, {
            "data": 'type_user',
            "name": 'type_user',
        }, {
            "data": 'action',
            "name": 'action',
        }],
        "columnDefs": [{
            "className": 'text-left',
            "targets": []
        }, {
            "className": 'text-center',
            "targets": []
        }, {
            "className": 'text-right',
            "targets": []
        }, {
            "className": 'text-truncate',
            "targets": []
        }, ],
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

var Open_modal_add_user = function Open_modal_add_user() {
    $("#modal_add_user").modal('show');
    // ถ้าเกิดเปิด modal จะทำการ Clear ข้อมูลทั้งหมด
    $('#modal_add_user').on('hidden.bs.modal', function (e) {
        $("#username").val('').removeClass('is-invalid').removeClass('is-valid');
        $("#password").val('').removeClass('is-invalid').removeClass('is-valid');
        $("#name").val('').removeClass('is-invalid').removeClass('is-valid');
        $("#department").val('').removeClass('is-invalid').removeClass('is-valid');
        $("#type").val('').removeClass('is-invalid').removeClass('is-valid');
        $("#action").val('').removeClass('is-invalid').removeClass('is-valid');
        $("#hotel").val('').removeClass('is-invalid').removeClass('is-valid');
    });
}

var Open_modal_edit_user = function Open_modal_edit_user(e) {
    $("#modal_edit_user").modal('show');
    console.log(e);
}

var Oepn_modal_view_user = function Oepn_modal_view_user(e) {
    $("#modal_view_user").modal('show');
    console.log(e);
}

var Save_modal_add_user = function Save_modal_add_user() {
    var Toastr = Set_Toastr();
    var array = [
            'username',
            'password',
            'name',
            'department',
            'type',
            'action',
            'hotel'
    ];
    var check_data = Check_null_input(array);
    if (check_data == true) {
        // ถ้าทุกช่องกรอกครบ ให้ทำการ Save ได้
        var data = Set_axios_data(array);
        axios({
            method: 'post',
            url: 'api/v1/Save_add_user',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: data
        })
        .then(function (response) {
            console.log(response);
            if (response.data.status == 'success') {
                $('#table_user').DataTable().draw();
                $("#modal_add_user").modal('hide');
                Toastr[response.data.status](response.data.error_text);
            }else {
                Toastr[response.data.status](response.data.error_text);
                $("#username").removeClass('is-valid').addClass('is-invalid');
            }
        })
        .catch(function (error) {
            console.log(error);
        });
    }else {
        // ถ้าไม่มีการใส่ข้อมูลตามช่อง ให้กรอกให้ครบก่อน Save
        Toastr['error']('กรุณากรอก ข้อมูลให้ครบทุกช่อง');
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