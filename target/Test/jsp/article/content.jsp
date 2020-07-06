<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2019/7/4
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%pageContext.setAttribute("APP_PATH", request.getContextPath());%>
<input type="hidden" value="${APP_PATH}" id="app_path">
<div class="nav-center top-80">
  <div class="col-xs-8">
    <div>
      <img class="banner" src="${APP_PATH}/static/images/carousel/1.jpg" alt="banner">
    </div>
    <div class="top-30 wid-100" id="articleItem"></div>
    <button id="loadMore" class="btn btn-block btn-info">加载更多</button>
    <div style="height: 50px; width: 100%;"></div>
  </div>
  <div class="col-xs-4 pull-right">
    <h4 class="text-center">所有板块</h4>
    <div class="row top-20">
      <div class="col-xs-4 col-md-4 text-center">
        <a href="${APP_PATH}/article/plate.do?bid=1"><img class="center-block catalog-pic" src="${APP_PATH}/static/images/icons/java.png" alt="">
        <p class="text-danger top-5">java</p></a>
      </div>
      <div class="col-xs-4 col-md-4 text-center">
        <a href="${APP_PATH}/article/plate.do?bid=2"><img class="center-block catalog-pic" src="${APP_PATH}/static/images/icons/c++.png" alt="">
        <p class="text-danger top-5">c++</p></a>
      </div>
      <div class="col-xs-4 col-md-4 text-center">
        <a href="${APP_PATH}/article/plate.do?bid=19"><img class="center-block catalog-pic" src="${APP_PATH}/static/images/icons/ai.png" alt="">
        <p class="text-danger top-5">人工智能</p></a>
      </div>
    </div>
    <div class="row top-20">
      <div class="col-xs-4 col-md-4 text-center">
        <a href="${APP_PATH}/article/plate.do?bid=26"><img class="center-block catalog-pic" src="${APP_PATH}/static/images/icons/github.png" alt="">
          <p class="text-danger top-5">github</p></a>
      </div>
      <div class="col-xs-4 col-md-4 text-center">
        <a href="${APP_PATH}/article/plate.do?bid=22"><img class="center-block catalog-pic" src="${APP_PATH}/static/images/icons/html.png" alt="">
          <p class="text-danger top-5">前端</p></a>
      </div>
      <div class="col-xs-4 col-md-4 text-center">
        <a href="${APP_PATH}/article/plate.do?bid=3"><img class="center-block catalog-pic" src="${APP_PATH}/static/images/icons/python.png" alt="">
          <p class="text-danger top-5">Python</p></a>
      </div>
    </div>
    <div class="row top-20">
      <div class="col-xs-4 col-md-4 text-center">
        <a href="${APP_PATH}/article/plate.do?bid=21"><img class="center-block catalog-pic" src="${APP_PATH}/static/images/icons/life.png" alt="">
          <p class="text-danger top-5">程序人生</p></a>
      </div>
      <div class="col-xs-4 col-md-4 text-center">
        <a href="${APP_PATH}/article/plate.do?bid=20"><img class="center-block catalog-pic" src="${APP_PATH}/static/images/icons/mobile.png" alt="">
          <p class="text-danger top-5">移动开发</p></a>
      </div>
      <div class="col-xs-4 col-md-4 text-center">
        <a href="${APP_PATH}/article/plate.do?bid=23"><img class="center-block catalog-pic" src="${APP_PATH}/static/images/icons/protect.png" alt="">
          <p class="text-danger top-5">运维</p></a>
      </div>
    </div>
    <div class="row top-20">
      <div class="col-xs-4 col-md-4 text-center">
        <a href="${APP_PATH}/article/plate.do?bid=24"><img class="center-block catalog-pic" src="${APP_PATH}/static/images/icons/jiagou.png" alt="">
          <p class="text-danger top-5">架构</p></a>
      </div>
    </div>
  </div>
</div>
