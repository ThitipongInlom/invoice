<?php

namespace App\Http\Controllers\page;

use App\Http\Controllers\Controller;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Model\log as log;
use App\Model\user as user;
use App\Model\invoice as invoice;
use App\Model\invoiceitem as invoiceitem;

class dashboard extends Controller
{
    public function dashboard_page(Request $request)
    {
        $url_root = $request->root();
        return view('page\dashboard', ['url_root' => $url_root]);
    }

    public function table_dashbaord(Request $request)
    {
        $invoice = invoice::where('hotel', $request->get('hotel'))->get();
        return Datatables::of($invoice)
            ->editColumn('invoice_address', function($invoice) {
                $result = $invoice->invoice_compary.' | '.$invoice->invoice_address;
                return Str::limit($result, 30);
            })
            ->addColumn('action', function ($invoice) {
                $btn  = "<button class='btn btn-xs btn-dark' onclick='Api_print_invoice(this);' invoice_no='$invoice->invoice_no'><i class='fas fa-print'></i></button> ";
                $btn .= "<button class='btn btn-xs btn-primary' onclick='Open_view_invoice(this);' invoice_no='$invoice->invoice_id'><i class='fas fa-search'></i></button> ";
                // ตั้งค่าปุ่ม Edit
                $btn_edit = $invoice->status_invoice == 'cancel' ? "" : "<button class='btn btn-xs btn-warning' onclick='Open_edit_invoice(this);' invoice_no='$invoice->invoice_id'><i class='fas fa-edit'></i></button> ";
                // ตั้งค่าปุ่ม Cancel
                $btn_cancel = $invoice->status_invoice == 'cancel' ? "" : "<button class='btn btn-xs btn-danger' onclick='Open_cancel_invoice(this);' invoice_no='$invoice->invoice_id'><i class='fas fa-times'></i></button> ";
                
                return $btn.$btn_edit.$btn_cancel;
            })       
            ->setRowClass(function ($invoice) {
                if ($invoice->status_invoice == 'cancel') {
                    $reclass = 'bg-danger';
                }else if ($invoice->address_no == '') {
                    $reclass = 'bg-secondary';
                }else{
                    $reclass = '';
                }

                return $reclass;
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    public function Open_view_invoice(Request $request)
    {
        $invoiceno   = invoice::where('invoice_id', $request->invoice_no)->value('invoice_no');
        $invoicebath = invoice::where('invoice_id', $request->invoice_no)->value('vat_money');
        $invocedata  = invoice::join('address', 'invoice.address_no', '=', 'address.address_id')
                       ->where('invoice_id', $request->invoice_no)
                       ->get();
        $invoiceitem = invoice::join('invoiceitem', 'invoice.invoice_no', '=', 'invoiceitem.invoice_no')
                       ->where('invoice_id', $request->invoice_no)
                       ->get();
        $cover_invoicebath = $this->Cover_bath_to_str($invoicebath);

        return response()->json(['status' => 'success',
                                 'error_text' => 'ดึงข้อมูล สำเร็จ',
                                 'invoiceno' => $invoiceno,
                                 'invocedata' => $invocedata,
                                 'invoiceitem' => $invoiceitem,
                                 'cover_invoicebath' => $cover_invoicebath,
                                 'invoice_no' => $request->invoice_no
                                ],200);
    }

    public function Save_cancel_invoice(Request $request)
    {
        // D -> 0 คือ สามารถ ดูได้
        // C -> 1 คือ สามารถ ดูได้, เพิ่ม
        // A -> 2 คือ สามารถ ดูได้, เพิ่ม, แก้ไข
        // S -> 3 คือ สามารถ ดูได้, เพิ่ม, แก้ไข, ยกเลิก
        $check_username   = user::where('username', $request->username)->count();
        $check_password   = user::where('username', $request->username)->value('password');
        $check_action     = user::where('username', $request->username)->value('action');
        if ($check_username == '1') {
            if (Hash::check($request->password, $check_password)) {
                if ($check_action >= '3') {
                    // สามารถ ยกเลิก Invoice ได้
                    $invoice = invoice::find($request->invoice_no);
                    $invoice->status_invoice = 'cancel';
                    $invoice->save();
                    // เพิ่ม Log ในการเพิ่ม cancel
                    $get_invoice_data = invoice::where('invoice_id', $request->invoice_no)->get();
                    $auth_user = Auth::user()->username;
                    foreach ($get_invoice_data as $key => $row) {
                        $log_data_old = '{"status_invoice":"'.$row->status_invoice.'"}';
                        $log_data_new = '{"status_invoice":"cancel","user_action":"'.$auth_user.'","user_input":"'.$request->username.'"}';
                        $action_log = new log;
                        $action_log->log_action = 'Insert';
                        $action_log->log_action_detail = $row->invoice_no;
                        $action_log->log_data_old = $log_data_old;
                        $action_log->log_data_new = $log_data_new;
                        $action_log->log_username = $auth_user;
                        $action_log->save();
                    }
                    return response()->json(['status' => 'success','error_text' => 'ยกเลิก สำเร็จ'],200);
                }else{
                    // ไม่สามารถแก้ไขได้เนื่องจาก Action ไม่เพียงพอ
                    return response()->json(['status' => 'error','error_text' => 'ยกเลิก ไม่สำเร็จ ไม่สามารถแก้ไขได้เนื่องจากสิทธ์การใช้งานไม่เพียงพอ'],200);
                }
            }else {
                return response()->json(['status' => 'error','error_text' => 'รหัสผ่านไม่ถูกต้อง'],200);
            }
        }else {
            return response()->json(['status' => 'error','error_text' => 'ไม่พบ Username นี้ในระบบ'],200);
        }
    }

    public function Save_edit_invoice(Request $request)
    {
        // D -> 0 คือ สามารถ ดูได้
        // C -> 1 คือ สามารถ ดูได้, เพิ่ม
        // A -> 2 คือ สามารถ ดูได้, เพิ่ม, แก้ไข
        // S -> 3 คือ สามารถ ดูได้, เพิ่ม, แก้ไข, ยกเลิก
        $check_username   = user::where('username', $request->username)->count();
        $check_password   = user::where('username', $request->username)->value('password');
        $check_action     = user::where('username', $request->username)->value('action');
        if ($check_username == '1') {
            if (Hash::check($request->password, $check_password)) {
                if ($check_action >= '2') {
                    $invoice_no = invoice::where('invoice_id', $request->invoice_no)->value('invoice_no');
                    $url_edit = url("/tax_invoice_edit/$invoice_no");
                    return response()->json(['status' => 'success','error_text' => 'เปิดหน้าแก้ไข สำเร็จ', 'url_edit' => $url_edit],200);
                }else{
                    // ไม่สามารถแก้ไขได้เนื่องจาก Action ไม่เพียงพอ
                    return response()->json(['status' => 'error','error_text' => 'เปิดหน้าแก้ไข ไม่สำเร็จ ไม่สามารถแก้ไขได้เนื่องจากสิทธ์การใช้งานไม่เพียงพอ'],200);
                }
            }else {
                return response()->json(['status' => 'error','error_text' => 'รหัสผ่านไม่ถูกต้อง'],200);
            }
        }else {
            return response()->json(['status' => 'error','error_text' => 'ไม่พบ Username นี้ในระบบ'],200);
        }
    }

    public function Cover_bath_to_str($number){
        $number = number_format($number, 2, '.', '');
        $numberx = $number;
        $txtnum1 = array('ศูนย์','หนึ่ง','สอง','สาม','สี่','ห้า','หก','เจ็ด','แปด','เก้า','สิบ'); 
        $txtnum2 = array('','สิบ','ร้อย','พัน','หมื่น','แสน','ล้าน','สิบ','ร้อย','พัน','หมื่น','แสน','ล้าน'); 
        $number = str_replace(",","",$number); 
        $number = str_replace(" ","",$number); 
        $number = str_replace("บาท","",$number); 
        $number = explode(".",$number); 
        if(sizeof($number)>2){ 
        return 'ทศนิยมหลายตัวนะจ๊ะ'; 
        exit; 
        } 
        $strlen = strlen($number[0]); 
        $convert = ''; 
        for($i=0;$i<$strlen;$i++){ 
            $n = substr($number[0], $i,1); 
            if($n!=0){ 
                if($i==($strlen-1) AND $n==1){ $convert .= 'เอ็ด'; } 
                elseif($i==($strlen-2) AND $n==2){  $convert .= 'ยี่'; } 
                elseif($i==($strlen-2) AND $n==1){ $convert .= ''; } 
                else{ $convert .= $txtnum1[$n]; } 
                $convert .= $txtnum2[$strlen-$i-1]; 
            } 
        } 

        $convert .= 'บาท'; 
        if($number[1]=='0' OR $number[1]=='00' OR 
        $number[1]==''){ 
        $convert .= 'ถ้วน'; 
        }else{ 
        $strlen = strlen($number[1]); 
        for($i=0;$i<$strlen;$i++){ 
        $n = substr($number[1], $i,1); 
            if($n!=0){ 
            if($i==($strlen-1) AND $n==1){$convert 
            .= 'เอ็ด';} 
            elseif($i==($strlen-2) AND 
            $n==2){$convert .= 'ยี่';} 
            elseif($i==($strlen-2) AND 
            $n==1){$convert .= '';} 
            else{ $convert .= $txtnum1[$n];} 
            $convert .= $txtnum2[$strlen-$i-1]; 
            } 
        } 
        $convert .= 'สตางค์'; 
        }
        //แก้ต่ำกว่า 1 บาท ให้แสดงคำว่าศูนย์ แก้ ศูนย์บาท
        if($numberx < 1)
        {
            $convert = "ศูนย์" .  $convert;
        }

        //แก้เอ็ดสตางค์
        $len = strlen($numberx);
        $lendot1 = $len - 2;
        $lendot2 = $len - 1;
        if(($numberx[$lendot1] == 0) && ($numberx[$lendot2] == 1))
        {
            $convert = substr($convert,0,-10);
            $convert = $convert . "หนึ่งสตางค์";
        }

        //แก้เอ็ดบาท สำหรับค่า 1-1.99
        if($numberx >= 1)
        {
            if($numberx < 2)
            {
                $convert = substr($convert,4);
                $convert = "หนึ่ง" .  $convert;
            }
        }
        return $convert; 
    }

}
