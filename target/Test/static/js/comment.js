$(function () {
    var app_path = $("#app_path").val();
    var fid = $("#fid").val();
    $("#add-comment").click(function () {
        $.ajax({
            method: 'post',
            url: app_path + '/comment/addComment.do',
            data: $("#"+fid).serialize(),
            success: function () {
                location.reload();
            },
            error: function () {
                alert("评论失败")
            }
        })
    });
});