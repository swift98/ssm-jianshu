<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2019/7/4
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%pageContext.setAttribute("APP_PATH", request.getContextPath());%>
<script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/js/search.js"></script>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="nav-center">
    <div class="container-fluid">
      <div class="pull-left">
        <div class="navbar-header">
          <a class="navbar-brand" href="${APP_PATH}">
            <img
                    src="${APP_PATH}/static/images/icons/jianshu-logo.png"
                    alt="logo"
                    style="height: 40px; margin-top: -10px; float: left;"
            />
          </a>
        </div>
        <div class="pull-left">
          <form class="navbar-form navbar-left"  action="javascript:void(0)" role="search">
            <div class="form-group">
              <input type="text" id="searchArticle" class="form-control" placeholder="Search">
            </div>
            <span style="margin: 0 10px;"></span>
            <button type="submit" onclick="searchArt()" class="btn btn-info">搜索</button>
          </form>
        </div>
      </div>
      <div class="pull-right">
        <c:if test="${empty currentUser}">
          <ul class="nav navbar-nav">
            <li><a id="login" href="${APP_PATH}/user/toLogin.do">登录</a></li>
            <li><a id="register" href="${APP_PATH}/user/toRegister.do">注册</a></li>
          </ul>
        </c:if>
        <c:if test="${!empty currentUser}">
          <div style="display: inline-block;" class="dropdown">
            <img src="${APP_PATH.concat("/static/images/user/").concat(currentUser.photo)}" class="dropdown-toggle user-pic" id="dropdownMenu1" data-toggle="dropdown">
              <span class="caret"></span>
            </img>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
              <li role="presentation">
                <a role="menuitem" tabindex="-1" href="${APP_PATH.concat("/user/user-info.do?id=").concat(currentUser.userid)}">
                  <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                  &nbsp;&nbsp;个人中心
                </a>
              </li>
              <li role="presentation">
                <a role="menuitem" tabindex="-1" href="${APP_PATH.concat("/user/toEdit.do?userid=").concat(currentUser.userid)}">
                  <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                  &nbsp;&nbsp;个人设置
                </a>
              </li>
              <li role="presentation" onclick="exit()">
                <a role="menuitem" tabindex="-1" href="#">
                  <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                  &nbsp;&nbsp;退出
                </a>
              </li>
            </ul>
          </div>
        </c:if>
        <span style="margin: 0 25px;"></span>
        <c:if test="${empty currentUser}">
          <a class="btn btn-warning navbar-btn" href="${APP_PATH}/user/toLogin.do">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
            写文章
          </a>
        </c:if>
      <c:if test="${!empty currentUser}">
        <a class="btn btn-warning navbar-btn" href="${APP_PATH}/article/toNewArticle.do">
          <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
          写文章
        </a>
      </c:if>
      </div>
    </div>
  </div>
</nav>

<script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
<script>
  function exit() {
      var app_path = $("#app_path").val();
      $.ajax({
          method: 'get',
          url: app_path+'/user/exit.do',
          success: function () {
              alert("退出成功");
              window.location.href = '/jianshu_blog_v3_war/index.jsp'
          },
          error: function () {
              alert("退出失败")
          }
      })
  }
</script>