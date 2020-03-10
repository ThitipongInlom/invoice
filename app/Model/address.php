<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class address extends Model
{
    /*
        address V 0.1
    */    
    public $table = "address";
    /**
     * รายชื่อ ตาราง ใน ดาต้าเบส
     */
    protected $fillable = [
        'company_name',
        'type_address',
        'company_address', 
        'tax_id',
        'phone',
        'user_build',
        'company_type',
        'branch_company_on',
        'branch_company_name'
    ];

     /**
     * primary Key ของตาราง
     */   
    protected $primaryKey = 'address_id';
}
