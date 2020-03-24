<?php

namespace App\Http\Controllers\page;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class tax_invoice_bill extends Controller
{
    public function tax_invoice_bill_page(Request $request)
    {
        $url_root = $request->root();
        return view('page\tax_invoice_bill', ['url_root' => $url_root]);
    }
}
