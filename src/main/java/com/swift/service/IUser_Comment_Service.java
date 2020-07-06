package com.swift.service;

import com.swift.bean.User_Comment;

import java.util.List;

public interface IUser_Comment_Service {
    //通过文章id获取这篇文章的评论信息，注意返回值
    public List<User_Comment> getCommentUserList(int fid);
}
