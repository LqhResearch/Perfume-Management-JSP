<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/admin/header.jsp"></jsp:directive.include>
<jsp:directive.include file="/admin/sidebar.jsp"></jsp:directive.include>
<%
    String id = request.getParameter("id");
    String sql = "";
    if (request.getParameter("action") != null) {
        String name = request.getParameter("name");
        sql = "update the_loai set TenTL = '" + name + "' where MaTL = " + id;
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
                <li class="breadcrumb-item">Quản lý sản phẩm</li>
                <li class="breadcrumb-item active"><a href="/admin/category/index.jsp">Thể loại</a></li>
                <li class="breadcrumb-item active">Sửa</li>
            </ol>
        </div>
    </section>

    <sql:query dataSource = "${db}" var = "list">select * from the_loai where MaTL = <%=id%>;</sql:query>

        <div class="container-fluid my-3">
            <form class="card" method="POST">
                <div class="card-header bg-primary">
                    <h5 class="m-0">Sửa thể loại</h5>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label>Mã thể loại</label>
                        <input type="text" class="form-control" value="${list.getRows()[0].MaTL}" name="id" readonly>
                </div>
                <div class="form-group">
                    <label>Tên thể loại</label>
                    <input type="text" class="form-control" value="${list.getRows()[0].TenTL}" name="name">
                </div>
            </div>
            <div class="card-footer">
                <button name="action" value="edit" class="btn btn-primary"><i class="fas fa-save"></i> Lưu</button>
            </div>
        </form>
    </div>
</section>
</div>
<jsp:directive.include file="/admin/footer.jsp"></jsp:directive.include>
<script src="/assets/js/main.js"></script>