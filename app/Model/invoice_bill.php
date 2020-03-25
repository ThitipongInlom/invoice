<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class invoice_bill extends Model
{
    /*
        invoice_bill V 0.1
    */    
    public $table = "invoice_bill";
    /**
     * รายชื่อ ตาราง ใน ดาต้าเบส
     */
    protected $fillable = [
        'invoice_no',
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
