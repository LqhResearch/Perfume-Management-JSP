<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/admin/header.jsp"></jsp:directive.include>
<jsp:directive.include file="/admin/sidebar.jsp"></jsp:directive.include>

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
            <div class="container-fluid">
                <a href="/admin/perfume/add.jsp" class="btn btn-success"><i class="fas fa-plus"></i> Thêm</a>
            </div>

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
                                    <th width="82">Công cụ</th>
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
                                    <td>
                                        <a href="/client/order/bill.jsp?id=${row.DonHangID}" class="btn btn-primary btn-sm"><i class="fas fa-file-invoice"></i> Hoá đơn</a>
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