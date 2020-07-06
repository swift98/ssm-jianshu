package com.swift.dao;

import com.swift.bean.Article;

import java.util.List;

public interface IArticleDao {
    //获取所有的文章，在service层使用了分页
    public List<Article> getArticles();
    //通过文章id获取文章内容
    public Article getArticle(int id);
    //获取某个用户的所有文章，也使用了分页
    public List<Article> getMyArticle(int userid);
    //根据用户id获取这个用户评论过的文章
    public List<Article> getMyCommentArticle(int userid);
    //根据用户id获取这个用户收藏的文章
    public List<Article> getMyCollect(int userid);
    //通过板块名获取该板块下的所有文章,没有分页
    public List<Article> getPlateArticle(String bname);
    //新增文章
    public void addArticle(String titles, String fcontent, String photo, String bname, int userid, String username,int status);
    //更新文章
    public void updateArticle(int fid, String titles, String fcontent, String photo, String bname, int userid, String username);
    //删除文章
    public void deleteArticle(int fid);
    public List<Article> getArticleByTitle(String title);
}
