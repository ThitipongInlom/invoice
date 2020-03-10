<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>{{ config('app.name') }} | Register</title>
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <!-- All Css -->
        <link rel="stylesheet" type="text/css" href="{{ url('css/app.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ url('css/auth/register.css') }}">
    </head>
    <body>
        <div class="login-box" style="margin-top: 100px;">
            <div class="login-logo">
                <a href="#"><b>Invoice</b> Register</a>
            </div>
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-body login-card-body">
                <p class="login-box-msg">Sign in to start your session</p>
                <div class="form_login">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="username" placeholder="Username">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <i class="fas fa-user"></i>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" id="password" placeholder="Password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="name" placeholder="Name">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <i class="fas fa-signature"></i>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <button type="button" id="submit_login" class="btn btn-primary btn-loading btn-block"><i class="fas fa-sign-in-alt"></i> Register</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </body>
        <!-- All Js -->
        <script type="text/javascript" src="{{ url('js/app.js') }}"></script>
        <script type="text/javascript" src="{{ url('js/auth/register.js') }}"></script>
</html>
