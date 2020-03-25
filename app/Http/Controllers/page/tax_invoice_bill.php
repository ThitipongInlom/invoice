<?php

namespace App\Http\Controllers\page;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Model\log as log;
use App\Model\hotel as hotel;
use App\Model\address_bill as address_bill;
use App\Model\listtax_bill as listtax_bill;
use App\Model\invoice_bill as invoice_bill;
use App\Model\invoiceitem_bill as invoiceitem_bill;

class tax_invoice_bill extends Controller
{
    public function tax_invoice_bill_page(Request $request)
    {
        $url_root = $request->root();
        return view('page\tax_invoice_bill', ['url_root' => $url_root]);
    }

    public function tax_invoice_edit_page(Request $request, $invoice_no)
    {
        $url_root = $request->root();
        $invoice_data  = invoice_bill::join('address_bill', 'invoice_bill.address_no', '=', 'address_bill.address_id')
                                ->where('invoice_no', $invoice_no)->get();
        $invoice_table = invoiceitem_bill::where('invoice_no', $invoice_no)->get();
        return view('page\tax_invoice_edit', ['invoice_no' => $invoice_no,'invoice_data' => $invoice_data,'invoice_table' => $invoice_table,'url_root' => $url_root]);
    }

    public function Get_create_tax_no(Request $request)
    {
        // D -> 0 คือ สามารถ ดูได้
        // C -> 1 คือ สามารถ ดูได้, เพิ่ม
        // A -> 2 คือ สามารถ ดูได้, เพิ่ม, แก้ไข
        // S -> 3 คือ สามารถ ดูได้, เพิ่ม, แก้ไข, ยกเลิก
        if (Auth::user()->action >= '1') {
            // $prefix คือคำนำหน้าของแต่ล่ะโรงแรม 
            $prefix = hotel::where('hotel_name', $request->select_hotel)->value('hotel_tax_invoice_bill');

            $datemonth = date('ymd');
            $invoice = invoice_bill::select('invoice_no')
                                ->where( 'invoice_no', 'like', $prefix.'%'.$datemonth.'%')
                                ->where('hotel', $request->select_hotel)
                                ->orderBy('invoice_id', 'desc')
                                ->limit(1)
                                ->get();

            if ($invoice != '[]') {
                foreach ($invoice as $key => $row) {
                    $no_text = str_replace($prefix," ", $row->invoice_no);
                    $New_Code = strval($no_text)+1;           
                }
            }else { 
                $New_Code = (strval($datemonth) * 1000)+1;
            }

            $invoice_no = $prefix.$New_Code;
            $invoice = new invoice_bill;
            $invoice->invoice_no = $invoice_no;
            $invoice->hotel      = $request->select_hotel;
            $invoice->user_create= Auth::user()->username;
            $invoice->save();
            $insertedId = $invoice->invoice_id;

            // เพิ่ม Log ในการเพิ่ม Insert
            $auth_user = Auth::user()->username;
            $log_data_old = "null";
            $log_data_new = '{"invoice_no":"'.$invoice_no.'","user_action":"'.$auth_user.'"}';
            $action_log = new log;
            $action_log->log_action = 'Insert';
            $action_log->log_action_detail = $invoice_no;
            $action_log->log_data_old = $log_data_old;
            $action_log->log_data_new = $log_data_new;
            $action_log->log_username = $auth_user;
            $action_log->save();

            return response()->json(['status' => 'success','error_text' => 'สร้าง Tax No เสร็จสิ้น', 'invoice_no' => $invoice_no, 'insertedId' => $insertedId],200);
        }else {
            return response()->json(['status' => 'error','error_text' => 'สิทธิ์ การใช้งานไม่สามารถ สร้างได้'],200);
        }
    }

    public function Get_list_tax(Request $request)
    {
        $return_arr = array();
        $row_array = array();
        $text = $request->get('text');

        $districts = listtax_bill::where('list_value', 'like', "%$text%")
                                ->groupBy('list_value')
                                ->orderBy('list_value', 'asc')
                                ->get();
        foreach ($districts as $row) {
            $row_array['id'] = $row->list_id;
            $row_array['text'] = "$row->list_value";
            array_push($return_arr,$row_array);
        }

        return response()->json(['status' => 'success','error_text' => 'โหลดข้อมูล จังหวัด เสร็จสิ้น', 'results' => $return_arr],200);
    }

