<?php

namespace App\Http\Controllers\page;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class system extends Controller
{
    public function system_page(Request $request)
    {
        return view('page\system');
    }
}
