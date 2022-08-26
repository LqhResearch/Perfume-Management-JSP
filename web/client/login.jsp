<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/dbconnect.jsp"></jsp:directive.include>

<%
    String sql = "";
    if (request.getParameter("submit") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        sql = "select * from tai_khoan where TenDN = '" + username + "' and MatKhau = md5('" + password + "')";
    }
%>

<% if (!sql.isEmpty()) {%>
<sql:query dataSource = "${db}" var = "user"><%=sql%>;</sql:query>
<c:if test="${user != null}">
    <c:set var = "username" scope = "session" value = "${user.getRows()[0].TenDN}"/>
    <c:set var = "fullname" scope = "session" value = "${user.getRows()[0].HoTen}"/>
    <c:set var = "role" scope = "session" value = "${user.getRows()[0].QuyenTC}"/>
</c:if>
<%
        response.sendRedirect("/client/");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Forms</title>

        <link href="/template/login/css/bootstrap.min.css" rel="stylesheet">
        <link href="/template/login/css/datepicker3.css" rel="stylesheet">
        <link href="/template/login/css/styles.css" rel="stylesheet">
        <style>
            body {
                height: 100vh;
                background: center / cover no-repeat url("/assets/slider/s3.jpg");
            }
        </style>
    </head>

    <body>
        <div class="d-flex align-content-center justify-content-center">
            <div class="login-panel panel panel-default" style="width: 400px; margin: auto">
                <div class="panel-heading">Đăng nhập</div>
                <div class="panel-body">
                    <form role="form" method="POST">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="Tên đăng nhập" name="username" type="text" autofocus="">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Mật khẩu" name="password" type="password" value="">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input name="remember" type="checkbox" value="Remember Me">Nhớ mật khẩu
                                </label>
                            </div>
                            <button name="submit" value="submit" class="btn btn-primary">Đăng nhập</button>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>

        <script src="/template/login/js/jquery-1.11.1.min.js"></script>
        <script src="/template/login/js/bootstrap.min.js"></script>
        <script src="/template/login/js/chart.min.js"></script>
        <script src="/template/login/js/chart-data.js"></script>
        <script src="/template/login/js/easypiechart.js"></script>
        <script src="/template/login/js/easypiechart-data.js"></script>
        <script src="/template/login/js/bootstrap-datepicker.js"></script>
        <script>
            !function ($) {
                $(document).on("click", "ul.nav li.parent > a > span.icon", function () {
                    $(this).find('em:first').toggleClass("glyphicon-minus");
                });
                $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
            }(window.jQuery);

            $(window).on('resize', function () {
                if ($(window).width() > 768)
                    $('#sidebar-collapse').collapse('show')
            })
            $(window).on('resize', function () {
                if ($(window).width() <= 767)
                    $('#sidebar-collapse').collapse('hide')
            })
        </script>	
    </body>

</html>
