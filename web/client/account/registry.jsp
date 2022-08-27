<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="/dbconnect.jsp"></jsp:directive.include>
<%
    String sql = "";
    if (request.getParameter("submit") != null) {
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");

        if (password1.equals(password2)) {
            sql = "insert into tai_khoan values ('" + username + "', '" + fullname + "', md5('" + password1 + "'), 2, 1)";
        }
    }
%>

<% if (!sql.isEmpty()) {%>
<sql:update dataSource = "${db}" var = "res"><%=sql%>;</sql:update>
<%
        response.sendRedirect("/client/account/login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Đăng ký</title>
        <link rel="icon" href="/assets/img/favicon.png" />

        <link href="/template/login/css/bootstrap.min.css" rel="stylesheet">
        <link href="/template/login/css/styles.css" rel="stylesheet">
        <style>
            body {
                height: 100vh;
                background: center / cover no-repeat url("/assets/slider/s3.jpg");
            }

            .d-flex-between {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
        </style>
    </head>

    <body>
        <div class="d-flex align-content-center justify-content-center">
            <div class="login-panel panel panel-default" style="width: 400px; margin: auto">
                <div class="panel-heading">Đăng ký</div>
                <div class="panel-body">
                    <form role="form" method="POST">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="Tên đăng nhập" name="username" type="text">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Họ tên" name="fullname" type="text">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Mật khẩu" name="password1" type="password">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Nhập lại mật khẩu" name="password2" type="password">
                            </div>
                            <div class="d-flex-between">
                                <button name="submit" value="submit" class="btn btn-primary">Đăng ký</button>
                                <a href="/client/account/login.jsp" class="btn btn-outline-light">Đăng nhập ngay</a>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>

        <script src="/template/login/js/jquery-1.11.1.min.js"></script>
        <script src="/template/login/js/bootstrap.min.js"></script>
    </body>

</html>
