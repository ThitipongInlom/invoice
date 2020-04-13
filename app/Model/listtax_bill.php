<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class listtax_bill extends Model
{
    /*
        listtax_bill V 0.1
    */    
    public $table = "list_tax_bill";
    /**
     * รายชื่อ ตาราง ใน ดาต้าเบส
     */
    protected $fillable = [
        'list_value',
        'list_type',
        'user_build'
    ];

     /**
     * primary Key ของตาราง
     */   
    protected $primaryKey = 'list_id';
}