    public function Set_data_display(Request $request)
    {
        $result = address_bill::where('address_id', $request->search_select_address)->get();
        foreach ($result as $key => $row) {
            $invoice_id = invoice_bill::where('invoice_no', $request->no_invoice)->value('invoice_id');
            $invoice = invoice_bill::find($invoice_id);
            $invoice->address_no          = $row->address_id;
            $invoice->invoice_compary     = $row->company_name;
            $invoice->invoice_address     = $row->company_address;
            $invoice->status_invoice      = 'confirm';
            $invoice->save();

            $auth_user = Auth::user()->username;
            $log_data_old = "null";
            $log_data_new = '{"address_no":"'.$row->address_id.'","invoice_compary":"'.$row->company_name.'","invoice_address":"'.$row->company_address.'","status_invoice":"confirm"}';
            $action_log = new log;
            $action_log->log_action = 'Update';
            $action_log->log_action_detail = $request->no_invoice;
            $action_log->log_data_old = $log_data_old;
            $action_log->log_data_new = $log_data_new;
            $action_log->log_username = $auth_user;
            $action_log->save();
        }

        return response()->json(['status' => 'success','error_text' => 'โหลดข้อมูล จังหวัด เสร็จสิ้น', 'results' => $result],200);
    }

    public function Save_ref_no(Request $request)
    {
        $invoice_id = invoice_bill::where('invoice_no', $request->no_invoice)->value('invoice_id');
        $invoice = invoice_bill::find($invoice_id);
        $invoice->ref_no    = $request->ref_no;
        $invoice->save();

        $auth_user = Auth::user()->username;
        $log_data_old = "null";
        $log_data_new = '{"ref_no":"'.$request->ref_no.'"}';
        $action_log = new log;
        $action_log->log_action = 'Update';
        $action_log->log_action_detail = $request->no_invoice;
        $action_log->log_data_old = $log_data_old;
        $action_log->log_data_new = $log_data_new;
        $action_log->log_username = $auth_user;
        $action_log->save();

        return response()->json(['status' => 'success','error_text' => 'อัพเดต ข้อมูลเสร็จสิ้น'],200);
    }

    public function Save_vat_invoice(Request $request)
    {
        if (isset($request->full_money)) {
            $invoice_data = invoice_bill::where('invoice_no', $request->no_invoice)->get();
            foreach ($invoice_data as $key => $row) {
                if ($row->full_money != $request->full_money OR
                    $row->not_vat_money != $request->not_vat_money OR
                    $row->vat_money != $request->vat_money OR
                    $row->type_vat != $request->type_vat) {
                    $invoice_id = invoice_bill::where('invoice_no', $request->no_invoice)->value('invoice_id');
                    $invoice = invoice_bill::find($invoice_id);
                    $invoice->full_money     = $request->full_money;
                    $invoice->not_vat_money  = $request->not_vat_money;
                    $invoice->vat_money      = $request->vat_money;
                    $invoice->type_vat       = $request->type_vat;
                    $invoice->save();

                    $auth_user = Auth::user()->username;
                    $log_data_old = "null";
                    $log_data_new = '{"full_money":"'.$request->full_money.'","not_vat_money":"'.$request->not_vat_money.'","vat_money":"'.$request->vat_money.'","type_vat":"'.$request->type_vat.'"}';
                    $action_log = new log;
                    $action_log->log_action = 'Update';
                    $action_log->log_action_detail = $request->no_invoice;
                    $action_log->log_data_old = $log_data_old;
                    $action_log->log_data_new = $log_data_new;
                    $action_log->log_username = $auth_user;
                    $action_log->save();
                }
            }
            return response()->json(['status' => 'success','error_text' => 'อัพเดต ข้อมูลเสร็จสิ้น'],200);
        }
    }

    public function Get_tbody_data(Request $request)
    {
        $result = invoiceitem_bill::where('invoice_no', $request->no_invoice)->get();
        $no_invoice = $request->no_invoice;
        $sum_money = invoiceitem_bill::where('invoice_no', $request->no_invoice)->sum('money');
        return response()->json(['status' => 'success','error_text' => 'โหลดข้อมูล จังหวัด เสร็จสิ้น', 'no_invoice' => $no_invoice, 'sum_money' => $sum_money, 'results' => $result],200);
    }

