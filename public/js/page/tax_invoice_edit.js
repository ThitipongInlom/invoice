$(document).ready(function () {
    Get_tbody_data();
    $(".branch_company").hide();
    $('input[type=radio][name=vat_radio]').change(function () {
        Get_tbody_data();
    });
});

$("#list_item").select2({
    theme: 'bootstrap4',
    placeholder: "เลือก List รายการ",
    ajax: {
        url: '../api/v1/Get_list_tax',
        dataType: 'json',
        data: function (params) {
            var query = {
                text: params.term,
            }
            return query;
        }
    },
    cache: true,
    formatResult: format,
    formatSelection: format,
    escapeMarkup: function (m) {
        return m;
    }
});

$("#type_address").select2({
    theme: 'bootstrap4'
});

var Open_modal_search_address = function Open_modal_search_address() {
    $("#search_address_modal").modal('show');
    $("#search_select_address").select2({
        theme: 'bootstrap4',
        placeholder: "เลือก บริษัท / ลูกค้า",
        ajax: {
            url: '../api/v1/Get_address',
            dataType: 'json',
            data: function (params) {
                var query = {
                    text: params.term,
                }
                return query;
            }
        },
        cache: true,
        formatResult: format,
        formatSelection: format,
        escapeMarkup: function (m) {
            return m;
        }
    });
    $('#search_address_modal').on('hidden.bs.modal', function (e) {
        $("#search_select_address").val('').removeClass('is-valid').removeClass('is-invalid');
    });
}

var Save_search_address = function Save_search_address() {
    var Toastr = Set_Toastr();
    var value = $("#search_select_address").val();
    if (value != null) {
        var data = {
            search_select_address: $("#search_select_address").val(),
        };
        axios({
                method: 'post',
                url: '../api/v1/Set_data_display',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                data: data
            })
            .then(function (response) {
                console.log(response);
                $("#company").val(response.data.results.company_name);
                $("#address").val(response.data.results.company_address);
                $("#company_type").val(response.data.results.type_address);
                $("#phone_show").val(response.data.results.phone);
                $("#address_no").val(response.data.results.address_id);
                $("#search_address_modal").modal('hide');
            })
            .catch(function (error) {
                console.log(error);
            });
    } else {
        Toastr["error"]("กรุณาเลือก บริษัท / ลูกค้า");
    }
}

var Edit_invoice_on = function Edit_invoice_on() {
    var Toastr = Set_Toastr();
    if ($("#no_invoice").val() == '') {
        Toastr["error"]("กรุณา สร้าง Tax No");
    } else if ($("#company").val() == '' || $("#address").val() == '') {
        Toastr["error"]("กรุณาเลือก บริษัท / ลูกค้า");
    } else if ($(".tbody_data").length == '0') {
        Toastr["error"]("กรุณา เพิ่มรายการ");
    } else {
        var data = {
            no_invoice: $("#no_invoice").val(),
            ref_no: $("#ref_no").val(),
            company: $("#company").val(),
            address: $("#address").val(),
            type_vat: $("input[name=vat_radio]:checked").val(),
            full_money: $("#full_money").text(),
            not_vat_money: $("#not_vat_money").text(),
            vat_money: $("#vat_money").text(),
            address_no: $("#address_no").val()
        };
        axios({
                method: 'post',
                url: '../api/v1/Edit_invoice_on',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                data: data
            })
            .then(function (response) {
                console.log(response);
                window.location.href = response.data.path + '/';
            })
            .catch(function (error) {
                console.log(error);
            });
    }
}

var Open_modal_add_address = function Open_modal_add_address() {
    $("#add_address_modal").modal('show');
    $('input:radio[name="radio_company"]').change(
        function () {
            if ($(this).val() == 'branch_company') {
                $(".branch_company").show();
            } else {
                $(".branch_company").hide();
            }
        });
    $('#add_address_modal').on('hidden.bs.modal', function (e) {
        $("#company_name").val('').removeClass('is-valid').removeClass('is-invalid');
        $("#type_address").val('').removeClass('is-valid').removeClass('is-invalid');
        $("#company_address").val('').removeClass('is-valid').removeClass('is-invalid');
        $("#tax_id").val('').removeClass('is-valid').removeClass('is-invalid');
        $("#phone").val('').removeClass('is-valid').removeClass('is-invalid');
        $(".branch_company").hide();
        $("[name=radio_company]").val(["company"]);
    });
}

