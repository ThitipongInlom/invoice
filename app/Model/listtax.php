<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class listtax extends Model
{
    /*
        listtax V 0.1
    */    
    public $table = "list_tax";
    /**
     * รายชื่อ ตาราง ใน ดาต้าเบส
     */
    protected $fillable = [
        'list_value',
        'user_build'
    ];

     /**
     * primary Key ของตาราง
     */   
    protected $primaryKey = 'list_id';
}
