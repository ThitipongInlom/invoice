<?php

namespace App\Model;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;

class user extends Authenticatable
{
    /*
        user V 0.1
    */    
    public $table = "user";
    /**
     * รายชื่อ ตาราง ใน ดาต้าเบส
     */
    protected $fillable = [
        'username',
        'name', 
        'department',
        'hotel',
        'type_user',
        'action',
        'ip_login',
    ];

    /**
     * รายชื่อ ตาราง ที่ซ่อน ใน ดาต้าเบส
     */    
    protected $hidden = [
        'password', 
        'remember_token',
    ];


     /**
     * primary Key ของตาราง
     */   
    protected $primaryKey = 'user_id';
}