    public function Del_tbody_data_item(Request $request)
    {
        // เพิ่ม Log ในการเพิ่ม Insert
        $invoiceitem_data = invoiceitem_bill::where('invoiceitem_id', $request->invoiceitem_id)->get();
        $auth_user = Auth::user()->username;
        foreach ($invoiceitem_data as $key => $row) {
            $log_data_old = '{"list_item":"'.$row->list_item.'","money_count":"'.$row->money.'","del_list_tax_item_note":"'.$request->del_list_tax_item_note.'","user_action":"'.$auth_user.'"}';
            $log_data_new = "null";
            $action_log = new log;
            $action_log->log_action = 'Delete';
            $action_log->log_action_detail = $row->invoice_no;
            $action_log->log_data_old = $log_data_old;
            $action_log->log_data_new = $log_data_new;
            $action_log->log_username = $auth_user;
            $action_log->save();
        }
        // ลบข้อมูล Invoice
        $invoiceitem = invoiceitem_bill::find($request->invoiceitem_id);
        $invoiceitem->delete();

        return response()->json(['status' => 'success','error_text' => 'ลบข้อมูลเสร็จสิ้น'],200);
    }

    public function Del_tbody_data_all(Request $request)
    {
        // เพิ่ม Log ในการเพิ่ม Insert
        $invoiceitem_data = invoiceitem_bill::where('invoice_no', $request->no_invoice)->get();
        $auth_user = Auth::user()->username;
        foreach ($invoiceitem_data as $key => $row) {
            $log_data_old = '{"list_item":"'.$row->list_item.'","money_count":"'.$row->money.'","user_action":"'.$auth_user.'"}';
            $log_data_new = "null";
            $action_log = new log;
            $action_log->log_action = 'Delete';
            $action_log->log_action_detail = $row->invoice_no;
            $action_log->log_data_old = $log_data_old;
            $action_log->log_data_new = $log_data_new;
            $action_log->log_username = $auth_user;
            $action_log->save();
        }
        // ลบข้อมูล Invoice
        $invoiceitem = invoiceitem_bill::where('invoice_no', $request->no_invoice);
        $invoiceitem->delete();

        return response()->json(['status' => 'success','error_text' => 'ลบข้อมูลเสร็จสิ้น'],200);
    }

    public function Save_search_address(Request $request)
    {
        $check_name = address_bill::where('company_name', $request->company_name)->count();
        if ($check_name == '1') {

            return response()->json(['status' => 'error','error_text' => 'มี บริษัทนี้อยู่แล้ว'],200);
        }else {
            $address = new address_bill;
            $address->company_name        = $request->company_name;
            $address->type_address        = $request->type_address;
            $address->company_address     = $request->company_address;
            $address->tax_id              = $request->tax_id;
            $address->phone               = $request->phone;
            $address->user_build          = Auth::User()->username;
            $address->company_type        = $request->company_type;
            $address->branch_company_on   = $request->branch_company_on;
            $address->branch_company_name = $request->branch_company_name;
            $address->save();

            // เพิ่ม Log ในการเพิ่ม Insert
            $auth_user = Auth::user()->username;
            $log_data_old = "null";
            $log_data_new = '{"company_name": "'.$request->company_name.'","type_address":"'.$request->type_address.'","company_address":"'.$request->company_address.'","tax_id":"'.$request->tax_id.'","phone":"'.$request->phone.'","user_build":"'.$auth_user.'","company_type":"'.$request->company_type.'","branch_company_on":"'.$request->branch_company_on.'","branch_company_name":"'.$request->branch_company_name.'"}';
            $action_log = new log;
            $action_log->log_action = 'Insert';
            $action_log->log_action_detail = 'Address';
            $action_log->log_data_old = $log_data_old;
            $action_log->log_data_new = $log_data_new;
            $action_log->log_username = $auth_user;
            $action_log->save();

            return response()->json(['status' => 'success','error_text' => 'บันทึกข้อมูลเสร็จสิ้น'],200);
        }
    }

