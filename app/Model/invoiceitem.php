<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class invoiceitem extends Model
{
    /*
        invoiceitem V 0.1
    */    
    public $table = "invoiceitem";
    /**
     * รายชื่อ ตาราง ใน ดาต้าเบส
     */
    protected $fillable = [
        'invoice_no',
        'list_item',
        'money',
    ];

     /**
     * primary Key ของตาราง
     */   
    protected $primaryKey = 'invoiceitem_id';
}
