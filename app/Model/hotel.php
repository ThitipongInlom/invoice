<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class hotel extends Model
{
    /*
        hotel V 0.1
    */    
    public $table = "hotel";
    /**
     * รายชื่อ ตาราง ใน ดาต้าเบส
     */
    protected $fillable = [
        'hotel_name',
        'hotel_tax_invoice',
        'hotel_tax_invoice_bill',
        'hotel_titel',
        'hotel_name_display',
        'hotel_address',
        'hotel_phone',
        'hotel_fax',
        'hotel_vat'
    ];

    public $timestamps = false;

     /**
     * primary Key ของตาราง
     */   
    protected $primaryKey = 'hotel_id';
}
