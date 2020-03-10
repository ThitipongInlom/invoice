<?php

namespace App\Http\Controllers\auth;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Model\user as user;
use Illuminate\Http\Request;

class login extends Controller
{
    public function login_page(Request $request)
    {
        return view('auth/login'); 
    }

    public function Do_login(Request $request)
    {
        if (Auth::attempt(['username' => $request->post('username'), 'password' => $request->post('password')])) {
            $do_login = user::find(Auth::user()->user_id);
            $do_login->ip_login = $request->ip();
            $do_login->remember_token = $request->header('X-CSRF-TOKEN');
            $do_login->save();
            return response()->json(['status' => 'success','success_text' => 'เข้าสู่ระบบสำเร็จ กรุณารอซักครู่','path' => $request->root()],200);
        }else{
            return response()->json(['status' => 'error','error_text' => 'ชื่อผู้ใช้งาน และ รหัสผ่าน ไม่ถูกต้อง'],200);
        }
    }

    public function Do_logout(Request $request)
    {
        Auth::logout();
        return redirect('/');
    }
}
