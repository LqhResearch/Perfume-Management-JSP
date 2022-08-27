<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/client/header.jsp"></jsp:directive.include>
<% String id = request.getParameter("id");%>
<div class="breadcurb-area">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/client/index.jsp">Trang chủ</a></li>
            <li><a href="/client/perfume/filter.jsp">Nước hoa</a></li>
            <li>Chi tiết nước hoa</li>
            <li><%=id%></li>
        </ul>
    </div>
</div>

<sql:query dataSource = "${db}" var = "res">select * from nuoc_hoa where MaNH = <%=id%>;</sql:query>

    <div class="product-item-area" style="margin-bottom: 15px">
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-sm-5">
                    <div class="product-item-tab">
                        <!-- Tab panes -->
                        <div class="single-tab-content">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="img-one">
                                    <img src="${res.getRows()[0].HinhAnh}" alt="tab-img">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-7 col-sm-7">
                <div class="product-tab-content">
                    <div class="product-tab-header">
                        <h1>${res.getRows()[0].TenNH}</h1>
                        <h3>${Helper.Currency(res.getRows()[0].Gia)}</h3>
                        <p></p>

                        <h3>Mô tả</h3>
                        <div>${res.getRows()[0].MoTa}</div>

                        <% if (username != null) {%>
                        <a class="btn btn__yellow" href="/client/order/cart.jsp?action=add&id=<%=id%>"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ</a>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:directive.include file="/client/footer.jsp"></jsp:directive.include>