<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <div class="sidebar">
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="{{ url('img/web_setting/user2-160x160.jpg') }}" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block"><b>{{ Auth::user()->name }}</b></a>
            </div>
        </div>

        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item has-treeview  {{ Request::is('/') ? 'menu-open' : '' }}">
                    <a href="#" class="nav-link {{ Request::is('/') ? 'active' : '' }}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Invoice
                            <i class="right fas fa-bars"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ url('/') }}" class="nav-link {{ Request::is('/') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>List Invoice</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item has-treeview  {{ Request::is('dashboard_bill') ? 'menu-open' : '' }}">
                    <a href="#" class="nav-link {{ Request::is('dashboard_bill') ? 'active' : '' }}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Invoice Bill
                            <i class="right fas fa-bars"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ url('/dashboard_bill') }}" class="nav-link {{ Request::is('dashboard_bill') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>List Invoice Bill</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item has-treeview  {{ Request::is('user', 'system') ? 'menu-open' : '' }}">
                    <a href="#" class="nav-link {{ Request::is('user', 'system') ? 'active' : '' }}">
                        <i class="nav-icon fas fa-sliders-h"></i>
                        <p>
                            Setting
                            <i class="right fas fa-bars"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ url('user') }}" class="nav-link {{ Request::is('user') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Setting User</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ url('system') }}" class="nav-link {{ Request::is('system') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Setting System</p>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</aside>