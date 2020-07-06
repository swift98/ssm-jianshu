package com.swift.dao;

import com.swift.bean.User_Comment;

import java.util.List;

public interface IUser_Comment_Dao {
    //通过文章id获取这篇文章的所有评论，返回值是一个复合类型的bean
    public List<User_Comment> getCommentUserList(int fid);
}
