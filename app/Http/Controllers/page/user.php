<?php

namespace App\Http\Controllers\page;

use App\Http\Controllers\Controller;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Model\user as user_model;
use App\Model\log as log;

class user extends Controller
{
    public function user_page(Request $request)
    {
        return view('page\user');
    }

    public function Get_user_all(Request $request)
    {
        $data = user_model::get();
        return Datatables::of($data)
                ->addColumn('action', function ($data) {
                    $btn  = "<button class='btn btn-xs btn-primary'><i class='fas fa-search'></i></button> ";
                    $btn .= "<button class='btn btn-xs btn-warning'><i class='fas fa-edit'></i></button>";
                    return $btn;
                })       
                ->rawColumns(['action'])
                ->make(true);
    }

    public function Save_add_user(Request $request)
    {
        $Check_username = user_model::where('username', $request->username)->count();
        if ($Check_username == 0) {
            $password = Hash::make($request->password);
            $hotel = implode(",",$request->hotel);
            // สร้าง User ในฐานข้อมูล
            $user_model = new user_model;
            $user_model->username = $request->username;
            $user_model->password = $password;
            $user_model->name = $request->name;
            $user_model->department = $request->department;
            $user_model->type_user = $request->type;
            $user_model->action = $request->action;
            $user_model->hotel = $hotel;
            $user_model->save();
            // เพิ่ม Log ในการเพิ่ม User
            $log_data_new = '{"username": "'.$request->username.'","password": "'.$password.'","name": "'.$request->name.'","department": "'.$request->department.'","type_user": "'.$request->type.'","action": "'.$request->action.'","hotel": "'.$hotel.'"}';
            $action_log = new log;
            $action_log->log_action = 'Insert';
            $action_log->log_action_detail = 'User';
            $action_log->log_data_old = "null";
            $action_log->log_data_new = $log_data_new;
            $action_log->log_username = Auth::user()->username;
            $action_log->save();
            return response()->json(['status' => 'success','error_text' => 'สร้าง username สำเร็จ'],200);
        }else{
            return response()->json(['status' => 'error','error_text' => 'ไม่สามารถสร้าง username ได้ เพราะมีในระบบแล้ว !'],200);
        }
    }
    


}
