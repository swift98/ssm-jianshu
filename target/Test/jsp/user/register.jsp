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
    <li role="presentation"><a href="${APP_PATH}/user/toLogin.do">登录</a></li>
    <li role="presentation" class="active"><a href="#">注册</a></li>
  </ul>
  <div style="height: 30px;"></div>
  <form onsubmit="check()" action="${APP_PATH}/user/register.do" method="post">
    <div class="form-group">
      <label for="inputName" class="sr-only">userName</label>
      <input name="username" type="text" class="form-control" id="inputName" placeholder="用户名">
    </div>
    <div style="height: 15px;"></div>
    <div class="form-group">
      <label for="inputPassword1" class="sr-only">Password</label>
      <input name="password" type="password" class="form-control" id="inputPassword1" placeholder="密码">
    </div>
    <div style="height: 15px;"></div>
    <div class="form-group">
      <label for="inputPassword2" class="sr-only">Password</label>
      <input type="password" class="form-control" id="inputPassword2" placeholder="确认密码">
    </div>
    <div style="height: 15px;"></div>
    <div class="form-group">
      <label for="inputEmail" class="sr-only">Password</label>
      <input name="email" type="text" class="form-control" id="inputEmail" placeholder="邮箱">
    </div>
    <div style="height: 15px;"></div>
    <input class="btn btn-primary btn-block" type="submit" value="注册">
  </form>
</div>

<script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
<script>
    $(function() {
        $("body").css("backgroundColor", "#f0f0f0");
        $(".login-container").css("backgroundColor", "#fff");
    });

  function check() {
      var username = $("#inputName").val();
      var password1 = $("#inputPassword1").val();
      var password2 = $("#inputPassword2").val();
      var email = $("#inputEmail").val();
      if(username.length <= 0) {
          alert("用户名不能为空");
          return false;
      }
      if(password1.length <= 0 || password2.length <= 0) {
          alert("密码不能为空");
          return false;
      }
      if(password1 !== password2) {
          alert("两次密码不一致");
          return false;
      }
      if(email.length <= 0) {
          alert("用户邮箱不能为空");
      }
      return true;
  }
</script>

</body>
</html>