$(function () {
    var page = $("#pageNum").val();
    var app_path = $("#app_path").val();
    $("#loadMore").click(function () {
        var pageNum = $("#pageNum");
        if(pageNum[0] != undefined) {
            var currentPage = parseInt(pageNum.val());
            pageNum.remove();
            // console.log(currentPage+1);
            getArticle(currentPage+1);
        }
        else $("#loadMore").removeClass("btn-info").addClass("btn-primary").html("已加载全部");
    });
    function getArticle(page) {
        console.log(app_path);
        $.ajax({
            url: app_path + "/article/getArticles.do?page="+page,
            method: "get",
            dataType: "html",
            success: function (data) {
                $("#articleItem").append(data);
            },
            error: function () {
                alert("加载文章出错！")
            }
        })
    }
    if(page == undefined) {
        // console.log("undefined");
        getArticle(1);
    }
});