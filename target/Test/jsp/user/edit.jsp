<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2019/7/8
  Time: 0:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <%pageContext.setAttribute("APP_PATH", request.getContextPath());%>
  <title>简书-简单你的创作</title>
  <link type="image/x-icon" rel="icon" href="${APP_PATH}/static/images/icons/favicon.ico">
  <link rel="stylesheet" href="${APP_PATH}/static/css/style.css">
  <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.css">
</head>
<body>
<jsp:include page="/jsp/head/head.jsp"></jsp:include>
<c:if test="${!empty currentUser}">
  <input type="hidden" id="app_path" value="${APP_PATH}">
  <div class="top-80 write-frame detail-center bottom-100">
    <form onsubmit="return check()" id="add-article" action="${APP_PATH}/user/updateUser.do" enctype="multipart/form-data" method="post">
      <input type="hidden" name="userid" value="${user.userid}">
      <input type="hidden" name="oldName" value="${user.photo}">
      <input name="imgUrl" id="choose-img" accept="image/*" type="file" style="display: none">
      <img id="img-choose" class="img-thumbnail img-edit" src="${APP_PATH.concat("/static/images/user/").concat(user.photo)}" alt="">
      <div style="height: 30px;"></div>
      用户名<input type="text" name="username" class="form-control" placeholder="用户名" value="${user.name}">
      <div style="height: 30px;"></div>
      密码<input type="password" name="password" class="form-control" placeholder="密码" value="${user.password}">
      <div style="height: 30px;"></div>
      年龄<input name="age" placeholder="年龄" class="form-control" value="${user.age}"/>
      <div style="height: 30px;"></div>
      性别<input name="sex" placeholder="性别" class="form-control" value="${user.sex}"/>
      <div style="height: 30px;"></div>
      邮箱<input type="text" name="email" placeholder="邮箱" class="form-control" value="${user.email}">
      <div style="height: 30px;"></div>
      个人简介<input name="intro" placeholder="个人简介" class="form-control" value="${user.intro}"/>
      <div style="height: 30px;"></div>
      家乡<input name="family" placeholder="家乡" class="form-control" value="${user.family}"/>
      <div style="height: 30px;"></div>
      <div style="text-align: center">
        <input class="btn btn-warning" type="reset" value="重置">
        <span style="margin: 0 20px;"></span>
        <input class="btn btn-success" type="submit" value="保存">
      </div>
    </form>
      <%--  <button id="article-submit" class="btn btn-block btn-info">提交</button>--%>
  </div>
</c:if>


<script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
<script src="${APP_PATH}/static/js/write.js"></script>
<script>
    function check() {
        if($("input[name='username']").val().length <= 0) {
            alert("用户名不能为空");
            return false;
        } else if($("textarea[name='password']").val().length <= 0) {
            alert("密码不能为空");
            return false;
        } else if($("input[name='email']").val().length <= 0) {
            alert("邮箱不能为空");
            return false;
        } else return true;
    }
</script>

</body>
</html>
