<?php
// Auth Login
Route::get('/login', 'auth\login@login_page')->name('login');
// Auth Register
Route::get('/register', 'auth\register@register_page')->name('register');
// Dashboard
Route::get('/', 'page\dashboard@dashboard_page')->middleware('auth');
// Tax Invoice
Route::get('/tax_invoice', 'page\tax_invoice@tax_invoice_page')->middleware('auth');
Route::get('/tax_invoice_edit/{invoice_no}', 'page\tax_invoice@tax_invoice_edit_page')->middleware('auth');
// User
Route::get('/user', 'page\user@user_page')->middleware('auth');
// API Print Invoice 
Route::get('/print/{invoice_no}', 'page\api_print@api_print_page')->middleware('auth');

// API
Route::group(['prefix' => 'api/v1'], function () {
    Route::post('/Do_login', 'auth\login@Do_login');
    Route::post('/Do_register', 'auth\register@Do_register');
    Route::get('/Do_logout', 'auth\login@Do_logout');
    Route::get('/Get_address', 'page\tax_invoice@Get_address');
    Route::get('/Get_list_tax', 'page\tax_invoice@Get_list_tax');
    Route::post('/Get_tbody_data', 'page\tax_invoice@Get_tbody_data');
    Route::post('/Set_data_display', 'page\tax_invoice@Set_data_display');
    Route::post('/Save_search_address', 'page\tax_invoice@Save_search_address');
    Route::post('/Save_add_list_tax', 'page\tax_invoice@Save_add_list_tax');
    Route::post('/Save_invoice_item', 'page\tax_invoice@Save_invoice_item');
    Route::post('/Save_invoice_on', 'page\tax_invoice@Save_invoice_on');
    Route::post('/Del_tbody_data_item', 'page\tax_invoice@Del_tbody_data_item');
    Route::post('/Del_tbody_data_all', 'page\tax_invoice@Del_tbody_data_all');
    Route::post('/Get_create_tax_no', 'page\tax_invoice@Get_create_tax_no');
    Route::get('/table_dashboard', 'page\dashboard@table_dashbaord');
    Route::get('/table_user', 'page\user@Get_user_all');
    Route::post('/Save_add_user', 'page\user@Save_add_user');
    Route::post('/Open_view_invoice', 'page\dashboard@Open_view_invoice');
    Route::post('/Api_print_invoice', 'page\api_print@Open_view_invoice');
    Route::post('/Save_cancel_invoice', 'page\dashboard@Save_cancel_invoice');
    Route::post('/Save_edit_invoice', 'page\dashboard@Save_edit_invoice');
    Route::post('/Edit_invoice_on', 'page\tax_invoice@Edit_invoice_on');
    Route::post('/Get_log_invoice', 'page\tax_invoice@Get_log_invoice');
});
