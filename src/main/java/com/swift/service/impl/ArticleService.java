package com.swift.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.swift.bean.Article;
import com.swift.dao.IArticleDao;
import com.swift.service.IArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleService implements IArticleService {
    @Autowired
    private IArticleDao articleDao;

    //获取所有的文章，使用了分页
    @Override
    public List<Article> getArticles(int page, int size) {
        PageHelper.startPage(page, size);
        return articleDao.getArticles();
    }

    //通过文章id获取某篇文章的内容
    @Override
    public Article getArticle(int id) {
        return articleDao.getArticle(id);
    }

    //通过用户id获取该用户的所有文章
    @Override
    public List<Article> getMyArticles(int userid, int page, int size) {
        PageHelper.startPage(page, size);
        return articleDao.getMyArticle(userid);
    }

    //根据用户id获取这个用户评论过的文章,用于用户信息界面
    @Override
    public List<Article> getMyCommentArticle(int userid, int page, int size) {
        PageHelper.startPage(page, size);
        return articleDao.getMyCommentArticle(userid);
    }

    //通过用户id获取该用户收藏的文章，用于用户信息界面
    @Override
    public List<Article> getMyCollect(int userid, int page, int size) {
        PageHelper.startPage(page, size);
        return articleDao.getMyCollect(userid);
    }

    //通过板块名获取该板块下的所有文章
    @Override
    public List<Article> getPlateArticle(String bname) {
        return articleDao.getPlateArticle(bname);
    }

    @Override
    public void addArticle(String titles, String fcontent, String photo, String bname, int userid, String username,int status) {
        articleDao.addArticle(titles, fcontent, photo, bname, userid, username,status);
    }

    @Override
    public void updateArticle(int fid, String titles, String fcontent, String photo, String bname, int userid, String username) {
        articleDao.updateArticle(fid, titles, fcontent, photo, bname, userid, username);
    }

    @Override
    public void deleteArticle(int fid) {
        articleDao.deleteArticle(fid);
    }

    //按照文章标题模糊搜索
    @Override
    public List<Article> getArticleByTitle(String title,int page,int size){
        PageHelper.startPage(page,size);
        return articleDao.getArticleByTitle(title);
    }
}
