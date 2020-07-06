package com.swift.controller;

import com.swift.bean.*;
import com.swift.service.ICollectService;
import com.swift.service.IFocusService;
import com.swift.service.IUserService;
import com.swift.service.impl.SimpleUserService;
import com.swift.service.ViaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private ICollectService collectService;
    @Autowired
    private IFocusService focusService;
    @Autowired
    private ViaService viaService;
    @Autowired
    private SimpleUserService simpleUserService;

    @RequestMapping("/toLogin.do")
    public ModelAndView toLogin() {
        ModelAndView mv = new ModelAndView("/user/login");
        return mv;
    }

    @RequestMapping("/toRegister.do")
    public ModelAndView toRegister() {
        ModelAndView mv = new ModelAndView("/user/register");
        return mv;
    }

    @RequestMapping("/user-info.do")
    public ModelAndView getUserDetail(@RequestParam int id) {
        ModelAndView mv = new ModelAndView("/user/detail");
        User user = userService.getUserById(id);
        mv.addObject("user", user);
        return mv;
    }

    @RequestMapping("/login.do")
    public String login(String inputName, String inputPassword, HttpServletRequest request) {
        User user = null;
        user = userService.login(inputName, inputPassword);
        if ( null != user ) {
            List<Collect> cList = collectService.getMyCollect(user.getUserid());
            List<Focus> fList = focusService.getMyFocus(user.getUserid());
            List<Integer> collectList = new ArrayList<>();
            List<Integer> focusList = new ArrayList<>();
            for (Focus tmp : fList) {
                focusList.add(tmp.getBeuserid());
            }
            for (Collect tmp : cList) {
                collectList.add(tmp.getFid());
            }
//            System.out.println(collectList.toString());
//            System.out.println(focusList.toString());
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            session.setAttribute("collectList", collectList);
            session.setAttribute("focusList", focusList);
            return "redirect:/index.jsp";
        }
        else return "redirect:/user/toLogin.do";
    }

    @RequestMapping("/myFocus.do")
    @ResponseBody
    public ModelAndView getMyFocus(@RequestParam int id) {
        ModelAndView mv = new ModelAndView("/user/focusItem");
        List<User> userList = userService.getMyFocus(id);
        mv.addObject("userList", userList);
        return mv;
    }

    @RequestMapping("/myFans.do")
    @ResponseBody
    public ModelAndView getMyFans(@RequestParam int id) {
        ModelAndView mv = new ModelAndView("/user/focusItem");
        List<User> userList = userService.getMyFans(id);
        mv.addObject("userList", userList);
        return mv;
    }

    @RequestMapping("/exit.do")
    @ResponseBody
    public void exit(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
    }

    @RequestMapping("/addFocus.do")
    @ResponseBody
    public String addFocus(@RequestParam int userid, @RequestParam int beuserid, HttpServletRequest req) {
        try {
            focusService.addFocus(userid, beuserid);
            User user = (User)req.getSession().getAttribute("currentUser");
            List<Focus> fList = focusService.getMyFocus(user.getUserid());
            List<Integer> focusList = new ArrayList<>();
            for (Focus tmp : fList) {
                focusList.add(tmp.getBeuserid());
            }
            req.getSession().setAttribute("focusList", focusList);
            return "200";
        }catch (Exception e) {
            return "400";
        }
    }

    @RequestMapping("/deleteFocus.do")
    @ResponseBody
    public String deleteFocus(@RequestParam int userid, @RequestParam int beuserid, HttpServletRequest req) {
        try {
            focusService.deleteFocus(userid, beuserid);
            User user = (User)req.getSession().getAttribute("currentUser");
            List<Focus> fList = focusService.getMyFocus(user.getUserid());
            List<Integer> focusList = new ArrayList<>();
            for (Focus tmp : fList) {
                focusList.add(tmp.getBeuserid());
            }
            req.getSession().setAttribute("focusList", focusList);
            return "200";
        }catch (Exception e) {
            return "400";
        }
    }

    @RequestMapping("/addCollect.do")
    @ResponseBody
    public String addCollect(@RequestParam int userid, @RequestParam int fid, HttpServletRequest req) {
        try {
            collectService.addCollect(userid, fid);
            User user = (User)req.getSession().getAttribute("currentUser");
            List<Collect> cList = collectService.getMyCollect(user.getUserid());
            List<Integer> collectList = new ArrayList<>();
            for (Collect tmp : cList) {
                collectList.add(tmp.getFid());
            }
            req.getSession().setAttribute("collectList", collectList);
            return "200";
        }catch (Exception e) {
            return "400";
        }
    }

    @RequestMapping("/deleteCollect.do")
    @ResponseBody
    public String deleteCollect(@RequestParam int userid, @RequestParam int fid, HttpServletRequest req) {
        try {
            collectService.deleteCollect(userid, fid);
            User user = (User)req.getSession().getAttribute("currentUser");
            List<Collect> cList = collectService.getMyCollect(user.getUserid());
            List<Integer> collectList = new ArrayList<>();
            for (Collect tmp : cList) {
                collectList.add(tmp.getFid());
            }
            req.getSession().setAttribute("collectList", collectList);
            return "200";
        }catch (Exception e) {
            return "400";
        }
    }

    @RequestMapping("/register.do")
    public String register(String username, String password, String email) {
        simpleUserService.register(username, password, email);
        SimpleUser simpleUser = simpleUserService.getSimpleUser(username, password);
        System.out.println(simpleUser.toString());
        int id = simpleUser.getUserid();
        String p_path = "user.jpg";
        viaService.addVia(id, p_path);
        return "redirect:/user/toLogin.do";
    }

    @RequestMapping("/toEdit.do")
    public ModelAndView editUser(@RequestParam int userid)
    {
        ModelAndView mv = new ModelAndView("/user/edit");
        User user = userService.getUserById(userid);
        mv.addObject("user", user);
        return mv;
    }

    @RequestMapping("/updateUser.do")
    public String updateUser(@RequestParam("imgUrl") MultipartFile file, @RequestParam String username, @RequestParam String password, @RequestParam String intro, @RequestParam int userid, @RequestParam int age, @RequestParam String sex, @RequestParam String oldName,
                               @RequestParam String family, @RequestParam String email, HttpServletRequest request) {
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        //将文件写入到存放的地址
        try {
            if( file.getOriginalFilename().length() > 0) {
                String fileName = file.getOriginalFilename();
                String newName = UUID.randomUUID()+fileName.substring(fileName.lastIndexOf("."));
                String path = realPath + "/static/images/user/";
                System.out.println(realPath);
                File newFile = new File(path+newName);
                file.transferTo(newFile);
                userService.updateUser(userid, username, age, sex, password, email, family, intro);
                viaService.updateVia(userid, newName);
                HttpSession session = request.getSession();
                User user = (User)session.getAttribute("currentUser");
                user.setPhoto(newName);
            }
        }catch (Exception e) {
            System.out.println(file);
            e.printStackTrace();
            return "400";
        }
        return "redirect:/user/user-info.do?id="+userid;
    }
}
