<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2019/7/5
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
<%--<jsp:include page="/jsp/head/head.jsp"></jsp:include>--%>
<a href="${APP_PATH}">
  <img class="logo-pic" src="${APP_PATH}/static/images/icons/logo.png" alt="logo">
</a>
<input type="hidden" id="app_path" value="${APP_PATH}">
<div class="top-50 write-frame detail-center bottom-100">
  <form onsubmit="return check()" id="add-article" action="${APP_PATH}/article/updateArticle.do" enctype="multipart/form-data" method="post">
    <input type="text" name="titles" class="form-control" placeholder="文章标题" value="${article.titles}">
    <div style="height: 30px;"></div>
    <input type="hidden" name="userid" value="${currentUser.userid}">
    <input type="hidden" name="username" value="${currentUser.name}">
    <input type="hidden" name="fid" value="${article.fid}">
    <input type="hidden" name="old_bname" value="${article.bname}">
    <input type="hidden" name="oldName" value="${article.photo}">
    <select name="bname" class="form-control">
      <c:forEach items="${plateList}" var="item">
        <option>${item.bname}</option>
      </c:forEach>
    </select>
    <div style="height: 30px;"></div>
    <textarea name="fcontent" class="write-textarea" placeholder="文章内容">${article.fcontent}</textarea>
    <div style="height: 30px;"></div>
    <input name="imgUrl" id="choose-img" accept="image/*" type="file" style="display: none">
    <span class="label label-danger pull-right">文章配图不能为空</span>
    <img id="img-choose" class="img-thumbnail" src="${APP_PATH.concat("/static/images/article/").concat(article.photo)}" alt="">
    <div style="height: 30px;"></div>
    <div style="text-align: center">
      <input class="btn btn-warning" type="reset" value="清空">
      <span style="margin: 0 20px;"></span>
      <input class="btn btn-success" type="submit" value="更新">
    </div>
  </form>
</div>

<script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
<script src="${APP_PATH}/static/js/write.js"></script>
<script>
    $(function() {
        $("body").css("backgroundColor", "#f0f0f0");
        $("select[name='bname']").val($("input[name='old_bname']").val());
    });

    function check() {
        if($("input[name='titles']").val().length <= 0) {
            alert("文章标题不能为空");
            return false;
        } else if($("textarea[name='fcontent']").val().length <= 0) {
            alert("文章内容不能为空");
            return false;
        } else if($("textarea[name='fcontent']").val().length > 2000) {
            alert("文章长度超出限制");
            return false;
        } else return true;
    }
</script>

</body>
</html>