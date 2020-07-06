<%--
  User: swift
  Date: 2019/7/4
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
  <%pageContext.setAttribute("APP_PATH", request.getContextPath());%>
  <%pageContext.setAttribute("IMG_PATH", request.getContextPath().concat("/static/images/user/"));%>
  <title>简书-简单你的创作</title>
  <link type="image/x-icon" rel="icon" href="${APP_PATH}/static/images/icons/favicon.ico">
  <link rel="stylesheet" href="${APP_PATH}/static/css/style.css">
  <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.css">
</head>
<body>
<jsp:include page="/jsp/head/head.jsp"></jsp:include>
<input type="hidden" value="${APP_PATH}" id="app_path">
<div class="top-80 detail-center">
  <h1 class="text-center">
    ${article.titles}
  </h1>
  <div class="author-info clearfix">
    <div class="pull-left wid-10">
      <a href="${APP_PATH.concat("/user/user-info.do?id=").concat(article.userid)}">
        <img class="user-pic" src="${IMG_PATH.concat(user.photo)}" alt="avatar">
      </a>
    </div>
    <div class="pull-right wid-90">
      <div>
        <a href="${APP_PATH.concat("/user/user-info.do?id=").concat(article.userid)}"><strong>${user.name}</strong></a>
        <span style="margin: 0 2px;"></span>
        <small>${user.intro}</small>
      </div>
      <div style="height: 10px;"></div>
      <div>
        <small>${article.time}&nbsp;&nbsp;&nbsp;</small>
        <c:if test="${article.status == 1}"><span class="label label-success">审核通过</span></c:if>
        <c:if test="${article.status == 0}"><span class="label label-warning">审核中。</span></c:if>
        <c:if test="${article.status == 2}"><span class="label label-success">审核不通过</span></c:if>
      </div>
    </div>
    <c:if test="${empty currentUser}">
      <a href="${APP_PATH}/user/toLogin.do">
        <button class="btn btn-info btn-guanzhu"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;关注</button>
      </a>
    </c:if>
    <c:if test="${!empty currentUser}">
      <c:if test="${article.userid != currentUser.userid}">
        <c:set var="flag" value="false"/>
        <c:forEach items="${focusList}" var="focus">
          <c:if test="${focus == article.userid}">
            <c:set var="flag" value="true" />
          </c:if>
        </c:forEach>
        <c:if test="${flag}">
          <button id="delete-focus" onclick="deleteFocus(${currentUser.userid}, ${article.userid})" class="btn btn-primary btn-guanzhu"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;取消关注</button>
        </c:if>
        <c:if test="${!flag}">
          <button id="add-focus" onclick="addFocus(${currentUser.userid}, ${article.userid})" class="btn btn-info btn-guanzhu"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;关注</button>
        </c:if>
      </c:if>
    </c:if>
  </div>
  <div class="article-content pos-relative">
    <img class="article-img" src="${APP_PATH.concat("/static/images/article/").concat(article.photo)}" alt="photo">
    <p style="line-height: 30px; font-size: 16px;">
      ${article.fcontent}
    </p>
    <div style="height: 20px;"></div>
    <c:if test="${empty currentUser}">
      <button disabled class="btn btn-sm btn-danger btn-collect">
        <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
        &nbsp;收藏
      </button>
    </c:if>
      <c:set var="flag" value="false"/>
      <c:forEach items="${collectList}" var="collect">
        <c:if test="${collect == article.fid}">
          <c:set var="flag" value="true" />
        </c:if>
      </c:forEach>
      <c:if test="${!flag}">
        <button id="add-collect" onclick="addCollect(${currentUser.userid}, ${article.fid})" class="btn btn-sm btn-danger btn-collect">
          <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
          &nbsp;收藏
        </button>
      </c:if>
      <c:if test="${flag}">
        <button id="delete-collect" onclick="deleteCollect(${currentUser.userid}, ${article.fid})" class="btn btn-sm btn-success btn-collect">
          <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
          &nbsp;取消收藏
        </button>
      </c:if>
  </div>
  <div class="comment-container">
    <form id="${article.fid}">
      <input type="hidden" value="${article.fid}" name="fid" id="fid">
      <c:if test="${!empty currentUser}">
        <input type="hidden" value="${currentUser.userid}" name="userid">
      </c:if>
      <textarea name="pcontent" placeholder="写下你的评论..."></textarea>
      <div style="height: 30px;"></div>
      <c:if test="${empty currentUser}">
        <input disabled type="button" class="btn btn-block" value="登录后发表评论">
      </c:if>
      <c:if test="${!empty currentUser}">
        <input id="add-comment" type="button" class="btn btn-primary btn-block" value="发表">
      </c:if>
    </form>
  </div>

  <c:forEach items="${commentList}" var="comment">
    <c:if test="${commentList.size() > 0}">
      <div class="comment-item">
        <div>
          <img class="user-pic" src="${IMG_PATH.concat(comment.photo)}" alt="avatar">
          <span style="margin: 0 5px;"></span>
          <a href="${APP_PATH.concat("/user/user-info.do?id=").concat(comment.userid)}"><strong>${comment.username}</strong></a>
          <span style="margin: 0 2px"></span>
          <small>${comment.time}</small>
        </div>
        <p style="line-height: 30px; font-size: 16px;">${comment.pcontent}</p>
      </div>
    </c:if>
<%--    <c:if test="${commentList.size() <= 0}">--%>
<%--    </c:if>--%>
  </c:forEach>
</div>

<script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
<script src="${APP_PATH}/static/js/comment.js"></script>
<script src="${APP_PATH}/static/js/focus.js"></script>

</body>
</html>
