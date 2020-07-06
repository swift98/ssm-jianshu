<%--
  User: swift
  Date: 2019/7/7
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
  <%pageContext.setAttribute("APP_PATH", request.getContextPath());%>
  <%pageContext.setAttribute("IMG_PATH", request.getContextPath().concat("/static/images/article/"));%>
  <title>简书-简单你的创作</title>
  <link type="image/x-icon" rel="icon" href="${APP_PATH}/static/images/icons/favicon.ico">
  <link rel="stylesheet" href="${APP_PATH}/static/css/style.css">
  <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.css">
</head>
<body>
<jsp:include page="/jsp/head/head.jsp"></jsp:include>
<input type="hidden" value="${APP_PATH}" id="app_path">
<div class="detail-center top-80">
  <div>
    <img class="banner" src="${APP_PATH}/static/images/icons/plate.png" alt="banner">
  </div>
  <div class="top-30 wid-100">
    <c:if test="${!empty list}">
      <c:forEach var="article" items="${list}">
        <div class="top-20 clearfix">
          <div class="wid-70 pull-left">
            <a href="${APP_PATH.concat("/article/detail.do?id=").concat(article.fid)}"><h4>${article.titles}</h4></a>
            <p>${fn:substring(article.fcontent, 0, 100)}</p>
            <a href="${APP_PATH.concat("/user/user-info.do?id=").concat(article.userid)}">
              <small>
            <span class="glyphicon glyphicon-user" aria-hidden="true">
                ${article.username}
            </span>
              </small>
            </a>
            <span style="margin: 0 10px;"></span>
            <a href="javascript:void(0);">
              <small>
            <span class="glyphicon glyphicon-map-marker" aria-hidden="true">
            </span>${article.bname}
              </small>
            </a>
          </div>
          <div class="wid-30 pull-right">
            <a href="#">
              <img class="article-pic" src="${IMG_PATH.concat(article.photo)}" alt="picture">
            </a>
          </div>
        </div>
        <hr>
      </c:forEach>
    </c:if>
    <c:if test="${empty list}">
      <img class="center-block img-thumbnail" src="${APP_PATH}/static/images/icons/null.png" alt="">
    </c:if>
  </div>
</div>

<script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
<script src="${APP_PATH}/static/js/loadMore-plate.js"></script>
</body>
</html>

