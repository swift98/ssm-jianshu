<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2019/7/5
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
  <%pageContext.setAttribute("APP_PATH", request.getContextPath());%>
  <title>简书-简单你的创作</title>
  <link type="image/x-icon" rel="icon" href="${APP_PATH}/static/images/icons/favicon.ico">
  <link rel="stylesheet" href="${APP_PATH}/static/css/style.css">
  <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.css">
</head>
<body>
<%--<jsp:include page="/jsp/head/head.jsp"></jsp:include>--%>
<a href="${APP_PATH}">
  <img class="logo-pic" src="${APP_PATH}/static/images/icons/logo.png" alt="logo">
</a>
<div class="top-80 login-container">
  <ul class="nav nav-tabs nav-justified">
    <li role="presentation" class="active"><a href="javascript:void(0)">登录</a></li>
    <li role="presentation"><a href="${APP_PATH}/user/toRegister.do">注册</a></li>
  </ul>
  <div style="height: 30px;"></div>
  <form action="${APP_PATH}/user/login.do" method="post">
    <div class="form-group">
      <label for="inputName" class="sr-only">userName</label>
      <input type="text" name="inputName" class="form-control" id="inputName" placeholder="用户名">
    </div>
    <div style="height: 20px;"></div>
    <div class="form-group">
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" name="inputPassword" class="form-control" id="inputPassword" placeholder="密码">
    </div>
    <div style="height: 20px;"></div>
    <input class="btn btn-primary btn-block" type="submit" value="登录">
  </form>
</div>

<script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
<script>
  $(function() {
      $("body").css("backgroundColor", "#f0f0f0");
      $(".login-container").css("backgroundColor", "#fff");
  })
</script>

</body>
</html>

