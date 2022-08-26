<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/dbconnect.jsp"></jsp:directive.include>

<% String orderID = request.getParameter("id");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoá đơn - <%=orderID%></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="/assets/css/bill.css" />
    </head>

    <sql:query dataSource = "${db}" var = "list">select * from don_hang, ct_don_hang, tai_khoan, nuoc_hoa where don_hang.DonHangID = ct_don_hang.DonHangID and ct_don_hang.MaNH = nuoc_hoa.MaNH and don_hang.TenDN = tai_khoan.TenDN and don_hang.DonHangID = '<%=orderID%>'</sql:query>
        <body>
            <div class="d-flex-center">
                <img width="400" src="/assets/img/logo.png" class="img-fluid" />
            </div>

            <div class="row my-3">
                <div class="col-md-6">
                    <h6 class="text-primary">I. THÔNG TIN ĐƠN HÀNG</h6>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td><b>Mã đơn hàng</b></td>
                                <td>${list.getRows()[0].DonHangID}</td>
                        </tr>
                        <tr>
                            <td><b>Ngày đặt hàng</b></td>
                            <td>${Helper.Date(list.getRows()[0].NgayTT)}</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="col-md-6">
                <h6 class="text-primary">II. THÔNG TIN KHÁCH HÀNG</h6>
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <td><b>Mã khách hàng</b></td>
                            <td>${list.getRows()[0].TenDN}</td>
                        </tr>
                        <tr>
                            <td><b>Tên khách hàng</b></td>
                            <td>${list.getRows()[0].HoTen}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <h6 class="text-primary">III. CHI TIẾT ĐƠN HÀNG</h6>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Mã nước hoa</th>
                    <th>Tên nước hoa</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var = "row" items = "${list.rows}">
                    <tr>
                        <td>${row.MaNH}</td>
                        <td>${row.TenNH}</td>
                        <td>${Helper.Currency(row.Gia)}</td>
                        <td>${row.SoLuong}</td>
                        <td>${Helper.Currency(row.Gia * row.SoLuong)}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4"><b>Tổng cộng</b></td>
                    <td>${Helper.Currency(list.getRows()[0].ThanhToan)}</td>
                </tr>
            </tbody>
        </table>

        <div class="d-flex-center">
            <c:if test="${list.getRows()[0].DaThanhToan == 1}">
                <img width="250" src="/assets/img/paid.jpg" />
            </c:if>
        </div>

        <% String url = request.getRequestURL() + "?" + request.getQueryString();%>
        <p>Xác thực tại: <a href="<%=url%>" target="_blank">tại đây</a></p>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script>
            window.print();
        </script>
    </body>
</html>