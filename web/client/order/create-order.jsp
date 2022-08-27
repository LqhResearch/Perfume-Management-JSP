<%@ page contentType = "text/html" pageEncoding = "UTF-8"%>
<jsp:directive.include file="/client/header.jsp"></jsp:directive.include>
<%
    // Get username
    username = request.getSession().getAttribute("username");
    // Create orderID by random integer
    Random rd = new Random();
    String orderID = "PS";
    for (int i = 0; i < 10; i++) {
        orderID += String.valueOf(rd.nextInt(10));
    }
%>
<sql:query dataSource = "${db}" var = "totalMoney">select IFNULL(SUM(Gia * SoLuong), 0) as money from gio_hang, nuoc_hoa where gio_hang.MaNH = nuoc_hoa.MaNH and gio_hang.TenDN = '<%=username%>'</sql:query>
<sql:query dataSource = "${db}" var = "cartList">select * from gio_hang where TenDN = '<%=username%>';</sql:query>

    <!--Create new order-->
<sql:update dataSource = "${db}" var = "nonQuery">
    insert into don_hang values ('<%=orderID%>', '<%=username%>', ${totalMoney.getRows()[0].money}, ${totalMoney.getRows()[0].money}, now(), 0)
</sql:update>

<!--Create order details-->
<c:forEach var = "row" items = "${cartList.rows}">
    <sql:update dataSource = "${db}" var = "nonQuery">
        insert into ct_don_hang values (null, '<%=orderID%>', ${row.MaNH}, ${row.SoLuong})
    </sql:update>
</c:forEach>

<!--Delete carts-->
<sql:update dataSource = "${db}" var = "nonQuery">
    delete from gio_hang where TenDN = '<%=username%>'
</sql:update>

<% response.sendRedirect("/client/order/index.jsp");%>

<jsp:directive.include file="/client/footer.jsp"></jsp:directive.include>