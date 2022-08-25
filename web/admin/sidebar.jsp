<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="/admin/" class="brand-link">
        <img width="100%" src="/assets/img/logo.png" alt="Logo">
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="/assets/img/admin.png" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">Quản trị viên</a>
            </div>
        </div>

        <!-- SidebarSearch Form -->
        <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Tìm kiếm" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>

        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-th-large"></i>
                        <p>
                            Quản lý sản phẩm
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/template/adminlte/index.html" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Thể loại</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/template/adminlte/index2.html" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Nước hoa</p>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</aside>