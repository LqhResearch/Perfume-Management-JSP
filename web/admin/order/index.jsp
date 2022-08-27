<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/admin/header.jsp"></jsp:directive.include>
<jsp:directive.include file="/admin/sidebar.jsp"></jsp:directive.include>
<%
    String id = request.getParameter("id");
    String sql = "";
    if (request.getParameter("action") != null) {
        sql = "update don_hang set DaThanhToan = 1 where DonHangID = '" + id + "'";
    }
%>

<% if (!sql.isEmpty()) {%>
<sql:update dataSource = "${db}" var = "res"><%=sql%></sql:update>
<%
        response.sendRedirect("index.jsp");
    }
%>
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/"><i class="fas fa-home"></i></a></li>
                <li class="breadcrumb-item">Quản lý đơn hàng</li>
                <li class="breadcrumb-item"><a href="/admin/perfume/index.jsp">Đơn hàng</a></li>
                <li class="breadcrumb-item active">Danh sách chi tiết</li>
            </ol>
        </div>
    </section>

    <section class="content">
        <sql:query dataSource = "${db}" var = "list">select * from don_hang order by NgayTT desc;</sql:query>
            <div class="container-fluid my-3">
                <div class="card">
                    <div class="card-body">
                        <table id="table_dt" class="table table-bordered table-striped">
                            <thead>
                                <tr class="bg-info">
                                    <th>Mã đơn hàng</th>
                                    <th>Tên khách hàng</th>
                                    <th>Tổng đơn hàng</th>
                                    <th>Thanh toán</th>
                                    <th>Ngày đặt hàng</th>
                                    <th>Trạng thái</th>
                                    <th width="190">Công cụ</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var = "row" items = "${list.rows}">
                                <tr>
                                    <td>${row.DonHangID}</td>
                                    <td>${row.TenDN}</td>
                                    <td>${Helper.Currency(row.TongDonHang)}</td>
                                    <td>${Helper.Currency(row.ThanhToan)}</td>
                                    <td>${Helper.DateTime(row.NgayTT)}</td>
                                    <td>${Helper.Span(row.DaThanhToan == 1, "Thanh toán", "Chưa thanh toán")}</td>
                                    <td>
                                        <a href="/client/order/bill.jsp?id=${row.DonHangID}" class="btn btn-primary btn-sm"><i class="fas fa-file-invoice"></i> Hoá đơn</a>
                                        <c:if test="${row.DaThanhToan == 0}">
                                            <a href="?action=pay&id=${row.DonHangID}" class="btn btn-warning btn-sm"><i class="fab fa-cc-apple-pay"></i> Thanh toán</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</div>
<jsp:directive.include file="/admin/footer.jsp"></jsp:directive.include>
<script src="/assets/js/main.js"></script>