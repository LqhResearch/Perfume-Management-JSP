<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/client/header.jsp"></jsp:directive.include>

<%
    Object username = request.getSession().getAttribute("username");
    String sql = "";
    if (request.getParameter("action") != null && request.getParameter("action").equals("add")) {
        String id = request.getParameter("id");
        sql = "insert into gio_hang values (null, " + id + ", '" + username + "', 1, now())";
    } else if (request.getParameter("action") != null && request.getParameter("action").equals("update")) {
        String id = request.getParameter("id");
        String quantity = request.getParameter("quantity");
        sql = "update gio_hang set SoLuong = " + quantity + " where ID = " + id;
    } else if (request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
        String id = request.getParameter("id");
        sql = "delete from gio_hang where ID = " + id;
    }
%>

<% if (!sql.isEmpty()) {%>
<sql:update dataSource = "${db}" var = "res"><%=sql%></sql:update>
<%
        response.sendRedirect("cart.jsp");
    }
%>

<div class="breadcurb-area">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="#">Trang chủ</a></li>
            <li><a href="#">Mua hàng</a></li>
            <li>Giỏ hàng của tôi</li>
        </ul>
    </div>
</div>

<sql:query dataSource = "${db}" var = "list">select * from gio_hang, nuoc_hoa where gio_hang.MaNH = nuoc_hoa.MaNH and TenDN = '<%=username%>';</sql:query>

    <div class="chart-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="chart-item table-responsive fix">
                        <table class="col-md-12">
                            <thead>
                                <tr>
                                    <th>Tên sản phẩm</th>
                                    <th class="th-product">Hình ảnh</th>
                                    <th>Giá</th>
                                    <th class="th-qty">Số lượng</th>
                                    <th>Thành tiền</th>
                                    <th width="50">Xoá</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var = "row" items = "${list.rows}">
                                <tr>
                                    <td>${row.TenNH}</td>
                                    <td>
                                        <a href="${row.HinhAnh}" target="_blank"><img src="${row.HinhAnh}" alt="cart"></a>
                                    </td>
                                    <td>${Helper.Currency(row.Gia)}</td>
                                    <td class="th-qty">
                                        <form>
                                            <input name="id" type="hidden" value="${row.id}" />
                                            <input name="quantity" type="number" min="1" placeholder="1" value="${row.SoLuong}">
                                            <button name="action" value="update" class="btn btn-sm btn-primary"><i class="fa fa-save"></i></button>
                                        </form>
                                    </td>
                                    <td>${Helper.Currency(row.SoLuong * row.Gia)}</td>
                                    <td><a href="?action=delete&id=${row.id}"><i class="fa fa-trash"></i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="cart-button">
                    <a href="/client/index.jsp" class="btn btn__yellow">Tiếp tục mua hàng</a>
                    <a href="/client/create-order.jsp" class="btn btn__yellow floatright">Tạo đơn hàng</a>
                </div>
            </div>
        </div>

        <sql:query dataSource = "${db}" var = "order">select SUM(Gia * SoLuong) as money from gio_hang, nuoc_hoa where gio_hang.MaNH = nuoc_hoa.MaNH and TenDN = '<%=username%>';</sql:query>

            <div class="row">
                <div class="cart-shopping-area fix">
                    <div class="col-md-8 col-sm-8"></div>
                    <div class="col-md-4 col-sm-4">
                        <div class="shopping-summary chart-all">
                            <div class="shopping-cost-area">
                                <h2>TỔNG CỘNG GIỎ HÀNG</h2>
                                <div class="shopping-cost">
                                    <div class="shopping-cost-left">
                                        <p>Tổng đơn hàng</p>
                                        <p>Thanh toán</p>
                                    </div>
                                    <div class="shopping-cost-right">
                                        <p>${Helper.Currency(order.getRows()[0].money)}</p>
                                    <p>${Helper.Currency(order.getRows()[0].money)}</p>
                                </div>
                            </div>
                            <button type="button" class="btn">Thanh toán</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:directive.include file="/client/footer.jsp"></jsp:directive.include>