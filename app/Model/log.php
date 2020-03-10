<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class log extends Model
{
    /*
        log V 0.1
    */    
    public $table = "log";
    /**
     * รายชื่อ ตาราง ใน ดาต้าเบส
     */
    protected $fillable = [
        'log_action',
        'log_action_detail',
        'log_data_old',
        'log_data_new',
        'log_username'
    ];

     /**
     * primary Key ของตาราง
     */   
    protected $primaryKey = 'log_id';
}
