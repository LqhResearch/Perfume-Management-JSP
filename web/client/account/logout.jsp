<%
    request.getSession().setAttribute("username", null);
    response.sendRedirect("/client/index.jsp");
%>