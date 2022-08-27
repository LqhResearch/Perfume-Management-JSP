<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/admin/header.jsp"></jsp:directive.include>
<jsp:directive.include file="/admin/sidebar.jsp"></jsp:directive.include>
<%
    String sql = "";
    if (request.getParameter("lock-id") != null) {
        String id = request.getParameter("lock-id");
        sql = "update tai_khoan set TrangThai = 0 where TenDN = '" + id + "'";
    } else if (request.getParameter("unlock-id") != null) {
        String id = request.getParameter("unlock-id");
        sql = "update tai_khoan set TrangThai = 1 where TenDN = '" + id + "'";
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
                <li class="breadcrumb-item">Quản lý tài khoản</li>
                <li class="breadcrumb-item active"><a href="/admin/account/index.jsp">Tài khoản</a></li>
                <li class="breadcrumb-item active">Danh sách chi tiết</li>
            </ol>
        </div>
    </section>

    <section class="content">
        <sql:query dataSource = "${db}" var = "list">select * from tai_khoan;</sql:query>

            <div class="container-fluid my-3">
                <div class="card">
                    <div class="card-body">
                        <table id="table_dt" class="table table-bordered table-striped">
                            <thead>
                                <tr class="bg-info">
                                    <th>Tên đăng nhập</th>
                                    <th>Họ tên</th>
                                    <th>Loại tài khoản</th>
                                    <th>Trạng thái</th>
                                    <th width="67">Công cụ</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var = "row" items = "${list.rows}">
                                <tr>
                                    <td>${row.TenDN}</td>
                                    <td>${row.HoTen}</td>
                                    <td>${Helper.Span(row.QuyenTC == 1, "Quản trị viên", "Thành viên")}</td>
                                    <td>${Helper.Status(row.TrangThai == 1, "Hoạt động", "Khoá")}</td>
                                    <td>
                                        <c:if test="${row.TrangThai == 1}">
                                            <a href="?lock-id=${row.TenDN}" class="btn btn-danger btn-sm"><i class="fas fa-lock"></i> Khoá</a>
                                        </c:if>
                                        <c:if test="${row.TrangThai == 0}">
                                            <a href="?unlock-id=${row.TenDN}" class="btn btn-primary btn-sm"><i class="fas fa-unlock"></i> Mở</a>
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