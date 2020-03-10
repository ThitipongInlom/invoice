<?php

namespace App\Http\Controllers\page;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\invoice as invoice;
use App\Model\invoiceitem as invoiceitem;

class api_print extends Controller
{
    public function api_print_page(Request $request, $invoice_no)
    {
        return view('page\api_print', ['invoice_no' => $invoice_no]);
    }

    public function Open_view_invoice(Request $request)
    {
        $get_invoice_id = invoice::where('invoice_no', $request->invoice_no)->value('invoice_id');
        $invoiceno   = invoice::where('invoice_id', $get_invoice_id)->value('invoice_no');
        $invoicebath = invoice::where('invoice_id', $get_invoice_id)->value('vat_money');
        $invocedata  = invoice::join('address', 'invoice.address_no', '=', 'address.address_id')
                       ->where('invoice_id', $get_invoice_id)
                       ->get();
        $invoiceitem = invoice::join('invoiceitem', 'invoice.invoice_no', '=', 'invoiceitem.invoice_no')
                       ->where('invoice_id', $get_invoice_id)
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
