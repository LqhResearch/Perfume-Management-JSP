<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/admin/header.jsp"></jsp:directive.include>
<jsp:directive.include file="/admin/sidebar.jsp"></jsp:directive.include>
<%
    String sql = "";
    if (request.getParameter("del-id") != null) {
        String id = request.getParameter("del-id");
        sql = "delete from the_loai where MaTL = " + id;
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
                                    <th width="118">Công cụ</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var = "row" items = "${list.rows}">
                                <tr>
                                    <td>${row.TenDN}</td>
                                    <td>${row.HoTen}</td>
                                    <td>${row.QuyenTC}</td>
                                    <td>
                                        <a href="/admin/category/edit.jsp?id=${row.MaTL}" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i> Sửa</a>
                                        <div onclick="RemoveRow('${row.MaTL}')" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Xoá</iv>
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