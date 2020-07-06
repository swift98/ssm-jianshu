package com.swift.service.impl;

import com.swift.bean.User_Comment;
import com.swift.dao.IUser_Comment_Dao;
import com.swift.service.IUser_Comment_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class User_Comment_Service implements IUser_Comment_Service {

    @Autowired
    private IUser_Comment_Dao user_comment_dao;

    //通过文章id获取这篇文章的所有评论信息
    @Override
    public List<User_Comment> getCommentUserList(int fid) {
        return user_comment_dao.getCommentUserList(fid);
    }
}
