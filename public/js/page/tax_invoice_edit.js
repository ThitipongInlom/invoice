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

var Save_search_address = function Save_search_address(e) {
    var Toastr = Set_Toastr();
    var value = $(e).attr('address_id');
    if (value != null) {
        if ($("#no_invoice").val() == '') {
            setTimeout(function () {
                this.Save_search_address_update(e);
            }, 500);
        } else {
            this.Save_search_address_update(e);
            Toastr["success"]("อัพเดต บริษัท / ลูกค้า เสร็จสิ้น");
        }
    } else {
        Toastr["error"]("กรุณาเลือก บริษัท / ลูกค้า");
    }
}

var Save_search_address_update = function Save_search_address_update(e) {
    var data = {
        search_select_address: $(e).attr('address_id'),
        no_invoice: $("#no_invoice").val(),
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
            $(response.data.results).each(function (index, value) {
                $("#company").val(value.company_name);
                $("#address").val(value.company_address);
                $("#company_type").val(value.type_address);
                $("#phone_show").val(value.phone);
                $("#address_no").val(value.address_id);
            });
            $("#table_list_address_modal").modal('hide');
        })
        .catch(function (error) {
            console.log(error);
        });

    return;
}

var Open_modal_add_address = function Open_modal_add_address() {
    $("#table_list_address_modal").modal('hide');
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

var Open_modal_edit_address = function Open_modal_edit_address(e) {
    var Toastr = Set_Toastr();
    $("#table_list_address_modal").modal('hide');
    $('input:radio[name="edit_radio_company"]').change(
        function () {
            if ($(this).val() == 'branch_company') {
                $(".branch_company_edit").show();
            } else {
                $(".branch_company_edit").hide();
            }
        });
    var data = {
        address_id: $(e).attr('address_id'),
    };
    axios({
        method: 'post',
        url: '../api/v1/Get_edit_address',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: data
    })
    .then(function (response) {
        console.log(response);
        Toastr[response.data.status](response.data.error_text);
        if (response.data.status == 'success') {
            $.each(response.data.result, function (key, value) {
                $("#btn_modal_search_address_edit").attr('address_id', value.address_id);
                $("#edit_company_name").val(value.company_name);
                $("#edit_type_address").val(value.type_address);
                $("#edit_company_address").val(value.company_address);
                $("#edit_tax_id").val(value.tax_id);
                $("#edit_phone").val(value.phone);
                $('input:radio[name="edit_radio_company"]').filter('[value="' + value.company_type + '"]').attr('checked', true);
                if (value.company_type == 'branch_company') {
                    $(".branch_company_edit").show();
                } else {
                    $(".branch_company_edit").hide();
                }
                $("#edit_branch_company_on").val(value.branch_company_on);
                $("#edit_branch_company_name").val(value.branch_company_name);
            });
            $("#edit_address_modal").modal('show');
        }
    })
    .catch(function (error) {
        console.log(error);
    });

    $('#edit_address_modal').on('hidden.bs.modal', function (e) {
        $("#edit_company_name").val('').removeClass('is-valid').removeClass('is-invalid');
        $("#edit_type_address").val('').removeClass('is-valid').removeClass('is-invalid');
        $("#edit_company_address").val('').removeClass('is-valid').removeClass('is-invalid');
        $("#edit_tax_id").val('').removeClass('is-valid').removeClass('is-invalid');
        $("#edit_phone").val('').removeClass('is-valid').removeClass('is-invalid');
        $(".branch_company_edit").hide();
        $("[name=edit_radio_company]").attr('checked', false);
    });
}

var Open_modal_table_list_address = function Open_modal_table_list_address() {
    var data = {
        table_address_search: $("#table_address_search").val()
    }
    axios({
        method: 'post',
        url: '../api/v1/Get_list_address',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: data,
    })
    .then(function (response) {
        console.log(response);
        $("#table_list_address_body").html('');
        var i = 1;
        $.each(response.data.result, function (key, value) {
            var btn_gen = '<button class="btn btn-sm btn-success" address_id="' + value.address_id + '" id="search_select_address" onclick="Save_search_address(this);"><i class="fas fa-hand-pointer"></i> ใช้งาน</button> ';
            var btn_edit = '<button class="btn btn-sm btn-warning" address_id="' + value.address_id + '" onclick="Open_modal_edit_address(this);"><i class="fas fa-edit"></i> แก้ไข</button>';
            var btn_del = '<button class="btn btn-sm btn-danger" address_id="' + value.address_id + '"  onclick="del_address_modal(this);"><i class="fas fa-trash"></i> ลบ</button>';
            var table = "<tr>" +
                "<td class='text-center'>" + i + "</td>" +
                "<td>" + value.company_name + "</td>" +
                "<td>" + value.company_address + "</td>" +
                "<td class='text-center'>" + btn_gen + " " + btn_edit + " " + btn_del + "</td>" +
                "</tr>";

            $("#table_list_address_body").append(table);
            i++;
        });
    })
    .catch(function (error) {
        console.log(error);
    });
    // เช็คว่ามีการเปิด Modal หรอไม่ ถ้าไม่มี ให้ทำการเปิด Modal
    if ($('#table_list_address_modal').hasClass('in') == false) {
        $("#table_list_address_modal").modal('show');
    }
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

var Open_modal_edit_address = function Open_modal_edit_address(e) {
    var Toastr = Set_Toastr();
    $("#table_list_address_modal").modal('hide');
    $('input:radio[name="edit_radio_company"]').change(
        function () {
            if ($(this).val() == 'branch_company') {
                $(".branch_company_edit").show();
            } else {
                $(".branch_company_edit").hide();
            }
        });
    var data = {
        address_id: $(e).attr('address_id'),
    };
    axios({
        method: 'post',
        url: '../api/v1/Get_edit_address',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: data
    })
    .then(function (response) {
        console.log(response);
        Toastr[response.data.status](response.data.error_text);
        if (response.data.status == 'success') {
            $.each(response.data.result, function (key, value) {
                $("#btn_modal_search_address_edit").attr('address_id', value.address_id);
                $("#edit_company_name").val(value.company_name);
                $("#edit_type_address").val(value.type_address);
                $("#edit_company_address").val(value.company_address);
                $("#edit_tax_id").val(value.tax_id);
                $("#edit_phone").val(value.phone);
                $('input:radio[name="edit_radio_company"]').filter('[value="' + value.company_type + '"]').attr('checked', true);
                if (value.company_type == 'branch_company') {
                    $(".branch_company_edit").show();
                } else {
                    $(".branch_company_edit").hide();
                }
                $("#edit_branch_company_on").val(value.branch_company_on);
                $("#edit_branch_company_name").val(value.branch_company_name);
            });
            $("#edit_address_modal").modal('show');
        }
    })
    .catch(function (error) {
        console.log(error);
    });

    $('#edit_address_modal').on('hidden.bs.modal', function (e) {
        $("#edit_company_name").val('').removeClass('is-valid').removeClass('is-invalid');
        $("#edit_type_address").val('').removeClass('is-valid').removeClass('is-invalid');
        $("#edit_company_address").val('').removeClass('is-valid').removeClass('is-invalid');
        $("#edit_tax_id").val('').removeClass('is-valid').removeClass('is-invalid');
        $("#edit_phone").val('').removeClass('is-valid').removeClass('is-invalid');
        $(".branch_company_edit").hide();
        $("[name=edit_radio_company]").attr('checked', false);
    });
}

var Save_modal_search_address_edit = function Save_modal_search_address_edit(e) {
    var Array_id = ['edit_company_name',
        'edit_type_address',
        'edit_company_address',
        'edit_tax_id',
        'edit_phone'
    ];
    var Toastr = Set_Toastr();
    var Check_rows = Check_null_input(Array_id);
    if (Check_rows == true) {
        var data = {
            address_id: $(e).attr('address_id'),
            company_name: $("#edit_company_name").val(),
            type_address: $("#edit_type_address").val(),
            company_address: $("#edit_company_address").val(),
            tax_id: $("#edit_tax_id").val(),
            phone: $("#edit_phone").val(),
            company_type: $('input:radio[name="edit_radio_company"]:checked').val(),
            branch_company_on: $("#edit_branch_company_on").val(),
            branch_company_name: $("#edit_branch_company_name").val()
        };
        axios({
            method: 'post',
            url: '../api/v1/Save_search_address_edit',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: data
        })
        .then(function (response) {
            console.log(response);
            Toastr[response.data.status](response.data.error_text);
            $("#edit_address_modal").modal('hide');
        })
        .catch(function (error) {
            console.log(error);
        });
    } else {
        Toastr["error"]("กรุณากรอกข้อมูลให้ครบ ทุกช่อง");
    }
}

var Save_modal_del_list_tax = function Save_modal_del_list_tax(e) {
    var Toastr = Set_Toastr();
    var data = {
        list_id: $(e).attr('list_id'),
    };
    axios({
        method: 'post',
        url: '../api/v1/Save_modal_del_list_tax',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: data
    })
    .then(function (response) {
        console.log(response);
        Toastr[response.data.status](response.data.error_text);
        if (response.data.status == 'success') {
            $("#table_list_tax_modal").modal('hide');
        }
    })
    .catch(function (error) {
        console.log(error);
    });
}

var Save_modal_del_address = function Save_modal_del_address(e) {
    var Toastr = Set_Toastr();
    var data = {
        address_id: $(e).attr('address_id'),
    };
    axios({
        method: 'post',
        url: '../api/v1/Save_modal_del_address',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: data
    })
    .then(function (response) {
        console.log(response);
        Toastr[response.data.status](response.data.error_text);
        if (response.data.status == 'success') {
            $("#del_address_modal").modal('hide');
        }
    })
    .catch(function (error) {
        console.log(error);
    });
}

var Open_modal_table_list_tax = function Open_modal_table_list_tax() {
    var data = {
        table_list_tax_search: $("#table_list_tax_search").val()
    }
    axios({
        method: 'post',
        url: '../api/v1/Get_list_tax_table',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: data,
    })
    .then(function (response) {
        console.log(response);
        $("#table_list_tax_body").html('');
        var i = 1;
        $.each(response.data.result, function (key, value) {
            var btn_edit = '<button class="btn btn-sm btn-warning" list_id="' + value.list_id + '" onclick="Open_modal_edit_list_tax(this);"><i class="fas fa-edit"></i> แก้ไข</button>';
            var btn_del = '<button class="btn btn-sm btn-danger" list_id="' + value.list_id + '"  onclick="Save_modal_del_list_tax(this);"><i class="fas fa-trash"></i> ลบ</button>';
            var table = "<tr>" +
                "<td class='text-center'>" + i + "</td>" +
                "<td>" + value.list_value + "</td>" +
                "<td class='text-center'>" + btn_edit + " " + btn_del + "</td>" +
                "</tr>";

            $("#table_list_tax_body").append(table);
            i++;
        });
    })
    .catch(function (error) {
        console.log(error);
    });
    // เช็คว่ามีการเปิด Modal หรอไม่ ถ้าไม่มี ให้ทำการเปิด Modal
    if ($('#table_list_tax_modal').hasClass('in') == false) {
        $("#table_list_tax_modal").modal('show');
    }
}

var Open_modal_edit_list_tax = function Open_modal_edit_list_tax(e) {
    var data = {
        list_id: $(e).attr('list_id'),
    };
    axios({
        method: 'post',
        url: '../api/v1/Get_modal_edit_list_tax',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: data
    })
    .then(function (response) {
        console.log(response);
        $("#table_list_tax_modal").modal('hide');
        $("#edit_list_tax_modal").modal('show');
        $.each(response.data.result, function (key, value) {
            $("#list_tax_edit").val(value.list_value);
            $("#btn_modal_edit_list_tax").attr('list_id', value.list_id);
        });

    })
    .catch(function (error) {
        console.log(error);
    });
}

var Save_modal_edit_list_tax = function Save_modal_edit_list_tax(e) {
    var Array_id = ['list_tax_edit'];
    var Toastr = Set_Toastr();
    var Check_rows = Check_null_input(Array_id);
    if (Check_rows == true) {
        var data = {
            list_id: $(e).attr('list_id'),
            list_tax: $("#list_tax_edit").val()
        };
        axios({
            method: 'post',
            url: '../api/v1/Save_modal_edit_list_tax',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: data
        })
        .then(function (response) {
            console.log(response);
            Toastr[response.data.status](response.data.error_text);
            if (response.data.status == 'success') {
                $("#edit_list_tax_modal").modal('hide');
            }
        })
        .catch(function (error) {
            console.log(error);
        });
    } else {
        Toastr["error"]("กรุณากรอกข้อมูลให้ครบ");
        $("#list_tax_edit").focus();
    }
}

var Open_modal_add_list_tax = function Open_modal_add_list_tax() {
    $("#table_list_tax_modal").modal('hide');
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
                    var btn = "<button class='btn btn-sm btn-danger' invoiceitem_id='" + value.invoiceitem_id + "' onclick='del_list_tax_item_modal(this);'><i class='fas fa-trash'></i> ลบ</button>";
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
            Save_vat_invoice();
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
        "<td><b id='full_money'>" + formay_number(not_vat_money) + "</b> บาท</td>" +
        "</tr>" +
        "<tr class='text-right table-secondary'>" +
        "<td colspan='2'></td>" +
        "<td class='text-right'>ภาษีมูลค่าเพิ่ม 7%</td>" +
        "<td><b id='not_vat_money'>" + formay_number(vat_money) + "</b> บาท</td>" +
        "</tr>" +
        "<tr class='text-right table-secondary'>" +
        "<td colspan='2'></td>" +
        "<td class='text-right'>ยอดเงินรับสุทธิ</td>" +
        "<td><b id='vat_money'>" + formay_number(full_money) + "</b> บาท</td>" +
        "</tr>";
    var table_in = "<tr class='text-right table-secondary'>" +
        "<td colspan='2'></td>" +
        "<td>รวมเงิน</td>" +
        "<td><b id='full_money'>" + formay_number(full_money) + "</b> บาท</td>" +
        "</tr>" +
        "<tr class='text-right table-secondary'>" +
        "<td colspan='2'></td>" +
        "<td class='text-right'>ภาษีมูลค่าเพิ่ม 7%</td>" +
        "<td><b id='not_vat_money'>" + formay_number(vat_7) + "</b> บาท</td>" +
        "</tr>" +
        "<tr class='text-right table-secondary'>" +
        "<td colspan='2'></td>" +
        "<td class='text-right'>ยอดเงินรับสุทธิ</td>" +
        "<td><b id='vat_money'>" + formay_number(monry_vat) + "</b> บาท</td>" +
        "</tr>";
    if (sum_money > 0) {
        if ($("input[name=vat_radio]:checked").val() == 'ex_vat') {
            $("#table_list_menu_foot").append(table_ex);
        } else {
            $("#table_list_menu_foot").append(table_in);
        }
    }
}

var Save_vat_invoice = function Save_vat_invoice() {
    var data = {
        no_invoice: $("#no_invoice").val(),
        full_money: $("#full_money").text(),
        not_vat_money: $("#not_vat_money").text(),
        vat_money: $("#vat_money").text(),
        type_vat: $("input[name=vat_radio]:checked").val(),
    };
    axios({
            method: 'post',
            url: '../api/v1/Save_vat_invoice',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: data
        })
        .then(function (response) {
            console.log(response);
        })
        .catch(function (error) {
            console.log(error);
        });
}


var Del_tbody_data_item = function Del_tbody_data_item(e) {
    var data = {
        invoiceitem_id: $(e).attr('invoiceitem_id'),
        del_list_tax_item_note: $("#del_list_tax_item_note").val()
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
        $("#del_list_tax_item_modal").modal('hide');
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

var del_address_modal = function del_address_modal(e) {
    $("#table_list_address_modal").modal('hide');
    $("#btn_modal_del_address").attr('address_id', $(e).attr('address_id'));
    $("#del_address_modal").modal('show');

    $('#del_address_modal').on('hidden.bs.modal', function (e) {
        $("#del_address_note").val('').removeClass('is-valid').removeClass('is-invalid');
    });
}

var del_list_tax_item_modal = function del_list_tax_item_modal(e) {
    $("#table_list_tax_modal").modal('hide');
    $("#btn_modal_del_list_tax_item").attr('invoiceitem_id', $(e).attr('invoiceitem_id'));
    $("#del_list_tax_item_modal").modal('show');

    $('#del_address_modal').on('hidden.bs.modal', function (e) {
        $("#del_list_tax_item_note").val('').removeClass('is-valid').removeClass('is-invalid');
    });
}

var format = function format(x) {
    return x.text;
}

var formay_number = function formay_number(number) {
    return Math.round(number.toFixed(2) * 100) / 100;
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