    public function Save_search_address_edit(Request $request)
    {
        $address = address_bill::find($request->address_id);
        $address->company_name        = $request->company_name;
        $address->type_address        = $request->type_address;
        $address->company_address     = $request->company_address;
        $address->tax_id              = $request->tax_id;
        $address->phone               = $request->phone;
        $address->company_type        = $request->company_type;
        $address->branch_company_on   = $request->branch_company_on;
        $address->branch_company_name = $request->branch_company_name;
        $address->save();

        // เพิ่ม Log ในการเพิ่ม Insert
        $auth_user = Auth::user()->username;
        $log_data_old = "null";
        $log_data_new = '{"company_name": "'.$request->company_name.'","type_address":"'.$request->type_address.'","company_address":"'.$request->company_address.'","tax_id":"'.$request->tax_id.'","phone":"'.$request->phone.'","company_type":"'.$request->company_type.'","branch_company_on":"'.$request->branch_company_on.'","branch_company_name":"'.$request->branch_company_name.'"}';
        $action_log = new log;
        $action_log->log_action = 'Update';
        $action_log->log_action_detail = 'Address';
        $action_log->log_data_old = $log_data_old;
        $action_log->log_data_new = $log_data_new;
        $action_log->log_username = $auth_user;
        $action_log->save();

        return response()->json(['status' => 'success','error_text' => 'บันทึกข้อมูลเสร็จสิ้น'],200);
    }

    public function Save_add_list_tax(Request $request)
    {
        $listtax = new listtax_bill;
        $listtax->list_value = $request->list_tax;
        $listtax->user_build = Auth::User()->username;
        $listtax->save();

        return response()->json(['status' => 'success','error_text' => 'บันทึกข้อมูลเสร็จสิ้น'],200);
    }

    public function Save_invoice_item(Request $request)
    {
        $no_invoice = $request->no_invoice;
        $list_item = listtax_bill::where('list_id', $request->list_item)->value('list_value');
        $money_count = $request->money_count;
        $auth_user = Auth::user()->username;
        $invoiceitem = new invoiceitem_bill;
        $invoiceitem->invoice_no = $no_invoice;
        $invoiceitem->list_item  = $list_item;
        $invoiceitem->money      = $money_count;
        $invoiceitem->save();
        // เพิ่ม Log ในการเพิ่ม Insert
        $log_data_old = "null";
        $log_data_new = '{"list_item":"'.$list_item.'","money_count":"'.$money_count.'","user_action":"'.$auth_user.'"}';
        $action_log = new log;
        $action_log->log_action = 'Insert';
        $action_log->log_action_detail = $no_invoice;
        $action_log->log_data_old = $log_data_old;
        $action_log->log_data_new = $log_data_new;
        $action_log->log_username = $auth_user;
        $action_log->save();

        return response()->json(['status' => 'success','error_text' => 'บันทึกข้อมูลเสร็จสิ้น'],200);
    }

    public function Get_log_invoice(Request $request)
    {
        $log_data = log::where('log_action_detail', $request->no_invoice)->orderBy('log_id', 'desc')->get();

        return response()->json(['status' => 'success','error_text' => 'โหลดข้อมูลสำเร็จ', 'result' => $log_data],200);
    }

    public function Get_list_address(Request $request)
    {
        if ($request->table_address_search == "") {
            $address_data = address_bill::limit(10)->get();
        } else {
            $address_data = address_bill::where('company_name', 'like', "%$request->table_address_search%")
                                    ->orWhere('company_address', 'like', "%$request->table_address_search%")
                                    ->limit(10)->get();
        }

        return response()->json(['status' => 'success','error_text' => 'โหลดข้อมูลสำเร็จ', 'result' => $address_data],200);
    }

    public function Get_edit_address(Request $request)
    {
        $check_action = Auth::user()->action;
        if ($check_action >= '2') { 
            $address_data = address_bill::where('address_id', $request->address_id)->get();
            return response()->json(['status' => 'success','error_text' => 'โหลดข้อมูลสำเร็จ', 'result' => $address_data],200);
        }else {
            return response()->json(['status' => 'error','error_text' => 'เปิดหน้าแก้ไข ไม่สำเร็จ ไม่สามารถแก้ไขได้เนื่องจากสิทธ์การใช้งานไม่เพียงพอ'],200);
        }
    }

