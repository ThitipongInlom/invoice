<?php

namespace App\Http\Controllers\auth;

use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Model\user as user;
use Illuminate\Http\Request;

class register extends Controller
{
    public function register_page(Request $request)
    {
        return view('auth/register'); 
    }

    public function Do_register(Request $request)
    {
        $username = user::where('username', $request->post('username'))->count();
        if ($username == '0') {
            $user = new user;
            $user->username = $request->post('username');
            $user->password = Hash::make($request->post('password'));
            $user->name = $request->post('name');
            $user->save();

            return response()->json(['status' => 'success','success_text' => 'สมัครสมาชิก สำเร็จ กรุณารอซักครู่','path' => $request->root()],200);
        }else{
            return response()->json(['status' => 'error','error_text' => 'ชื่อ มีอยู่ในระบบแล้ว กรุณาเปลี่ยน ชื่อผู้ใช้งาน'],200);  
        }
    }

}
