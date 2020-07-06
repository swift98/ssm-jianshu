package com.swift.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.swift.bean.Admin;
import com.swift.bean.Article;
import com.swift.bean.User;
import com.swift.service.IAdminService;
import com.swift.service.impl.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("adminController")
@SessionAttributes(value="adminList")
public class AdminController {

    @Autowired
    IAdminService adminService;
   // @Autowired
    //PlateController plateController;
    @Autowired
    UserController userController;
    @Autowired
    ArticleController articleController;
    @Autowired
    ArticleService articleService;


    List<Admin> list=new ArrayList<Admin>();

    /**
     * 管理员登录判断
     * @param admin
     * @param map
     * @return
     */
    @RequestMapping("getLogin.do")
    public String getLogin(Admin admin, Map<Object, Object> map) {

        //调用管理员查询方法
        list=adminService.getAdmin(admin);
        String str=list.toString();

        if (!str.equals("[]")) {
            map.put("adminList", list.get(0));
            return "redirect:/admin/all.jsp";//重定向
        } else {

            return "redirect:/admin/index.jsp";//重定向
        }
    }


    /**
     * 退出管理员登录
     *
     * @param map
     * @return
     */
    @RequestMapping("/adminExit")
    public String adminExit(Map<Object, Object> map) {

        map.put("adminList", "");
        return "redirect:/admin/index.jsp";// 重定向
    }

