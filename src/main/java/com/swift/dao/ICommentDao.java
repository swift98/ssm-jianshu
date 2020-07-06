package com.swift.dao;

import com.swift.bean.Comment;

public interface ICommentDao {
    //新增评论
    public void addComment(Comment comment);
    //删除文章后要删除该文章的评论
    public void deleteCommentBiFid(int fid);
}
