/**
 * 首页按照文章标题搜索文章函数
  */
function searchArt (){
    //搜索函数开始
    //必须要使用val()获取value值，否则会出错
    var app_path = $("#app_path").val();
    var title=$("#searchArticle").val();
    var titletest=document.getElementById("searchArticle").value;
    //提示搜索内容
    //alert("you search for "+title);

    $.ajax({
        url: app_path+"/article/searchByTitle.do" ,//url
        type: "post",//方法类
        data:{"title":title},
        dataType: "html",               //返回类型
        success: function (data) {
           // $("#articleItem").append(data);
            $("#articleItem").html(data);       //重新设置文章item的值
        },
        error: function () {
            alert("搜索文章出错！");
        }
    })

}
