<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/admin/header.jsp"></jsp:directive.include>
<jsp:directive.include file="/admin/sidebar.jsp"></jsp:directive.include>

<%
    String sql = "";
    if (request.getParameter("action") != null) {
        String name = request.getParameter("name");
        sql = "insert into the_loai values (null, '" + name + "')";
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
                <li class="breadcrumb-item active">Thêm</li>
            </ol>
        </div>
    </section>

    <div class="container-fluid my-3">
        <form class="card" method="POST">
            <div class="card-header bg-primary">
                <h5 class="m-0">Thêm thể loại</h5>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <label>Tên thể loại</label>
                    <input type="text" class="form-control" name="name">
                </div>
            </div>
            <div class="card-footer">
                <button name="action" value="add" class="btn btn-primary"><i class="fas fa-save"></i> Lưu</button>
            </div>
        </form>
    </div>
</section>
</div>
<jsp:directive.include file="/admin/footer.jsp"></jsp:directive.include>
<script src="/assets/js/main.js"></script>