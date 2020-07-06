package com.swift.dao;

import com.swift.bean.Admin;
import com.swift.bean.Article;
import com.swift.bean.Plate;
import com.swift.bean.User;

import java.util.List;

public interface IAdminDao {

    int deleteByPrimaryKey(Integer aid);

    //管理员注册按姓名查询
    int insert(Admin record);

    int insertSelective(Admin record);

    //管理员登录查询
    List<Admin> selectByAdmin(Admin admin);

    //管理员注册按姓名查询
    List<Admin> selectByAdminName(Admin admin);

    Admin selectByPrimaryKey(Integer aid);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    //管理员获得帖子
    List<Article> getArticles(int start, int pagesize);

    //获得所有文章数目
    int totalArticle();
    //查询所有版块信息
    List<Plate> getPlate();
    int totalPlate();

    //获取所有用户
    List<User> getUser(int pagestart, int size);

    int totalUser();

    //审核文章
    void updateArticleStatus(Article article);

    //删除用户
    void delUser(int userid);

    //删除用户对应的评论
    void delCommentByUid(int userid);

    //删除用户文章
    void deleteArticleUserid(int userid);

    //删除用户attention
    void deleteAttentionUseridOrBeuserid(int userid);

    //删除用户收藏
    void deleteCollectUserid(int userid);

}