var Save_modal_search_address = function Save_modal_search_address() {
    var Array_id = ['company_name',
        'type_address',
        'company_address',
        'tax_id',
        'phone'
    ];
    var Toastr = Set_Toastr();
    var Check_rows = Check_null_input(Array_id);
    if (Check_rows == true) {
        var data = {
            company_name: $("#company_name").val(),
            type_address: $("#type_address").val(),
            company_address: $("#company_address").val(),
            tax_id: $("#tax_id").val(),
            phone: $("#phone").val(),
            company_type: $('input:radio[name="radio_company"]:checked').val(),
            branch_company_on: $("#branch_company_on").val(),
            branch_company_name: $("#branch_company_name").val()
        };
        axios({
                method: 'post',
                url: '../api/v1/Save_search_address',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                data: data
            })
            .then(function (response) {
                console.log(response);
                if (response.data.status == 'success') {
                    Toastr["success"](response.data.error_text);
                    $("#add_address_modal").modal('hide');
                } else {
                    Toastr["error"](response.data.error_text);
                    $("#company_name").removeClass('is-valid').addClass('is-invalid');
                }
            })
            .catch(function (error) {
                console.log(error);
            });
    } else {
        Toastr["error"]("กรุณากรอกข้อมูลให้ครบ ทุกช่อง");
    }
}

var Open_modal_add_list_tax = function Open_modal_add_list_tax() {
    $("#add_list_tax_modal").modal('show');
    $('#add_list_tax_modal').on('hidden.bs.modal', function (e) {
        $("#list_tax").val('').removeClass('is-valid').removeClass('is-invalid');
    });
}

var Save_modal_add_list_tax = function Save_modal_add_list_tax() {
    var Array_id = ['list_tax'];
    var Toastr = Set_Toastr();
    var Check_rows = Check_null_input(Array_id);
    if (Check_rows == true) {
        var data = {
            list_tax: $("#list_tax").val()
        };
        axios({
            method: 'post',
            url: '../api/v1/Save_add_list_tax',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: data
        })
        .then(function (response) {
            console.log(response);
            if (response.data.status == 'success') {
                $("#add_list_tax_modal").modal('hide');
            }
        })
        .catch(function (error) {
            console.log(error);
        });
    } else {
        Toastr["error"]("กรุณากรอกข้อมูลให้ครบ");
        $("#list_tax").focus();
    }
}

var Open_modal_history = function Open_modal_history() {
    $("#history_modal").modal('show');
    var data = {
        no_invoice: $("#no_invoice").val()
    };
    axios({
        method: 'post',
        url: '../api/v1/Get_log_invoice',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: data
    })
    .then(function (response) {
        console.log(response);
        $("#history_table_body").html('');
        $(response.data.result).each(function (index, value) {
            console.log(value);
            // Table
            var log_data_new = value.log_data_new;
            var table = "<tr class='text-center' style='cursor:pointer;' data='" + log_data_new + "' onclick='History_textarea(this);'><td>" + value.log_id + "</td><td>" + value.log_action + "</td><td>" + value.created_at + "</td><td>" + value.log_username + "</td></tr>";
            $("#history_table").append(table);
            // Set textarea
        });
    })
    .catch(function (error) {
        console.log(error);
    });

    $('#history_modal').on('hidden.bs.modal', function (e) {
        $("#history_textarea").html('');
    });
}

var History_textarea = function History_textarea(e) {
    $("#history_textarea").html('');
    var check_data = $(e).attr('data');
    var data_textarea;
    var log_data_new = JSON.parse(check_data);
    if (check_data == 'null') {
        data_textarea = "null";
        $("#history_textarea").append(data_textarea);
    } else {
        $.each(log_data_new, function (index, value) {
            data_textarea = index + "  =>  " + value + "<br>";
            $("#history_textarea").append(data_textarea);
        });
    }
}

var Add_display_item = function Add_display_item() {
    var Toastr = Set_Toastr();
    if ($("#no_invoice").val() == '') {
        Toastr["error"]("กรุณาสร้าง Tax No");
    } else if ($("#list_item").val() == '' || $("#list_item").val() == null) {
        Toastr["error"]("กรุณา เลือก List รายการ");
    } else if ($("#money_count").val() == '' || $("#money_count").val() == null) {
        Toastr["error"]("กรุณา กรอกจำนวนเงิน");
        $("#money_count").focus();
    } else {
        var data = {
            list_item: $("#list_item").val(),
            money_count: $("#money_count").val(),
            no_invoice: $("#no_invoice").val()
        };
        axios({
                method: 'post',
                url: '../api/v1/Save_invoice_item',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                data: data
            })
            .then(function (response) {
                console.log(response);
                Get_tbody_data();
                $("#list_item").val('').text('');
                $("#money_count").val('');
            })
            .catch(function (error) {
                console.log(error);
            });
    }
}

