<?php

namespace App\Http\Controllers\page;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class dashboard_bill extends Controller
{
    public function dashboard_page(Request $request)
    {
        $url_root = $request->root();
        return view('page\dashboard_bill', ['url_root' => $url_root]);
    }
}
