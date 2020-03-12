<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>{{ config('app.name') }} | User</title>
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <!-- All Css -->
        <link rel="stylesheet" type="text/css" href="{{ asset('css/app.css') }}">
    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            @include('layout/head')
            @include('layout/menu')
                <div class="content-wrapper">
                    <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>User</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item active">Setting</li>
                                    <li class="breadcrumb-item active">User</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    </section>

                    <section class="content">
                        <div class="card">
                            <div class="card-header mb-2 pb-2">
                                <h3 class="card-title">รายการ User ทั้งหมด</h3>

                                <div class="card-tools">
                                    <button class="btn btn-sm btn-success" onclick="Open_modal_add_user();"><i class="fas fa-plus"></i> เพิ่ม User</button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table  class="table table-sm dt-responsive nowrap row-border table-bordered table-hover" cellspacing="0" cellpadding="0" id="table_user" width="100%">
                                            <thead>
                                                <tr class="bg-primary">
                                                    <th>Username</th>
                                                    <th>Name</th>
                                                    <th>โรงแรม</th>
                                                    <th>แผนก</th>
                                                    <th>สิทธิ์การใช้งาน</th>
                                                    <th>เครื่องมือ</th>
                                                </tr>
                                            </thead>
                                            <tbody></tbody>                                            
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Modal -->
                    <div class="modal fade" id="modal_add_user" tabindex="-1" role="dialog" aria-labelledby="modal_add_userLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-primary mb-2 pb-2">
                                    <h5 class="modal-title" id="modal_add_userLabel"><i class="fas fa-plus"></i> เพิ่ม User</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-6 col-md-6">
                                            <div class="form-group">
                                                <label for="username">Username</label>
                                                <input type="text" class="form-control form-control-sm" id="username" placeholder="Username">
                                            </div>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <div class="form-group">
                                                <label for="password">Password</label>
                                                <input type="password" class="form-control form-control-sm" id="password" placeholder="Password">
                                            </div>                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6 col-md-6">
                                            <div class="form-group">
                                                <label for="name">Name</label>
                                                <input type="text" class="form-control form-control-sm" id="name" placeholder="Username">
                                            </div>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <div class="form-group">
                                                <label for="department">Department</label>
                                                <input type="text" class="form-control form-control-sm" id="department" placeholder="Department">
                                            </div>                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6 col-md-6">
                                            <div class="form-group">
                                                <label for="type">Type</label>
                                                <select class="custom-select custom-select-sm" id="type">
                                                    <option selected value="user">User</option>
                                                    <option value="admin">Admin</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <div class="form-group">
                                                <label for="action">Action</label>
                                                <select class="custom-select custom-select-sm" id="action">
                                                    <option selected value="0">ดูได้</option>
                                                    <option value="1">ดูได้, เพิ่ม</option>
                                                    <option value="2">ดูได้, เพิ่ม, แก้ไข</option>
                                                    <option value="3">ดูได้, เพิ่ม, แก้ไข, ยกเลิก</option>
                                                </select>
                                            </div>                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-md-12">
                                            <div class="form-group">
                                                <label for="hotel">Hotel</label>
                                                <select class="custom-select custom-select-sm" id="hotel">
                                                    <option value="TheZign">TheZign</option>
                                                    <option value="Z2">Z2</option>
                                                </select>
                                            </div>                                       
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer" style="display:inline">
                                    <div class="row">
                                        <div class="col-6 col-md-6">
                                            <button type="button" class="btn btn-sm btn-block btn-danger" data-dismiss="modal"><i class="fas fa-times"></i> ยกเลิก</button>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <button type="button" class="btn btn-sm btn-block btn-success" onclick="Save_modal_add_user();"><i class="fas fa-save"></i> ยืนยัน</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="modal_edit_user" tabindex="-1" role="dialog" aria-labelledby="modal_edit_userLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-warning">
                                    <h5 class="modal-title" id="modal_edit_userLabel">แก้ไข User</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    
                                </div>
                                <div class="modal-footer" style='display:inline;'>
                                    <div class="row">
                                        <div class="col-6 col-md-6">
                                            <button type="button" class="btn btn-sm btn-block btn-danger" data-dismiss="modal">Close</button>    
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <button type="button" class="btn btn-sm btn-block btn-success">Save changes</button>    
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @include('layout/footer')
        </div>
    </body>
        <!-- All Js -->
        <script type="text/javascript" src="{{ asset('js/app.js') }}"></script>
        <script type="text/javascript" src="{{ asset('js/page/user.js') }}"></script>
</html>
