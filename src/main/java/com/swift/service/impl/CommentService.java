package com.swift.service.impl;

import com.swift.bean.Comment;
import com.swift.dao.ICommentDao;
import com.swift.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService implements ICommentService {

    @Autowired
    private ICommentDao commentDao;

    @Override
    public void addComment(Comment comment) {
        commentDao.addComment(comment);
    }

    @Override
    public void deleteCommentBiFid(int fid) {
        commentDao.deleteCommentBiFid(fid);
    }
}
