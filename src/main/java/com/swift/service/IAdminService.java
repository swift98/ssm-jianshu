package com.swift.service;

import com.swift.bean.Admin;
import com.swift.bean.Article;
import com.swift.bean.Plate;
import com.swift.bean.User;
import com.swift.dao.IAdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class IAdminService {

    @Autowired
    IAdminDao adminMapper;

    /**
     * 管理员登录查询
     *
     * @param admin
     * @return
     */
    public List<Admin> getAdmin(Admin admin) {
        Admin adminss=new Admin();
        adminss.setAname("admin");
        adminss.setApassword("admin");
        List<Admin> ad=adminMapper.selectByAdmin(adminss);
        return adminMapper.selectByAdmin(admin);
    }

    /**
     * 管理员注册按姓名查询
     *
     * @param admin
     * @return
     */
    public List<Admin> getAdminName(Admin admin) {

        return adminMapper.selectByAdminName(admin);
    }

    /**
     * 管理员注册插入
     *
     * @param admin
     */
    public void setAdmin(Admin admin) {

        adminMapper.insert(admin);
    }

    public Map getArticleAdmin(Map<Object, Object> map,  int pageStart, int pageSize) {
        Map<Object, Object> map2 = new HashMap<Object, Object>();
        int tail = 1;
        int begin=(pageStart-1)*pageSize;
        List<Article> listArticle = adminMapper.getArticles(begin, pageSize);
        // 总贴数
        int total = adminMapper.totalArticle();
        map.put("article_total",total);
        map2.put("article_total",total);
        map.put("article_pageStart", pageStart);
        map2.put("article_pageStart", pageStart);
        map.put("article_pageSize", pageSize);
        map2.put("article_pageSize", pageSize);
        map.put("listArticle", listArticle);
        map2.put("listArticle", listArticle);
        if (total % pageSize == 0){
            tail = total / pageSize;
            map.put("article_tail",tail);
            map2.put("article_tail",tail);
        } else {
            tail = (total / pageSize) +1;
            map.put("article_tail",tail);
            map2.put("article_tail",tail);
        }
        return map2;
    }

    //分页获取文章
    public List<Article> getArticles(int start, int pagesize){
        int begin=(start-1)*pagesize;
        return adminMapper.getArticles(begin,pagesize);
    }

    //获取所有文章数目
    public int totalArticle(){
        return adminMapper.totalArticle();
    }

    //获取所有版块
    public Map getPlate(Map<Object, Object> map) {
        Map<Object, Object> map2 = new HashMap<Object, Object>();
        List<Plate> plate=adminMapper.getPlate();
        // 总板块数
        int total = adminMapper.totalPlate();
        map.put("plate", plate);
        map2.put("plate", plate);
        map.put("plate_total", total);
        map2.put("plate_total", total);

        return map2;
    }

    public int totalUser(){
        return adminMapper.totalUser();
    }


    //查询 用户信息，分页
    public Map getUser(Map<Object, Object> map,  int pageStart, int pageSize) {
        Map<Object, Object> map2 = new HashMap<Object, Object>();
        int tail = 1;
        int begin=(pageStart-1)*pageSize;
        List<User> listUser = adminMapper.getUser(begin, pageSize);
        for (User user : listUser){

            //注意这里强制转化了类型
            /*
            if ((Integer)user.getAge() == null){
                user.setAge(0);
            }
            */
            if (user.getSex() == null){
                user.setSex("");
            }
            if (user.getFamily() == null){
                user.setFamily("");
            }
            if (user.getIntro() == null){
                user.setIntro("");
            }
        }

        // 用户总数
        int total = adminMapper.totalUser();
        map.put("total",total);
        map2.put("total",total);
        map.put("pageStart", pageStart);
        map2.put("pageStart", pageStart);
        map.put("pageSize", pageSize);
        map2.put("pageSize", pageSize);
        map.put("listUser", listUser);
        map2.put("listUser", listUser);
        if (total % pageSize == 0){
            tail = total / pageSize;
            map.put("tail",tail);
            map2.put("tail",tail);
        } else {
            tail = (total / pageSize) +1;
            map.put("tail",tail);
            map2.put("tail",tail);
        }
        return map2;
    }

    public List<User> getUserByPage(int pageStart, int pageSize){
        int begin=(pageStart-1)*pageSize;
       return adminMapper.getUser(begin,pageSize);
    }
    public void updateArticleStatus(Article article){
        adminMapper.updateArticleStatus(article);
    }


    //从数据库中删除用户数据
    public void deleteUser(User user){
        adminMapper.delUser(user.getUserid());
    }

    //从数据库中按照用户id删除用户品论
    public void deleteCommentUserid(int userid){
        adminMapper.delCommentByUid(userid);
    }
    //从数据库中删除用户文章
    public void deleteArticleUserid(int userid){
        adminMapper.deleteArticleUserid(userid);
    }

    //删除用户关注
    public void deleteAttentionUseridOrBeuserid(int userid) {
        adminMapper.deleteAttentionUseridOrBeuserid(userid);
    }

    //删除用户收藏
    public void deleteCollectUserid(int userid){
        adminMapper.deleteCollectUserid(userid);
    }
}

