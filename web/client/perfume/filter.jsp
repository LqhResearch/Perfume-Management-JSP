<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/client/header.jsp"></jsp:directive.include>

<%
    String subFilter = "";
    if (request.getParameter("category-id") != null) {
        subFilter = " and nuoc_hoa.MaTL = " + request.getParameter("category-id");
    } else if (request.getParameter("search") != null) {
        subFilter = " and TenNH like '%" + request.getParameter("search") + "%'";
    }
%>

<div class="breadcurb-area">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="#">Trang chủ</a></li>
            <li>Nước hoa</li>
        </ul>
    </div>
</div>

<sql:query dataSource = "${db}" var = "list">select * from the_loai;</sql:query>

    <div class="product-item-area">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4">
                    <div class="product-item-categori">
                        <div class="product-type">
                            <h2>Thể loại</h2>
                            <ul>
                                <li>
                                    <a href="filter.jsp">
                                        <i class="fa fa-angle-right"></i>Xem tất cả
                                    </a>
                                </li>
                            <c:forEach var = "row" items = "${list.rows}">
                                <li>
                                    <a href="?category-id=${row.MaTL}">
                                        <i class="fa fa-angle-right"></i>${row.TenTL}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-sm-8">
                <div class="product-item-list">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="product-item-heading">
                                <div class="item-heading-title">
                                    <h2>Nước hoa</h2>
                                </div>
                            </div>
                        </div>
                    </div>

                    <sql:query dataSource = "${db}" var = "list">select * from the_loai, nuoc_hoa where the_loai.MaTL = nuoc_hoa.MaTL <%=subFilter%>;</sql:query>

                        <div class="row">
                        <c:forEach var = "row" items = "${list.rows}">
                            <div class="col-md-4 col-sm-6">
                                <div class="single-item-area">
                                    <div class="single-item">
                                        <div class="product-item-img">
                                            <a href="#">
                                                <img class="primary-img" style="height: 260px;" src="${row.HinhAnh}" alt="item">
                                            </a>
                                            <div class="product-item-action">
                                                <a href="/client/perfume/detail.jsp?id=${row.MaNH}"><i class="fa fa-external-link"></i></a>
                                                <a href="/client/cart.jsp?action=add&id=${row.MaNH}"><i class="fa fa-shopping-cart"></i></a>
                                            </div>
                                        </div>
                                        <div class="single-item-content">
                                            <h2><a href="/client/perfume/detail.jsp?id=${row.MaNH}">${row.TenNH}</a></h2>
                                            <div class="best-product-rating">
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                            </div>
                                            <h3>${Helper.Currency(row.Gia)}</h3>
                                        </div>
                                    </div>
                                    <div class="item-action-button fix">
                                        <a href="/client/cart.jsp?action=add&id=${row.MaNH}"><i class="fa fa-cart-arrow-down"></i>Thêm vào giỏ</a>
                                        <div class="item-action-icon">
                                            <a href="#"><i class="fa fa-heart"></i></a>
                                            <a href="#"><i class="fa fa-signal"></i></a>
                                            <a href="#"><i class="fa fa-search"></i></a>
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
<jsp:directive.include file="/client/footer.jsp"></jsp:directive.include>