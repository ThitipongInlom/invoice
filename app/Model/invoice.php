<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class invoice extends Model
{
    /*
        invoice V 0.1
    */    
    public $table = "invoice";
    /**
     * รายชื่อ ตาราง ใน ดาต้าเบส
     */
    protected $fillable = [
        'invoice_no',
        'invoice_type',
        'address_no',
        'ref_no',
        'hotel',
        'invoice_compary',
        'invoice_address',
        'full_money',
        'not_vat_money',
        'vat_money',
        'type_vat',
        'status_invoice',
        'user_create'
    ];

     /**
     * primary Key ของตาราง
     */   
    protected $primaryKey = 'invoice_id';
}
