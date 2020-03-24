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
                                <h1>System</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item active">Setting</li>
                                    <li class="breadcrumb-item active">System</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    </section>

                    <section class="content">
                        <div class="card">
                            <div class="card-header mb-2 pb-2">
                                <h3 class="card-title">รายการที่สามารถ ตั้งค่าได้</h3>

                                <div class="card-tools">

                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 col-md-12">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            @include('layout/footer')
        </div>
    </body>
        <!-- All Js -->
        <script type="text/javascript" src="{{ asset('js/app.js') }}"></script>
        <script type="text/javascript" src="{{ asset('js/page/user.js') }}"></script>
</html>
