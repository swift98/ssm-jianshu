<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  User: swift
  Date: 2019/7/4
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
  <%pageContext.setAttribute("APP_PATH", request.getContextPath());%>
  <%pageContext.setAttribute("IMG_PATH", request.getContextPath().concat("/static/images/user/"));%>
  <title>个人中心</title>
  <link type="image/x-icon" rel="icon" href="${APP_PATH}/static/images/icons/favicon.ico">
  <link rel="stylesheet" href="${APP_PATH}/static/css/style.css">
  <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.css">
</head>
<body>
<jsp:include page="/jsp/head/head.jsp"></jsp:include>
<div class="top-80 detail-center">
  <div class="user-detail clearfix">
    <input type="hidden" value="${user.userid}" id="userid">
    <input type="hidden" value="${APP_PATH}" id="app_path">
    <img class="pull-left img-user img-thumbnail" src="${IMG_PATH.concat(user.photo)}" alt="avatar">
    <div class="pull-left">
      <p style="font-size: 24px">${user.name}</p>
      <p>
        <span class="prefix-item">年龄</span>
        ${user.age}
      </p>
      <p>
        <span class="prefix-item">性别</span>
        ${user.sex}
      </p>
      <p>
        <span class="prefix-item">居住地</span>
        ${user.family}
      </p>
      <p>
        <span class="prefix-item">个人简介</span>
        ${user.intro}
      </p>
      <p>
        <span class="prefix-item">邮箱</span>
        ${user.email}
      </p>
    </div>
  </div>
  <hr>
  <ul class="nav nav-pills nav-justified">
    <li id="my-article" class="active"><a href="javascript:void(0)">文章</a></li>
    <li id="my-comment"><a href="javascript:void(0)">评论</a></li>
    <c:if test="${!empty currentUser}">
      <li id="my-focus"><a href="javascript:void(0)">关注</a></li>
      <li id="focus-me"><a href="javascript:void(0)">粉丝</a></li>
      <li id="my-collect"><a href="javascript:void(0)">收藏</a></li>
    </c:if>
  </ul>
  <hr>
  <div id="tab-content"></div>
</div>

<script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
<script src="${APP_PATH}/static/js/user-detail.js"></script>
<%! String sense = ""; %>
<%
  //发帖后转到该界面，进行敏感词提醒
  //首先应该判断是否为空，否则会出错
  if (request.getSession().getAttribute("SenseWord") != null)
    sense = (String) request.getSession().getAttribute("SenseWord");
  if (!sense.equals("")) {
    sense = "你的文章中含有敏感字符，已交给管理员审核:\n " + sense;
%>
<input type="hidden" id="sensetive" value="<%=sense%>"></>
<script >alert(document.getElementById("sensetive").value)</script>

<script >alert("${"SenseWord"}")</script>

<%
    // request.setAttribute("SenseWord", "");
  } else {
    //out.print("<script>alert(\"你的文章很好:\n"+sense+"\")</script>");
  }
  request.getSession().setAttribute("SenseWord","");
%>
</body>
</html>