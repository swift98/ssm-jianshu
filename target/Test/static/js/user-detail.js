$(function () {
    var userid = $("#userid").val();
    var app_path = $("#app_path").val();

    $("#my-comment").click(function () {
        $.ajax({
            url: app_path + "/article/getMyCommentArticle.do?userid=" + userid,
            method: "get",
            dataType: "html",
            success: function (data) {
                $("#tab-content").html(data)
            },
            error: function () {
                console.log("error")
            }
        });
        if(!$("#my-comment").hasClass("active")) {
            $("#my-comment").addClass("active");
            $("#my-comment").siblings("li").removeClass("active");
        }
    });

    $("#my-article").click(function () {
        $.ajax({
            url: app_path + "/article/getMyArticle.do?userid=" + userid,
            method: "get",
            dataType: "html",
            success: function (data) {
                $("#tab-content").html(data)
            },
            error: function () {
                console.log("error")
            }
        });
        if(!$("#my-article").hasClass("active")) {
            $("#my-article").addClass("active");
            $("#my-article").siblings("li").removeClass("active");
        }
    });

    $("#my-focus").click(function () {
        $.ajax({
            url: app_path + "/user/myFocus.do?id=" + userid,
            method: "get",
            dataType: "html",
            success: function (data) {
                $("#tab-content").html(data)
            },
            error: function () {
                console.log("error")
            }
        });
        if(!$("#my-focus").hasClass("active")) {
            $("#my-focus").addClass("active");
            $("#my-focus").siblings("li").removeClass("active");
        }
    });

    $("#focus-me").click(function () {
        $.ajax({
            url: app_path + "/user/myFans.do?id=" + userid,
            method: "get",
            dataType: "html",
            success: function (data) {
                $("#tab-content").html(data)
            },
            error: function () {
                console.log("error")
            }
        });
        if(!$("#focus-me").hasClass("active")) {
            $("#focus-me").addClass("active");
            $("#focus-me").siblings("li").removeClass("active");
        }
    });

    $("#my-collect").click(function () {
        $.ajax({
            url: app_path + "/article/getMyCollect.do?userid=" + userid,
            method: "get",
            dataType: "html",
            success: function (data) {
                $("#tab-content").html(data)
            },
            error: function () {
                console.log("error")
            }
        });
        if(!$("#my-collect").hasClass("active")) {
            $("#my-collect").addClass("active");
            $("#my-collect").siblings("li").removeClass("active");
        }
    });

    $("#my-article").click();
});