$(function () {
    var app_path = $("#app_path");
    $("#img-choose").click(function () {
        $("#choose-img").click();
    });
    $("#choose-img").change(function () {
        var file = this.files[0];
        if (window.FileReader) {
            var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onloadend = function(e) {
                $("#img-choose").attr("src", e.target.result); //e.target.result就是最后的路径地址
            };
        }
    });

    $("#article-submit").click(function () {
        console.log("fuck");
        addArticle();
    });

    // $("#add-article").onsubmit = function () {
    //     alert('check');
    //     if($("input[name='titles']").val().length <= 0) {
    //         alert("文章标题不能为空");
    //         return false;
    //     }
    //     if($("input[name='fcontent']").val().length <= 0) {
    //         alert("文章内容不能为空");
    //         return false;
    //     }
    //     if($("input[name='fcontent']").val().length > 2000) {
    //         alert("文章长度超出限制");
    //         return false;
    //     }
    //     if(!$("input[name='imgUrl']").get(0).files[0]) {
    //         alert("文章配图不能为空");
    //         return false;
    //     }
    //     return true;
    // };

    function addArticle() {
        var formData = new FormData($("#addArticle-form")[0]);
        $.ajax({
            url: app_path+"/article/addArticle.do",
            method: "post",
            data: formData,
            success: function () {
                
            },
            error: function () {
                
            }
        })
    }
});