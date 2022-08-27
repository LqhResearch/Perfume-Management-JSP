<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/client/header.jsp"></jsp:directive.include>

<sql:query dataSource = "${db}" var = "list">select * from the_loai, nuoc_hoa where the_loai.MaTL = nuoc_hoa.MaTL order by MaNH desc limit 2;</sql:query>
    <!-- Slider AREA -->
    <div class="slider-area">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-3">	
                    <div class="slider-left">
                        <h2>Sản phẩm mới</h2>
                        <div id="owl-slider-left" class="owl-carousel">
                        <c:forEach var = "row" items = "${list.rows}">
                            <div class="slider-left-carousel">
                                <div class="slider-left-product">
                                    <a href="#"><img src="${row.HinhAnh}" alt="product"></a>
                                    <div class="slider-product-button">
                                        <% if (username != null) {%>
                                        <p class="add-chart"><a href="/client/order/cart.jsp?action=add&id=${row.MaNH}">Thêm vào giỏ</a></p>
                                        <% }%>
                                    </div>
                                </div>
                                <p class="view-details"><a href="/client/perfume/detail.jsp?id=${row.MaNH}">Xem chi tiết</a></p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-sm-9">
                <!-- Main Slider -->
                <div class="main-slider">
                    <div class="slider">
                        <sql:query dataSource = "${db}" var = "list">select * from slider;</sql:query>
                            <div id="mainSlider" class="nivoSlider slider-image">
                            <c:forEach var = "row" items = "${list.rows}">
                                <img src="${row.Thumbnail}" alt="main slider" title="#htmlcaption1"/>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Product AREA -->
<div class="product-area">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-4"></div>

            <sql:query dataSource = "${db}" var = "list">select * from the_loai, nuoc_hoa where the_loai.MaTL = nuoc_hoa.MaTL;</sql:query>

                <div class="col-md-9 col-sm-8">
                    <div class="product-items-area">
                        <div class="product-items">
                            <h2 class="product-header">Nước hoa</h2>
                            <div class="row">
                                <div id="product-slider" class="owl-carousel">
                                <c:forEach var = "row" items = "${list.rows}">
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <div class="single-product-img">
                                                <a href="#">
                                                    <img style="height: 260px" class="primary-img" src="${row.HinhAnh}" alt="product">
                                                </a>
                                                <div class="single-product-action">
                                                    <a href="/client/perfume/detail.jsp?id=${row.MaNH} "><i class="fa fa-external-link"></i></a>
                                                        <% if (username != null) {%>
                                                    <a href="/client/order/cart.jsp?action=add&id=${row.MaNH}"><i class="fa fa-shopping-cart"></i></a>
                                                        <% } %>
                                                </div>
                                            </div>
                                            <div class="single-product-content">
                                                <div class="product-content-left">
                                                    <h2><a href="/client/perfume/detail.jsp?id=${row.MaNH}">${row.TenNH}</a></h2>
                                                    <p>${row.TenTL}</p>
                                                </div>
                                                <div class="product-content-right">
                                                    <h3>${Helper.Currency(row.Gia)}</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <sql:query dataSource = "${db}" var = "list">select * from the_loai, nuoc_hoa where the_loai.MaTL = nuoc_hoa.MaTL and the_loai.MaTL = 1;</sql:query>

                        <div class="product-items">
                            <h2 class="product-header">Nước hoa nam</h2>
                            <div class="row">
                                <div id="product-slider-two" class="owl-carousel">
                                <c:forEach var = "row" items = "${list.rows}">
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <div class="single-product-img">
                                                <a href="#">
                                                    <img style="height: 260px" class="primary-img" src="${row.HinhAnh}" alt="product">
                                                </a>
                                                <div class="single-product-action">
                                                    <a href="/client/perfume/detail.jsp?id=${row.MaNH}"><i class="fa fa-external-link"></i></a>
                                                        <% if (username != null) {%>
                                                    <a href="/client/order/cart.jsp?action=add&id=${row.MaNH}"><i class="fa fa-shopping-cart"></i></a>
                                                        <% } %>
                                                </div>
                                            </div>
                                            <div class="single-product-content">
                                                <div class="product-content-left">
                                                    <h2><a href="/client/perfume/detail.jsp?id=${row.MaNH}">${row.TenNH}</a></h2>
                                                    <p>${row.TenTL}</p>
                                                </div>
                                                <div class="product-content-right">
                                                    <h3>${Helper.Currency(row.Gia)}</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <sql:query dataSource = "${db}" var = "list">select * from the_loai, nuoc_hoa where the_loai.MaTL = nuoc_hoa.MaTL and the_loai.MaTL = 2;</sql:query>

                        <div class="product-items">
                            <h2 class="product-header">Nước hoa nữ</h2>
                            <div class="row">
                                <div id="product-slider-two" class="owl-carousel">
                                <c:forEach var = "row" items = "${list.rows}">
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <div class="single-product-img">
                                                <a href="#">
                                                    <img style="height: 260px" class="primary-img" src="${row.HinhAnh}" alt="product">
                                                </a>
                                                <div class="single-product-action">
                                                    <a href="/client/perfume/detail.jsp?id=${row.MaNH}"><i class="fa fa-external-link"></i></a>
                                                        <% if (username != null) {%>
                                                    <a href="/client/order/cart.jsp?action=add&id=${row.MaNH}"><i class="fa fa-shopping-cart"></i></a>
                                                        <% }%>
                                                </div>
                                            </div>
                                            <div class="single-product-content">
                                                <div class="product-content-left">
                                                    <h2><a href="/client/perfume/detail.jsp?id=${row.MaNH}">${row.TenNH}</a></h2>
                                                    <p>${row.TenTL}</p>
                                                </div>
                                                <div class="product-content-right">
                                                    <h3>${Helper.Currency(row.Gia)}</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:directive.include file="/client/footer.jsp"></jsp:directive.include>