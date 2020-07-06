<%--
  User: swift
  Date: 2019/7/4
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
  <jsp:include page="/jsp/head/head.jsp"></jsp:include>
  <jsp:include page="jsp/article/content.jsp"></jsp:include>

  <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
  <script src="${APP_PATH}/static/js/content.js"></script>

</body>
</html>
