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
    ];

    public $timestamps = false;

     /**
     * primary Key ของตาราง
     */   
    protected $primaryKey = 'hotel_id';
}
