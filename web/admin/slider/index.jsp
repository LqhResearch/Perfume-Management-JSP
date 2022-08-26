<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/admin/header.jsp"></jsp:directive.include>
<jsp:directive.include file="/admin/sidebar.jsp"></jsp:directive.include>
<%
    String sql = "";
    if (request.getParameter("del-id") != null) {
        String id = request.getParameter("del-id");
        sql = "delete from slider where SliderID = " + id;
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
                <li class="breadcrumb-item"><a href="/admin/perfume/index.jsp">Slider</a></li>
                <li class="breadcrumb-item active">Danh sách chi tiết</li>
            </ol>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <a href="/admin/slider/add.jsp" class="btn btn-success"><i class="fas fa-plus"></i> Thêm</a>
        </div>

        <sql:query dataSource = "${db}" var = "list">select * from slider order by SliderID desc;</sql:query>

            <div class="container-fluid my-3">
                <div class="card">
                    <div class="card-body">
                        <table id="table_dt" class="table table-bordered table-striped">
                            <thead>
                                <tr class="bg-info">
                                    <th>Mã slider</th>
                                    <th>Tên slider</th>
                                    <th>Hình ảnh</th>
                                    <th width="118">Công cụ</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var = "row" items = "${list.rows}">
                                <tr>
                                    <td>${row.SliderID}</td>
                                    <td>${row.SliderName}</td>
                                    <td class="text-center">
                                        <a href="${row.Thumbnail}" target="_blank">
                                            <img height="50" src="${row.Thumbnail}" alt="" />
                                        </a>
                                    </td>
                                    <td>
                                        <a href="/admin/slider/edit.jsp?id=${row.SliderID}" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i> Sửa</a>
                                        <div onclick="RemoveRow('${row.SliderID}')" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Xoá</iv>
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