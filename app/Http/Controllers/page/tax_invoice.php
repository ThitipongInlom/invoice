<?php

namespace App\Http\Controllers\page;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Model\log as log;
use App\Model\hotel as hotel;
use App\Model\districts as districts;
use App\Model\address as address;
use App\Model\listtax as listtax;
use App\Model\invoice as invoice;
use App\Model\invoiceitem as invoiceitem;

class tax_invoice extends Controller
{
    public function tax_invoice_page(Request $request)
    {
        return view('page\tax_invoice');
    }

    public function tax_invoice_edit_page(Request $request, $invoice_no)
    {
        $invoice_data  = invoice::join('address', 'invoice.address_no', '=', 'address.address_id')
                                ->where('invoice_no', $invoice_no)->get();
        $invoice_table = invoiceitem::where('invoice_no', $invoice_no)->get();
        return view('page\tax_invoice_edit', ['invoice_no' => $invoice_no,'invoice_data' => $invoice_data,'invoice_table' => $invoice_table]);
    }

    public function Get_create_tax_no(Request $request)
    {
        // D -> 0 คือ สามารถ ดูได้
        // C -> 1 คือ สามารถ ดูได้, เพิ่ม
        // A -> 2 คือ สามารถ ดูได้, เพิ่ม, แก้ไข
        // S -> 3 คือ สามารถ ดูได้, เพิ่ม, แก้ไข, ยกเลิก
        if (Auth::user()->action >= '1') {
            // $prefix คือคำนำหน้าของแต่ล่ะโรงแรม 
            $prefix = hotel::where('hotel_name', $request->select_hotel)->value('hotel_tax_invoice');

            $datemonth = date('ym');
            $invoice = invoice::select('invoice_no')
                                ->where( 'invoice_no', 'like', '%'.$datemonth.'%')
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
                $New_Code = (strval($datemonth) * 10000)+1;
            }

            $invoice_no = $prefix.$New_Code;
            $invoice = new invoice;
            $invoice->invoice_no = $invoice_no;
            $invoice->hotel      = $request->select_hotel;
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

    public function Get_address(Request $request)
    {
        $return_arr = array();
        $row_array = array();
        $text = $request->get('text');

        $districts = address::where('company_name', 'like', "%$text%")
                                ->groupBy('company_name')
                                ->orderBy('company_name', 'asc')
                                ->get();
        foreach ($districts as $row) {
            $row_array['id'] = $row->address_id;
            $row_array['text'] = "$row->company_name $row->company_address $row->phone";
            array_push($return_arr,$row_array);
        }

        return response()->json(['status' => 'success','error_text' => 'โหลดข้อมูล จังหวัด เสร็จสิ้น', 'results' => $return_arr],200);
    }

    public function Get_list_tax(Request $request)
    {
        $return_arr = array();
        $row_array = array();
        $text = $request->get('text');

        $districts = listtax::where('list_value', 'like', "%$text%")
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
        $result = address::where('address_id', $request->search_select_address)->first();
        return response()->json(['status' => 'success','error_text' => 'โหลดข้อมูล จังหวัด เสร็จสิ้น', 'results' => $result],200);
    }

    public function Get_tbody_data(Request $request)
    {
        $result = invoiceitem::where('invoice_no', $request->no_invoice)->get();
        $no_invoice = $request->no_invoice;
        $sum_money = invoiceitem::where('invoice_no', $request->no_invoice)->sum('money');
        return response()->json(['status' => 'success','error_text' => 'โหลดข้อมูล จังหวัด เสร็จสิ้น', 'no_invoice' => $no_invoice, 'sum_money' => $sum_money, 'results' => $result],200);
    }

    public function Del_tbody_data_item(Request $request)
    {
        // เพิ่ม Log ในการเพิ่ม Insert
        $invoiceitem_data = invoiceitem::where('invoiceitem_id', $request->invoiceitem_id)->get();
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
        $invoiceitem = invoiceitem::find($request->invoiceitem_id);
        $invoiceitem->delete();

        return response()->json(['status' => 'success','error_text' => 'ลบข้อมูลเสร็จสิ้น'],200);
    }

    public function Del_tbody_data_all(Request $request)
    {
        // เพิ่ม Log ในการเพิ่ม Insert
        $invoiceitem_data = invoiceitem::where('invoice_no', $request->no_invoice)->get();
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
        $invoiceitem = invoiceitem::where('invoice_no', $request->no_invoice);
        $invoiceitem->delete();

        return response()->json(['status' => 'success','error_text' => 'ลบข้อมูลเสร็จสิ้น'],200);
    }

    public function Save_invoice_on(Request $request)
    {
        $invoice_id = invoice::where('invoice_no', $request->no_invoice)->value('invoice_id');
        $invoice = invoice::find($invoice_id);
        $invoice->address_no          = $request->address_no;
        $invoice->ref_no              = $request->ref_no;
        $invoice->invoice_compary     = $request->company;
        $invoice->invoice_address     = $request->address;
        $invoice->full_money          = $request->full_money;
        $invoice->not_vat_money       = $request->not_vat_money;
        $invoice->vat_money           = $request->vat_money;
        $invoice->type_vat            = $request->type_vat;
        $invoice->status_invoice      = 'confirm';
        $invoice->save();

        $auth_user = Auth::user()->username;
        $log_data_old = "null";
        $log_data_new = '{"address_no":"'.$request->address_no.'","ref_no":"'.$request->ref_no.'","invoice_compary":"'.$request->invoice_compary.'","invoice_address":"'.$request->invoice_address.'","full_money":"'.$request->full_money.'","not_vat_money":"'.$request->not_vat_money.'","vat_money":"'.$request->vat_money.'","type_vat":"'.$request->type_vat.'","status_invoice":"confirm"}';
        $action_log = new log;
        $action_log->log_action = 'Update';
        $action_log->log_action_detail = $request->no_invoice;
        $action_log->log_data_old = $log_data_old;
        $action_log->log_data_new = $log_data_new;
        $action_log->log_username = $auth_user;
        $action_log->save();

        return response()->json(['status' => 'success','error_text' => 'อัพเดตข้อมูลเสร็จสิ้น', 'path' => $request->root()],200);
    }

    public function Edit_invoice_on(Request $request)
    {
        $row_data = invoice::where('invoice_no', $request->no_invoice)->get();
        foreach ($row_data as $key => $row) {
            $address_log = $row->address_no != $request->address_no ? '"address_no": "'.$request->address_no.'",' : "";
            $ref_no_log  = $row->ref_no != $request->ref_no ? '"ref_no": "'.$request->ref_no.'",' : "";
            $invoice_compary_log = $row->invoice_compary != $request->company ? '"company": "'.$request->company.'",' : "";
            $invoice_address_log = $row->invoice_address != $request->address ? '"address": "'.$request->address.'",' : "";
            $full_money_log = $row->full_money != $request->full_money ? '"full_money": "'.$request->full_money.'",' : "";
            $not_vat_money_log = $row->not_vat_money != $request->not_vat_money ? '"not_vat_money": "'.$request->not_vat_money.'","' : "";
            $vat_money_log = $row->vat_money != $request->vat_money ? '"vat_money: "'.$request->vat_money.'",' : "";
            $type_vat_log = $row->type_vat != $request->type_vat ? '"type_vat": "'.$request->type_vat.'"' : "";

            $setting_log = $address_log.$ref_no_log.$invoice_compary_log.$invoice_address_log.$full_money_log.$not_vat_money_log.$vat_money_log.$type_vat_log;
        }

        if ($setting_log == '') {
            $set_log = 'null';
        }else{
            $set_log = "{".$setting_log."}";
        }

        $auth_user = Auth::user()->username;
        $log_data_old = "null";
        $log_data_new = $set_log;
        $action_log = new log;
        $action_log->log_action = 'Update';
        $action_log->log_action_detail = $request->no_invoice;
        $action_log->log_data_old = $log_data_old;
        $action_log->log_data_new = $log_data_new;
        $action_log->log_username = $auth_user;
        $action_log->save();

        $invoice_id = invoice::where('invoice_no', $request->no_invoice)->value('invoice_id');
        $invoice = invoice::find($invoice_id);
        $invoice->address_no          = $request->address_no;
        $invoice->ref_no              = $request->ref_no;
        $invoice->invoice_compary     = $request->company;
        $invoice->invoice_address     = $request->address;
        $invoice->full_money          = $request->full_money;
        $invoice->not_vat_money       = $request->not_vat_money;
        $invoice->vat_money           = $request->vat_money;
        $invoice->type_vat            = $request->type_vat;
        $invoice->save();

        return response()->json(['status' => 'success','error_text' => 'อัพเดตข้อมูลเสร็จสิ้น', 'path' => $request->root()],200);
    }

    public function Save_search_address(Request $request)
    {
        $check_name = address::where('company_name', $request->company_name)->count();
        if ($check_name == '1') {
            
            return response()->json(['status' => 'error','error_text' => 'มี บริษัทนี้อยู่แล้ว'],200);
        }else {
            $address = new address;
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

    public function Save_add_list_tax(Request $request)
    {
        $listtax = new listtax;
        $listtax->list_value = $request->list_tax;
        $listtax->user_build = Auth::User()->username;
        $listtax->save();

        return response()->json(['status' => 'success','error_text' => 'บันทึกข้อมูลเสร็จสิ้น'],200);
    }

    public function Save_invoice_item(Request $request)
    {
        $no_invoice = $request->no_invoice;
        $list_item = listtax::where('list_id', $request->list_item)->value('list_value');
        $money_count = $request->money_count;
        $auth_user = Auth::user()->username;
        $invoiceitem = new invoiceitem;
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
        $log_data = log::where('log_action_detail', $request->no_invoice)->get();

        return response()->json(['status' => 'success','error_text' => 'โหลดข้อมูลสำเร็จ', 'result' => $log_data],200);
    }
    
}