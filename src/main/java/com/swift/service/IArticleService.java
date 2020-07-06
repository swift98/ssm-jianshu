package com.swift.service;

import com.swift.bean.Article;

import java.util.List;

public interface IArticleService {
    //分页获取所有的文章，展示在首页
    public List<Article> getArticles(int page, int size);
    //根据文章id获取文章，用于文章详情页面
    public Article getArticle(int id);
    //根据用户id获取该用户的所有文章，用于用户信息界面
    public List<Article> getMyArticles(int userid, int page, int size);
    //根据用户id获取这个用户评论过的文章,用于用户信息界面
    public List<Article> getMyCommentArticle(int userid, int page, int size);
    //通过用户id获取该用户收藏的文章，用于用户信息界面
    public List<Article> getMyCollect(int userid, int page, int size);
    //通过板块id获取该板块下的所有文章
    public List<Article> getPlateArticle(String bname);
    //新增文章
    public void addArticle(String titles, String fcontent, String photo, String bname, int userid, String username,int status);
    //更新文章
    public void updateArticle(int fid, String titles, String fcontent, String photo, String bname, int userid, String username);
    //删除文章
    public void deleteArticle(int fid);
    //按文章标题模糊搜索
    public List<Article> getArticleByTitle(String title,int page, int size);
}
