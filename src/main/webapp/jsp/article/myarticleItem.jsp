<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2019/7/4
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%pageContext.setAttribute("APP_PATH", request.getContextPath());%>
<%pageContext.setAttribute("IMG_PATH", request.getContextPath().concat("/static/images/article/"));%>
<div>
  <c:if test="${pageInfo.list.size() > 0}">
    <c:if test="${pageInfo.pageNum < pageInfo.pages}">
      <input id="pageNum" type="hidden" value="${pageInfo.pageNum}">
    </c:if>
    <c:forEach var="article" items="${pageInfo.list}">
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
          <c:if test="${!empty currentUser && currentUser.userid == article.userid}">
            <span style="margin: 0 10px;"></span>
            <a href="${APP_PATH.concat("/article/editArticle.do?fid=").concat(article.fid)}">
              <small>
            <span class="glyphicon glyphicon-edit" aria-hidden="true">
                编辑
            </span>
              </small>
            </a>
            <span style="margin: 0 10px;"></span>
            <a href="${APP_PATH.concat("/article/deleteArticle.do?fid=").concat(article.fid).concat("&userid=").concat(article.userid)}">
              <small>
            <span class="glyphicon glyphicon-trash" aria-hidden="true">
                删除
            </span>
              </small>
            </a>
          </c:if>
          <span>
              <span style="margin: 0 10px;"></span>
              <c:if test="${article.status == 1}"><span class="label label-success">审核通过</span></c:if>
              <c:if test="${article.status == 0}"><span class="label label-warning">审核中。</span></c:if>
              <c:if test="${article.status == 2}"><span class="label label-success">审核不通过</span></c:if>
            </span>
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
  <c:if test="${pageInfo.list.size() <= 0 && pageInfo.pageNum < pageInfo.pages}">
    <input id="pageNum" type="hidden" value="1">
  </c:if>
</div>