var Get_tbody_data = function Get_tbody_data() {
    var data = {
        no_invoice: $("#no_invoice").val()
    };
    axios({
            method: 'post',
            url: '../api/v1/Get_tbody_data',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: data
        })
        .then(function (response) {
            console.log(response);
            var no = 1;
            $("#table_list_menu_body").html("");
            if (response.data.results.length == 0) {
                var table = "<tr class='tbody_data'>" +
                    "<td class='text-center' colspan='4'>ไม่มีข้อมูล</td>" +
                    "</tr>";
                $("#table_list_menu_body").append(table);
            } else {
                $(response.data.results).each(function (index, value) {
                    var btn = "<button class='btn btn-sm btn-danger' invoiceitem_id='" + value.invoiceitem_id + "' onclick='Del_tbody_data_item(this);'><i class='fas fa-trash'></i> ลบ</button>";
                    var table = "<tr class='tbody_data'>" +
                        "<td class='text-center'>" + no + "</td>" +
                        "<td class='text-left'>" + value.list_item + "</td>" +
                        "<td class='text-right'>" + value.money + "</td>" +
                        "<td class='text-right'>" + btn + "</td>" +
                        "</tr>";
                    $("#table_list_menu_body").append(table);
                    no++;
                });
            }
            Get_tfoot_data(response.data);
        })
        .catch(function (error) {
            console.log(error);
        });
}

var Get_tfoot_data = function Get_tfoot_data(e) {
    var sum_money = e.sum_money;
    var full_money = e.sum_money;
    var not_vat_money = sum_money - (sum_money * 7 / 107);
    var vat_money = (sum_money * 7 / 107);
    var vat_7 = (sum_money * 7 / 100);
    var monry_vat = sum_money + vat_7;
    $("#table_list_menu_foot").html("");

    var table_ex = "<tr class='text-right table-secondary'>" +
        "<td colspan='2'></td>" +
        "<td>รวมเงิน</td>" +
        "<td><b id='full_money'>" + not_vat_money.toFixed(2) + "</b> บาท</td>" +
        "</tr>" +
        "<tr class='text-right table-secondary'>" +
        "<td colspan='2'></td>" +
        "<td class='text-right'>ภาษีมูลค่าเพิ่ม 7%</td>" +
        "<td><b id='not_vat_money'>" + vat_money.toFixed(2) + "</b> บาท</td>" +
        "</tr>" +
        "<tr class='text-right table-secondary'>" +
        "<td colspan='2'></td>" +
        "<td class='text-right'>ยอดเงินรับสุทธิ</td>" +
        "<td><b id='vat_money'>" + full_money + "</b> บาท</td>" +
        "</tr>";
    var table_in = "<tr class='text-right table-secondary'>" +
        "<td colspan='2'></td>" +
        "<td>รวมเงิน</td>" +
        "<td><b id='full_money'>" + full_money.toFixed(2) + "</b> บาท</td>" +
        "</tr>" +
        "<tr class='text-right table-secondary'>" +
        "<td colspan='2'></td>" +
        "<td class='text-right'>ภาษีมูลค่าเพิ่ม 7%</td>" +
        "<td><b id='not_vat_money'>" + vat_7.toFixed(2) + "</b> บาท</td>" +
        "</tr>" +
        "<tr class='text-right table-secondary'>" +
        "<td colspan='2'></td>" +
        "<td class='text-right'>ยอดเงินรับสุทธิ</td>" +
        "<td><b id='vat_money'>" + monry_vat + "</b> บาท</td>" +
        "</tr>";
    if (sum_money > 0) {
        if ($("input[name=vat_radio]:checked").val() == 'ex_vat') {
            $("#table_list_menu_foot").append(table_ex);
        } else {
            $("#table_list_menu_foot").append(table_in);
        }
    }
}

var Del_tbody_data_item = function Del_tbody_data_item(e) {
    var data = {
        invoiceitem_id: $(e).attr('invoiceitem_id')
    };
    axios({
            method: 'post',
            url: '../api/v1/Del_tbody_data_item',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: data
        })
        .then(function (response) {
            console.log(response);
            Get_tbody_data();
        })
        .catch(function (error) {
            console.log(error);
        });
}

var Del_tbody_data_all = function Del_tbody_data_all() {
    var data = {
        no_invoice: $("#no_invoice").val()
    };
    axios({
            method: 'post',
            url: '../api/v1/Del_tbody_data_all',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: data
        })
        .then(function (response) {
            console.log(response);
            Get_tbody_data();
        })
        .catch(function (error) {
            console.log(error);
        });
}

var format = function format(x) {
    return x.text;
}

var Check_null_input = function Check_null_input(Array_id) {
    var success_rows = 0;
    var error_rows = 0;

    $(Array_id).each(function (index, value) {
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