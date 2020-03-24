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

class dashboard_bill extends Controller
{
    public function dashboard_page(Request $request)
    {
        $url_root = $request->root();
        return view('page\dashboard_bill', ['url_root' => $url_root]);
    }

   public function table_dashbaord(Request $request)
    {
        $invoice = invoice::where('hotel', $request->get('hotel'))
                          ->where('invoice_type', 'Invoice_bill')->get();
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

}
