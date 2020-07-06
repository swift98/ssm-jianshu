function loadMorePlate() {
    var page = $("#pageNum").val();
    var app_path = $("#app_path").val();
    var bid = $("#bid").val();
    var nextPage = parseInt(page) + 1;
    $('#pageNum').remove();
    $.ajax({
        method: 'get',
        url: app_path + '/article/morePlate.do?bid='+bid+'&page='+nextPage,
        dataType: 'html',
        success: function (data) {
            $("#plateItem").append(data)
        },
        error: function () {
            alert('加载失败')
        }
    })
}