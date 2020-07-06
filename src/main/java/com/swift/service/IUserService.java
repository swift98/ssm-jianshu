package com.swift.service;

import com.swift.bean.SimpleUser;
import com.swift.bean.User;

import java.util.List;

public interface IUserService {
    //通过用户id获取用户信息
    public User getUserById(Integer id);
    //通过用户名和密码获取用户，该方法已废弃
    public SimpleUser getUserByNamePwd(String name, String pwd);
    //通过用户id获取该用户的关注用户
    public List<User> getMyFocus(int id);
    //通过用户id获取该用户的粉丝
    public List<User> getMyFans(int id);
    //用户登录
    public User login(String username, String password);
    //更新用户
    public void updateUser(int userid, String username, int age, String sex, String password, String email, String family, String intro);
}
