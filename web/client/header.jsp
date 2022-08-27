<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/dbconnect.jsp"></jsp:directive.include>
<% Object username = request.getSession().getAttribute("username");%>
<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <title>Quản lý nước hoa</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/x-icon" href="/assets/img/favicon.png">
        <!-- Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Raleway:400,700,600,500,300,800,900' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,400italic,500,300,300italic,500italic,700' rel='stylesheet'>

        <!-- Bootstrap CSS -->      
        <link rel="stylesheet" href="/template/home/css/bootstrap.min.css">
        <!-- font-awesome.min CSS -->      
        <link rel="stylesheet" href="/template/home/css/font-awesome.min.css">
        <!-- Mean Menu CSS -->
        <link rel="stylesheet" href="/template/home/css/meanmenu.min.css">
        <!-- owl.carousel CSS -->      
        <link rel="stylesheet" href="/template/home/css/owl.carousel.css">
        <!-- owl.theme CSS -->      
        <link rel="stylesheet" href="/template/home/css/owl.theme.css">
        <!-- owl.transitions CSS -->      
        <link rel="stylesheet" href="/template/home/css/owl.transitions.css">
        <!-- Price Filter CSS --> 
        <link rel="stylesheet" href="/template/home/css/jquery-ui.min.css">	
        <!-- nivo-slider css --> 
        <link rel="stylesheet" href="/template/home/css/nivo-slider.css">
        <!-- animate CSS -->         
        <link rel="stylesheet" href="/template/home/css/animate.css">
        <!-- jquery-ui-slider CSS --> 
        <link rel="stylesheet" href="/template/home/css/jquery-ui-slider.css">
        <!-- normalize CSS -->        
        <link rel="stylesheet" href="/template/home/css/normalize.css">
        <!-- main CSS -->          
        <link rel="stylesheet" href="/template/home/css/main.css">
        <!-- style CSS -->          
        <link rel="stylesheet" href="/template/home/css/style.css">
        <!-- responsive CSS -->          
        <link rel="stylesheet" href="/template/home/css/responsive.css">

        <script src="/template/home/js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body class="home-one">
        <!-- HEADER AREA -->
        <div class="header-area">
            <div class="header-top-bar">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <% if (username != null) {%>
                            <div class="header-top-left">
                                <p>Chào mừng, <%=request.getSession().getAttribute("fullname")%></p>
                            </div>
                            <% } %>
                        </div>
                        <div class="col-md-8 col-sm-8 col-xs-12">
                            <div class="header-top-right">
                                <ul class="list-inline">
                                    <% if (username != null && request.getSession().getAttribute("role").equals(1)) { %>
                                    <li><a href="/admin/"><i class="fa fa-user"></i>Quản trị</a></li>
                                        <% }%>
                                    <li><a href="#"><i class="fa fa-user"></i>Tài khoản của tôi</a></li>
                                    <li><a href="#"><i class="fa fa-check-square-o"></i>Thanh toán</a></li>
                                        <% if (username == null) { %>
                                    <li><a href="/client/account/login.jsp"><i class="fa fa-lock"></i>Đăng nhập</a></li>
                                    <li><a href="/client/account/registry.jsp"><i class="fa fa-pencil-square-o"></i>Đăng ký</a></li>
                                        <% } else { %>
                                    <li><a href="/client/account/logout.jsp"><i class="fa fa-pencil-square-o"></i>Đăng xuất</a></li>
                                        <% }%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-md-2 col-sm-2 col-xs-12">
                            <div class="header-logo">
                                <a href="/client/index.jsp"><img src="/assets/img/logo.png" alt="logo"></a>
                            </div>
                        </div>
                        <div class="col-md-10 col-sm-10 col-xs-12">
                            <div class="search-chart-list">
                                <div class="catagori-menu">
                                    <ul class="list-inline">
                                        <li><i class="fa fa-search"></i></li>
                                        <sql:query dataSource = "${db}" var = "list">select * from the_loai;</sql:query>
                                            <li>
                                                <select>
                                                    <option value="">Tất cả</option>
                                                <c:forEach var = "row" items = "${list.rows}">
                                                    <option value="${row.MaTL}">${row.TenTL}</option>
                                                </c:forEach>
                                            </select>
                                        </li>
                                    </ul>
                                </div>
                                <div class="header-search">
                                    <form action="/client/perfume/filter.jsp">
                                        <input name="search" type="text" placeholder="Từ khoá"/>
                                        <button><i class="fa fa-search"></i></button>
                                    </form>
                                </div>
                                <sql:query dataSource = "${db}" var = "list">select count(*) as count from gio_hang where TenDN = '<%=request.getSession().getAttribute("username")%>';</sql:query>
                                    <div class="header-chart" style="width: 238px">
                                    <% if (username != null) {%>
                                    <ul class="list-inline">
                                        <li><a href="#"><i class="fa fa-cart-arrow-down"></i></a></li>
                                        <li class="chart-li"><a href="/client/order/cart.jsp">Giỏ hàng</a></li>
                                        <li><a href="#">${list.getRows()[0].count} sản phẩm</a></li>
                                    </ul>
                                    <% }%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- MAIN MENU AREA -->
        <div class="main-menu-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="main-menu hidden-xs">
                            <nav>
                                <ul>
                                    <li><a href="/client/index.jsp">Trang chủ</a></li>
                                    <li><a href="/client/perfume/filter.jsp">Cửa hàng</a></li>
                                    <sql:query dataSource = "${db}" var = "list">select * from the_loai;</sql:query>
                                        <li><a href="#">Thể loại</a>
                                            <ul class="sub-menu">
                                            <c:forEach var = "row" items = "${list.rows}">
                                                <li><a href="/client/perfume/filter.jsp?category-id=${row.maTL}">${row.TenTL}</a></li>
                                                </c:forEach>
                                        </ul>
                                    </li>
                                    <% if (username != null) { %>
                                    <li><a href="/client/order/index.jsp">Đơn hàng của tôi</a></li>
                                        <% }%>
                                </ul>
                            </nav>
                        </div>
                        <!-- Mobile MENU AREA -->
                        <div class="mobile-menu hidden-sm hidden-md hidden-lg">
                            <nav>
                                <ul>
                                    <li><a href="index.html">Home</a></li>
                                    <li><a href="shop.html">Shop</a>
                                        <ul>
                                            <li><a href="#">Shop Layouts</a>
                                                <ul>
                                                    <li><a href="#">Full Width</a></li>
                                                    <li><a href="#">Sidebar Left</a></li>
                                                    <li><a href="#">Sidebar Right</a></li>
                                                    <li><a href="#">List View</a></li>
                                                </ul>	
                                            </li>
                                            <li><a href="#">Shop Pages</a>
                                                <ul>
                                                    <li><a href="#">Category</a></li>
                                                    <li><a href="#">My Account</a></li>
                                                    <li><a href="#">Wishlist</a></li>
                                                    <li><a href="#">Shopping Cart</a></li>
                                                </ul>	
                                            </li>
                                            <li><a href="#">Product Types</a>
                                                <ul>
                                                    <li><a href="#">Simple Product</a></li>
                                                    <li><a href="#">Variable Product</a></li>
                                                    <li><a href="#">Grouped Product</a></li>
                                                    <li><a href="#">Downloadable</a></li>
                                                </ul>	
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="shop.html">Men</a></li>
                                    <li><a href="shop.html">Women</a></li>
                                    <li><a href="shop.html">Kids</a></li>
                                    <li><a href="shop.html">gift</a></li>
                                    <li><a href="blog-left-sidebar.html">Blog</a>
                                        <ul>
                                            <li><a href="blog-right-sidebar.html">Blog Right Sidebar</a></li>
                                            <li><a href="blog-single.html">Blog Details</a></li>
                                        </ul>
                                    </li>
                                    <sql:query dataSource = "${db}" var = "list">select * from the_loai;</sql:query>
                                        <li><a href="#">Pages</a>
                                            <ul>
                                            <c:forEach var = "row" items = "${list.rows}">
                                                <li><a href="shop.html">${row.MaTL}</a></li>
                                                </c:forEach>
                                        </ul>
                                    </li>
                                    <li><a href="contact.html">contact</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>