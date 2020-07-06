package com.swift.controller;

import com.github.pagehelper.PageInfo;
import com.swift.bean.*;
import com.swift.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import word_filter.WordDetect;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private IArticleService articleService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IUser_Comment_Service user_comment_service;
    @Autowired
    private IPlateService plateService;
    @Autowired
    private ICommentService commentService;
    @Autowired
    private ICollectService collectService;

    @RequestMapping("/getArticles.do")
    @ResponseBody
    public ModelAndView getArticles(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "5") int size) {
        List<Article> list = articleService.getArticles(page, size);
        PageInfo pageInfo = new PageInfo(list);
        ModelAndView mv = new ModelAndView("/article/listItem");
        mv.addObject("pageInfo", pageInfo);
        return mv;
    }

    @RequestMapping("/getMyArticle.do")
    @ResponseBody
    public ModelAndView getMyArticle(@RequestParam int userid, @RequestParam(defaultValue = "1")int page, @RequestParam(defaultValue = "20")int size) {
        List<Article> list = articleService.getMyArticles(userid, page, size);
        PageInfo pageInfo = new PageInfo(list);
        ModelAndView mv = new ModelAndView("/article/myarticleItem");
        mv.addObject("pageInfo", pageInfo);
        return mv;
    }

    @RequestMapping("/detail.do")
    public ModelAndView getArticleDetail(@RequestParam int id) {
        ModelAndView mv = new ModelAndView("/article/detail");
        Article article = articleService.getArticle(id);
        User user = userService.getUserById(article.getUserid());
        List<User_Comment> user_comment_list = user_comment_service.getCommentUserList(article.getFid());
        mv.addObject("article", article);
        mv.addObject("user", user);
        mv.addObject("commentList", user_comment_list);
        return mv;
    }

    @RequestMapping("/getMyCommentArticle.do")
    @ResponseBody
    public ModelAndView getMyCommentArticle(@RequestParam int userid, @RequestParam(defaultValue = "1")int page, @RequestParam(defaultValue = "5")int size) {
        ModelAndView mv = new ModelAndView("/article/listItem");
        PageInfo pageInfo = new PageInfo(articleService.getMyCommentArticle(userid, page, size));
        mv.addObject("pageInfo", pageInfo);
        return mv;
    }

    @RequestMapping("/getMyCollect.do")
    @ResponseBody
    public ModelAndView getMyCollect(@RequestParam int userid, @RequestParam(defaultValue = "1")int page, @RequestParam(defaultValue = "5")int size) {
        ModelAndView mv = new ModelAndView("/article/listItem");
        PageInfo pageInfo = new PageInfo(articleService.getMyCollect(userid, page, size));
        mv.addObject("pageInfo", pageInfo);
        return mv;
    }

    @RequestMapping("/toNewArticle.do")
    public ModelAndView newArticle(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        if( null != session.getAttribute("currentUser")) {
            mv.setViewName("/article/write");
            List<Plate> plateList = plateService.getAllPlate();
            mv.addObject("plateList", plateList);
        }
        else mv.setViewName("/user/login");
        return mv;
    }

    @RequestMapping("/plate.do")
    public ModelAndView getPlateArticle(@RequestParam int bid) {
        ModelAndView mv = new ModelAndView("/article/plate");
        Plate plate = plateService.getPlateById(bid);
        List<Article> articleList = articleService.getPlateArticle(plate.getBname());
        mv.addObject("list", articleList);
        return mv;
    }

    @RequestMapping("/addArticle.do")
    public String addAricle(@RequestParam("imgUrl") MultipartFile file, @RequestParam String titles, @RequestParam String fcontent, @RequestParam String bname, @RequestParam int userid, @RequestParam String username, HttpServletRequest request) {
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);

        Article article=new Article();
        article.setTitles(titles);
        article.setFcontent(fcontent);
        article.setBname(bname);
        article.setUsername(username);
        article.setUserid(userid);
        String newName="";
        try {
            String fileName = file.getOriginalFilename();
            newName = UUID.randomUUID()+fileName.substring(fileName.lastIndexOf("."));
            String path = realPath + "/static/images/article/";
//            System.out.println(realPath);
            File newFile = new File(path+newName);
            file.transferTo(newFile);
            //articleService.addArticle(titles, fcontent, newName, bname, userid, username);
        }catch (Exception e) {
            return "400";
        }

        //验证是否含有敏感词汇
        String contentText=fcontent;		//获取文章内容
        Set<String> sensiWord= WordDetect.getBadWord(contentText,2);		//最大匹配规则获取敏感词
        Iterator<String> iterator=sensiWord.iterator();

        String Sense="";
        //获取敏感词
        while(iterator.hasNext()){
            Sense=Sense+"   "+iterator.next();
        }
        System.out.println("后台敏感词检测结果："+Sense);

        int status=1;
        //不包含任何敏感词汇
        if(Sense.equals("")){
            System.out.println("文章不含敏感词汇");
            IAdminService adminService=new IAdminService();
            //adminService.updateArticleStatus(1);
            request.getSession().setAttribute("SenseWord","");
        }
        else{
            //设置敏感词汇属性
            request.getSession().setAttribute("SenseWord",Sense);
            System.out.println("设置返回Session");

            status=0;
        }

        //插入文章到数据库
        articleService.addArticle(titles, fcontent, newName, bname, userid, username,status);

        return "redirect:/user/user-info.do?id="+userid;
    }

    @RequestMapping("/editArticle.do")
    public ModelAndView editArticle(int fid) {
        ModelAndView mv = new ModelAndView("/article/edit");
        Article article = articleService.getArticle(fid);
        List<Plate> plateList = plateService.getAllPlate();
        mv.addObject("plateList", plateList);
        mv.addObject("article", article);
        return mv;
    }

    @RequestMapping("/updateArticle.do")
    public String updateAricle(@RequestParam("imgUrl") MultipartFile file, @RequestParam String titles, @RequestParam String fcontent, @RequestParam String bname, @RequestParam int userid, @RequestParam String username, @RequestParam int fid, @RequestParam String oldName, HttpServletRequest request) {
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        //将文件写入到存放的地址
        try {
            if( file.getOriginalFilename().length() > 0) {
                String fileName = file.getOriginalFilename();
                String newName = UUID.randomUUID()+fileName.substring(fileName.lastIndexOf("."));
                String path = realPath + "/static/images/article/";
                File newFile = new File(path+newName);
                file.transferTo(newFile);
                articleService.updateArticle(fid, titles, fcontent, newName, bname, userid, username);
            }
            else articleService.updateArticle(fid, titles, fcontent, oldName, bname, userid, username);

        }catch (Exception e) {
            System.out.println(file);
            e.printStackTrace();
            return "400";
        }
        return "redirect:/user/user-info.do?id="+userid;
    }

    @RequestMapping("/searchByTitle.do")
    public ModelAndView searchByTitle(@RequestParam String title, @RequestParam(defaultValue = "1")int page, @RequestParam(defaultValue = "1000")int size){
        //按照文章标题搜索文章

        List<Article> articles=articleService.getArticleByTitle(title,page,size);
        //List<Article> listArticle = (List<Article>) map.get("listArticle");
        PageInfo pageInfo = new PageInfo(articles);
        ModelAndView mv = new ModelAndView("/article/listItem");
        mv.addObject("pageInfo", pageInfo);
        return mv;
    }

    @RequestMapping("/deleteArticle.do")
    public String deleteArticle(@RequestParam int fid, @RequestParam int userid) {
        articleService.deleteArticle(fid);
        collectService.deleteCollectByFid(fid);
        commentService.deleteCommentBiFid(fid);
        return "redirect:/user/user-info.do?id="+userid;
    }
}
