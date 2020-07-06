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
<%pageContext.setAttribute("IMG_PATH", request.getContextPath().concat("/static/images/user/"));%>
<div>
  <input type="hidden" id="app_path" value="${APP_PATH}">
  <c:forEach var="user" items="${userList}">
    <div class="author-info clearfix">
      <div class="pull-left wid-10">
        <a href="${APP_PATH.concat("/user/user-info.do?id=").concat(user.userid)}">
          <img class="user-pic" src="${IMG_PATH.concat(user.photo)}" alt="avatar">
        </a>
      </div>
      <div class="pull-right wid-90">
        <div>
          <a href="${APP_PATH.concat("/user/user-info.do?id=").concat(user.userid)}"><strong>${user.name}</strong></a>
        </div>
        <div style="height: 10px;"></div>
        <div>
          <small>${user.intro}</small>
        </div>
        <button id="delete-focus" onclick="deleteFocus(${currentUser.userid},${user.userid})" class="btn btn-primary btn-guanzhu"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;取消关注</button>
      </div>
      <div style="height: 20px;"></div>
  </c:forEach>
</div>

<script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
<script>
    function deleteFocus(userid, beuserid) {
        var app_path = $("#app_path").val();
        $.ajax({
            method: 'get',
            url: app_path + '/user/deleteFocus.do?userid=' + userid + '&beuserid=' + beuserid,
            dataType: 'json',
            success: function (data) {
                if (data == 200) {
                    location.reload();
                    // var btn = $("#delete-focus");
                    // btn.off('click');
                    // btn.removeClass('btn-primary');
                    // btn.bind('click', function () {
                    //     addFocus(userid, beuserid);
                    // });
                    // btn.addClass('btn-info');
                    // btn.html("关注");
                    // btn.attr('id', 'add-focus')
                } else {
                    alert("取消关注失败");
                }
            },
            error: function (error) {
                alert("出错");
                console.log(error)
            }
        })
    }
</script>