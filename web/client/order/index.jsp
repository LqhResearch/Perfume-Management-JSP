<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/client/header.jsp"></jsp:directive.include>
    <div class="breadcurb-area">
        <div class="container">
            <ul class="breadcrumb">
                <li><a href="/client/index.jsp">Trang chủ</a></li>
                <li><a href="/client/perfume/filter.jsp">Mua hàng</a></li>
                <li>Đơn hàng của tôi</li>
            </ul>
        </div>
    </div>

<sql:query dataSource = "${db}" var = "list">select * from don_hang where TenDN = '<%=username%>' order by DonHangID;</sql:query>

    <div class="chart-area">
        <div class="container">
            <div class="row" style="margin-bottom: 16px">
                <div class="col-md-12">
                    <div class="chart-item table-responsive fix">
                        <table class="col-md-12">
                            <thead>
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Tổng đơn hàng</th>
                                    <th>Ngày đặt hàng</th>
                                    <th>Trạng thái</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var = "row" items = "${list.rows}">
                                <tr>
                                    <td>${row.DonHangID}</td>
                                    <td>${Helper.Currency(row.ThanhToan)}</td>
                                    <td>${row.NgayTT}</td>
                                    <td>${Helper.Span(row.DaThanhToan == 1, "Thanh toán", "Chưa thanh toán")}</td>
                                    <td><a href="/client/order/bill.jsp?id=${row.DonHangID}"><i class="fa fa-eye"></i>Xem chi tiết</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <jsp:directive.include file="/client/footer.jsp"></jsp:directive.include>