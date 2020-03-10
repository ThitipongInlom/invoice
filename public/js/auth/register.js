$(document).ready(function () {
    var Array_id = ['username',
                    'password',
                    'name'
    ];
    $(Array_id).each(function (index, value) {
        $("#" + value).keyup(function (event) {
            if (event.keyCode === 13) {
                Do_register();
            }
        });
    });
    // ถ้ามีการ คลิ้ก ปุ่มนี้ให้ส่งค่า
    $("#submit_login").click(function () {
        Do_register();
    });
});

var Do_register = function Do_register() {
    var Array_id = ['username',
                    'password',
                    'name'
    ];
    var Toastr = Set_Toastr();
    var Check_rows = Check_null_input(Array_id);
    var loading = Ladda.create(document.querySelector('.btn-loading'));
    loading.start();
    loading.setProgress(5);
    if (Check_rows == true) {
        loading.setProgress(50);
        var Data = new FormData();
        $(Array_id).each(function (index, value) {
            Data.append(value, $("#" + value).val());
        });
        $.ajax({
            url: 'api/v1/Do_register',
            type: 'POST',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            dataType: 'json',
            cache: false,
            contentType: false,
            processData: false,
            data: Data,
            success: function (res) {
                if (res.status == 'success') {
                    Toastr["success"](res.success_text);
                    setTimeout(function () {
                        window.location.href = res.path + '/';
                    }, 1000);
                }else{
                    Toastr["error"](res.error_text);
                }
                loading.remove();
            }
        });
    } else {
        Toastr["error"]("กรุณากรอกข้อมูลให้ครบ ทุกช่อง");
        loading.remove();
    }
}

var Check_null_input = function Check_null_input(Array_id) {
    var success_rows = 0;
    var error_rows = 0;

    $(Array_id).each(function (index, value) {
        function Check_null_Input() {
            if ($("#" + value).val() == '') {
                $("#" + value).removeClass('is-valid');
                $("#" + value).addClass('is-invalid');
                return false;
            } else {
                $("#" + value).removeClass('is-invalid');
                $("#" + value).addClass('is-valid');
                return true;
            }
        }
        var Check_null_Input = Check_null_Input() == true ? success_rows++ : error_rows++;
    });
    var result = success_rows == Array_id.length ? true : false;
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
        "hideDuration": "1000",
        "timeOut": "1000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
    return Toastr;
}