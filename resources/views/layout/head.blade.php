<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            @php $hotel = explode(',', Auth::user()->hotel); @endphp
            <select class="form-control" id="select_hotel" onchange="Change_select_hotel(this);">
                @foreach ($hotel as $row)
                    <option value="{{ $row }}">{{ $row }}</option>    
                @endforeach
            </select>
        </li>
    </ul>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" href="{{ url('api/v1/Do_logout') }}">
                <i class="fas fa-power-off"></i> ออกจากระบบ
            </a>
        </li>
    </ul>
</nav>