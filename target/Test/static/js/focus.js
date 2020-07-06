var app_path = $("#app_path").val();

function addFocus(userid, beuserid) {
    $.ajax({
        method: 'get',
        url: app_path + '/user/addFocus.do?userid='+userid+'&beuserid='+beuserid,
        dataType: 'json',
        success: function (data) {
            if(data == 200) {
                // location.reload();
                var btn = $("#add-focus");
                btn.off('click');
                btn.removeClass('btn-info');
                btn.bind('click', function () {
                    deleteFocus(userid, beuserid);
                });
                btn.addClass('btn-primary');
                btn.html("取消关注");
                btn.attr('id', 'delete-focus')
            }
            else {
                alert("关注失败");
            }
        },
        error: function (error) {
            alert("出错");
            console.log(error)
        }
    })
}

function deleteFocus(userid, beuserid) {
    $.ajax({
        method: 'get',
        url: app_path + '/user/deleteFocus.do?userid='+userid+'&beuserid='+beuserid,
        dataType: 'json',
        success: function (data) {
            if(data == 200) {
                // location.reload();
                var btn = $("#delete-focus");
                btn.off('click');
                btn.removeClass('btn-primary');
                btn.bind('click', function () {
                    addFocus(userid, beuserid);
                });
                btn.addClass('btn-info');
                btn.html("关注");
                btn.attr('id', 'add-focus')
            }
            else {
                alert("取消关注失败");
            }
        },
        error: function (error) {
            alert("出错");
            console.log(error)
        }
    })
}

function addCollect(userid, fid) {
    $.ajax({
        method: 'get',
        url: app_path + '/user/addCollect.do?userid='+userid+'&fid='+fid,
        dataType: 'json',
        success: function (data) {
            if(data == 200) {
                // location.reload();
                var btn = $("#add-collect");
                btn.off('click');
                btn.removeClass('btn-danger');
                btn.bind('click', function () {
                    deleteCollect(userid, fid);
                });
                btn.addClass('btn-success');
                btn.html("取消收藏");
                btn.attr('id', 'delete-collect')
            }
            else {
                alert("收藏失败");
            }
        },
        error: function (error) {
            alert("出错");
            console.log(error)
        }
    })
}

function deleteCollect(userid, fid) {
    $.ajax({
        method: 'get',
        url: app_path + '/user/deleteCollect.do?userid='+userid+'&fid='+fid,
        dataType: 'json',
        success: function (data) {
            if(data == 200) {
                // location.reload();
                var btn = $("#delete-collect");
                btn.off('click');
                btn.removeClass('btn-success');
                btn.bind('click', function () {
                    addCollect(userid, fid);
                });
                btn.addClass('btn-danger');
                btn.html("收藏");
                btn.attr('id', 'add-collect')
            }
            else {
                alert("取消收藏失败");
            }
        },
        error: function (error) {
            alert("出错");
            console.log(error)
        }
    })
}