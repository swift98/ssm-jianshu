<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>网站后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!--可无视-->
    <link rel="stylesheet" href="${APP_PATH }/static/css/bootstrap.min.css">

    <!--主要样式-->
    <link type="text/css" href="${APP_PATH }/static/css/adminstyle.css" rel="stylesheet" />


</head>
<body background="${APP_PATH}/static/img/admin/banner.jpg">

<div class="container" align="center">
    <div class="col-md-6" style="margin-top: 20%;">
        <div class="inset">
            <form name="login" id="login" action="${APP_PATH}/adminController/getLogin.do" method="post" >
                <input type="hidden" name="enews" value="login">
                <div>
                    <h2>管理员登录</h2>
                    <span style="text-align: left;text-indent: 0.4em;"><label>用户名</label></span>
                    <span><input type="text" name="aname" class="textbox" ></span>
                </div>
                <div>
                    <span style="text-align: left;text-indent: 0.4em;"><label>密码</label></span>
                    <span><input  name="apassword" type="password" class="password"></span>
                </div>
                <div class="sign">
                    <input type="reset"  class="submit" value="重置"/>
                    <input type="submit" value="登录" class="submit" />
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>