package com.swift.controller;

import com.swift.bean.Comment;
import com.swift.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private ICommentService commentService;

    @RequestMapping("/addComment.do")
    public String addComment(Comment comment) {
        commentService.addComment(comment);
        return "redirect:/article/detail.do?id=" + comment.getFid();
    }
}
