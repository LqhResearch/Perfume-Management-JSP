<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/admin/header.jsp"></jsp:directive.include>
<jsp:directive.include file="/admin/sidebar.jsp"></jsp:directive.include>
<%
    String id = request.getParameter("id");
    HashMap<String, String> formData = new HashMap<String, String>();

    String localPath = Helper.PRODUCT_UPLOAD;

    if (request.getContentType() != null && request.getContentType().indexOf("multipart/form-data") >= 0) {
        ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory(5120000, new File("c:\\temp")));

        try {
            List fileItems = upload.parseRequest(request);
            Iterator i = fileItems.iterator();

            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                if (!fi.isFormField()) {
                    String fileName = fi.getName();
                    File file = new File(localPath + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    fi.write(file);
                    formData.put("fileName", "/assets/upload/" + fileName);
                } else {
                    formData.put(fi.getFieldName(), fi.getString("UTF-8"));
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
%>

<%
    String sql = "";
    if (formData.get("action") != null && formData.get("action").equals("edit")) {
        sql = "update nuoc_hoa set TenNH = '" + formData.get("name") + "', MoTa = '" + formData.get("description") + "', HinhAnh = '" + formData.get("fileName") + "', Gia = " + formData.get("price") + ", MaTL = " + formData.get("category_id") + " where MaNH = " + id;
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
                <li class="breadcrumb-item"><a href="/admin/perfume/index.jsp">Nước hoa</a></li>
                <li class="breadcrumb-item active">Sửa</li>
            </ol>
        </div>
    </section>

    <sql:query dataSource = "${db}" var = "list">select * from nuoc_hoa where MaNH = <%=id%>;</sql:query>

        <div class="container-fluid my-3">
            <form class="card" method="POST" enctype="multipart/form-data">
                <div class="card-header bg-primary">
                    <h5 class="m-0">Sửa nước hoa</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <input type="hidden" name="action" value="edit" />
                        <div class="form-group col-md-6">
                            <label>Mã nước hoa</label>
                            <input type="text" class="form-control" name="id" value="${list.getRows()[0].MaNH}" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Tên nước hoa</label>
                        <input type="text" class="form-control" name="name" value="${list.getRows()[0].TenNH}">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Giá</label>
                        <input type="number" class="form-control" name="price" value="${list.getRows()[0].Gia}">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Hình ảnh</label>
                        <input type="file" class="form-control" name="fileName">
                    </div>
                    <sql:query dataSource = "${db}" var = "tl">select * from the_loai;</sql:query>
                        <div class="form-group col-md-6">
                            <label>Thể loại</label>
                            <select class="form-control select2" name="category_id">
                            <c:forEach var = "row" items = "${tl.rows}">
                                <option value="${row.MaTL}" ${tl.getRows()[0].MaTL == row.MaTL ? "selected" : ""}>${row.TenTL}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label>Mô tả</label>
                    <textarea id="summernote" name="description">${list.getRows()[0].MoTa}</textarea>
                </div>
            </div>
            <div class="card-footer">
                <button class="btn btn-primary"><i class="fas fa-save"></i> Lưu</button>
            </div>
        </form>
    </div>
</section>
</div>
<jsp:directive.include file="/admin/footer.jsp"></jsp:directive.include>
<script src="/assets/js/main.js"></script>