    /**
     * 查询用户信息（分页）
     * @param map
     * @param pageStart
     * @param pageSize
     */
    @RequestMapping(value="/getUser.do", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String  getUser(Map<Object, Object> map, @RequestParam(required=true,defaultValue="1") int pageStart, @RequestParam(required=true,defaultValue="10")int pageSize) {
        Map<Object, Object> map2 = new HashMap<Object, Object>();
        adminService.getUser(map2,pageStart,pageSize);

        ObjectMapper mapper=new ObjectMapper();
        String str="";
        try {
            str = mapper.writeValueAsString(map2);
        }catch (Exception e){
            System.out.println(e.getMessage());

        }
        return str;
    }



    @RequestMapping("/getArticle.do")
    @ResponseBody
    public Map getArticle(Map<Object, Object> map, @RequestParam(required=true,defaultValue="1") int pageStart, @RequestParam(required=true,defaultValue="10")int pageSize) {
        Map<Object, Object> map2 = new HashMap<Object, Object>();

        //获取文章
        List<Article> listArticle = adminService.getArticles(pageStart, pageSize);
        map.put("listArticle", listArticle);
        map.put("pageStart", pageStart);
        map2.put("pageStart", pageStart);
        return map2;
    }

    /**
     * 查询发帖表信息（管理-分页）
     * @param map
     * @param pageStart
     * @param pageSize
     * @return
     * my notes----
     * 为方便，直接写在这里，而不是articleController里
     */
    @RequestMapping(value="/getArticleManagement.do",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String getArticleAdmin(Map<Object, Object> map, @RequestParam(required=true,defaultValue="1") int pageStart, @RequestParam(required=true,defaultValue="10")int pageSize) {
        Map<Object, Object> map2 = new HashMap<Object, Object>();
        int tail = 1;
       //List<Article> listArticle = articleService.getArticleAdmin(pageStart, pageSize);

        List<Article> listArticle=adminService.getArticles(pageStart,pageSize);
        // 总贴数
        int total = adminService.totalArticle();
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
        //return map2;

        ObjectMapper mapper=new ObjectMapper();
        String str="";
        try {
            str = mapper.writeValueAsString(map);
        }catch (Exception e){
            System.out.println(e.getMessage());

        }
        return str;
    }

    /**
     * 查询输出-管理员-首页分页信息（不包含head）
     * @return
     */
    @RequestMapping(value="getAll_Admin.do", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String   getAll_Admin() {
        Map<Object, Object> map = new HashMap<Object, Object>();

        // 查询板块信息（无条件）
        adminService.getPlate(map);
        // 查询用户信息（分页）
        adminService.getUser(map,1,10);
        // 查询帖子信息（分页）
        adminService.getArticleAdmin(map, 1, 10);

        ObjectMapper mapper=new ObjectMapper();
        String str="";
        try {
            str = mapper.writeValueAsString(map);
        }catch (Exception e){
            System.out.println(e.getMessage());

        }
        return str;

    }

    //审核文章
    @RequestMapping(value="/articleStatusByfid.do", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String  articleStatus(int fid,int status) {
        Article article=new Article();
        article.setStatus(status);
        article.setFid(fid);
        System.out.println("审核帖子(修改：");
        System.out.println(article.getFid()+"设置状态:"+article.getStatus());
        Map<Object,Object> map = new HashMap<Object,Object>();
        try {
            adminService.updateArticleStatus(article);
            map.put("resultCode",200);
        } catch (Exception e){
            map.put("resultCode",404);
            System.out.println("修改帖子状态时出现异常！！！");
        }


        ObjectMapper mapper=new ObjectMapper();
        String str="";
        try {
            str = mapper.writeValueAsString(map);
        }catch (Exception e){
            System.out.println(e.getMessage());

        }
        return str;
    }

    //删除用户
    @RequestMapping(value="/deleteUser.do",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String  deleteUser(int userid, Map<Object, Object> map, HttpSession session, HttpServletRequest request) throws IOException {
        Map<Object, Object> map2 = new HashMap<Object, Object>();
        try {
            String projectname;	//项目名称
            projectname = request.getSession().getServletContext().getRealPath("/");
            projectname=projectname.substring(0,projectname.length()-1);
            if (projectname.indexOf("/")==-1) {//在非linux系统下
                projectname = projectname.substring(projectname.lastIndexOf("\\"),projectname.length());
            } else {//在linux系统下
                projectname = projectname.substring(projectname.lastIndexOf("/"),projectname.length());
            }

            //取消删除图片
            //文件（图片）路径
           // String filePath = PathUtil.getCommonPath()+projectname+PathUtil.getUserPath();

            //构造user
            User user = new User();
            user.setUserid(userid);

            //删除用户信息（不包含头像）
            adminService.deleteUser(user);

            /*
            //对应的有头像的用户才进行以下操作
            if(viaService.getVia(userid)!=null) {

                // 获取取要删除用户对应的头像的文件名（通过userid获取头像信息）
                String fileName = viaService.getVia(userid).getPhoto();
                System.out.println("文件名："+fileName);
                // 封装上传文件位置的全路径
                File targetFile = new File(filePath, fileName);
                System.out.println("拼接全文件名："+targetFile);

                //删除用户对应的头像（实际删除）
                targetFile.delete();

                //删除用户对应的头像信息(数据库)
                viaService.deleteVia(userid);
            }

            */

            //删除该用户对应的所有评论信息(按userid)
            adminService.deleteCommentUserid(userid);

            //直接获取用户id
            List<Article> listArticle=articleService.getMyArticles(userid,1,1000);
            //对应的有发过帖子的用户才进行以下操作
            if(listArticle.toString()!="[]") {
                //去掉删除文章图片的部分
                /*
                for(int i=0; i<listArticle.size();i++) {

                    int fid=listArticle.get(i).getFid();
                    articleController.articlePhotoDelete(fid,request);
                }
                */
                //删除用户对应的帖子信息(数据库)
                adminService.deleteArticleUserid(userid);
            }

            //删除该用户对应的关注和被关注信息
            adminService.deleteAttentionUseridOrBeuserid(userid);

            //删除该用户对应的收藏信息(按userid)
            adminService.deleteCollectUserid(userid);

            //如果删除的是当前登录用户，则清空对应的session
            if(session.getAttribute("userid")!=null && session.getAttribute("userid").equals(userid)) {
                map.put("userid", "");
                map.put("username", "");
            }
            map2.put("resultCode",200);
        }catch (Exception e){
            map2.put("resultCode",404);
        }

        ObjectMapper mapper=new ObjectMapper();
        String str="";
        try {
            str = mapper.writeValueAsString(map2);
        }catch (Exception e){
            System.out.println(e.getMessage());

        }
        return str;
    }
}