    public function Save_modal_del_address(Request $request)
    {
        $check_action = Auth::user()->action;
        if ($check_action >= '3') { 
            $address = address_bill::find($request->address_id);
            $address->delete();

            // เพิ่ม Log ในการเพิ่ม Insert
            $auth_user = Auth::user()->username;
            $log_data_old = '{"address_id": "'.$request->address_id.'","del_address_note":"'.$request->del_address_note.'"}';
            $log_data_new = "null";
            $action_log = new log;
            $action_log->log_action = 'Delete';
            $action_log->log_action_detail = 'Address';
            $action_log->log_data_old = $log_data_old;
            $action_log->log_data_new = $log_data_new;
            $action_log->log_username = $auth_user;
            $action_log->save();

            return response()->json(['status' => 'success','error_text' => 'ลบข้อมูล สำเร็จ'],200);
        }else {
            return response()->json(['status' => 'error','error_text' => 'ลบข้อมูล ไม่สำเร็จ ไม่สามารถแก้ไขได้เนื่องจากสิทธ์การใช้งานไม่เพียงพอ'],200);
        }
    }

    public function Get_list_tax_table(Request $request)
    {
        if ($request->table_list_tax_search == "") {
            $listtax_data = listtax_bill::limit(10)->get();
        }else {
            $listtax_data = listtax_bill::where('list_value', 'like', "%$request->table_list_tax_search%")->limit(10)->get();
        }

        return response()->json(['status' => 'success','error_text' => 'โหลดข้อมูล สำเร็จ', 'result' => $listtax_data],200);
    }

    public function Get_modal_edit_list_tax(Request $request)
    {
        $listtax_data = listtax_bill::where('list_id', $request->list_id)->get();

        return response()->json(['status' => 'success','error_text' => 'โหลดข้อมูล สำเร็จ', 'result' => $listtax_data],200);
    }

    public function Save_modal_edit_list_tax(Request $request)
    {
        $check_action = Auth::user()->action;
        if ($check_action >= '2') { 
            $listtax = listtax_bill::find($request->list_id);
            $listtax->list_value = $request->list_tax;
            $listtax->user_build = Auth::user()->username;
            $listtax->save();

            // เพิ่ม Log ในการเพิ่ม Insert
            $auth_user = Auth::user()->username;
            $log_data_old = 'null';
            $log_data_new = '{"list_value": "'.$request->list_value.'"}';
            $action_log = new log;
            $action_log->log_action = 'Update';
            $action_log->log_action_detail = 'List Tax';
            $action_log->log_data_old = $log_data_old;
            $action_log->log_data_new = $log_data_new;
            $action_log->log_username = $auth_user;
            $action_log->save();

            return response()->json(['status' => 'success','error_text' => 'อัพเดตข้อมูล สำเร็จ'],200);
        }else {
            return response()->json(['status' => 'error','error_text' => 'ลบข้อมูล ไม่สำเร็จ ไม่สามารถแก้ไขได้เนื่องจากสิทธ์การใช้งานไม่เพียงพอ'],200);
        }
    }

    public function Save_modal_del_list_tax(Request $request)
    {
        $check_action = Auth::user()->action;
        if ($check_action >= '3') { 
            $listtax = listtax_bill::find($request->list_id);
            $listtax->delete();

            // เพิ่ม Log ในการเพิ่ม Insert
            $auth_user = Auth::user()->username;
            $log_data_old = '{"list_id": "'.$request->list_id.'"}';
            $log_data_new = "null";
            $action_log = new log;
            $action_log->log_action = 'Delete';
            $action_log->log_action_detail = 'List Tax';
            $action_log->log_data_old = $log_data_old;
            $action_log->log_data_new = $log_data_new;
            $action_log->log_username = $auth_user;
            $action_log->save();

            return response()->json(['status' => 'success','error_text' => 'ลบข้อมูล สำเร็จ'],200);
        }else {
            return response()->json(['status' => 'error','error_text' => 'ลบข้อมูล ไม่สำเร็จ ไม่สามารถแก้ไขได้เนื่องจากสิทธ์การใช้งานไม่เพียงพอ'],200);
        }
    }
    
}
