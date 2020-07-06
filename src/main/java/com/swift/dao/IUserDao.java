package com.swift.dao;

import com.swift.bean.SimpleUser;
import com.swift.bean.User;

import java.util.List;

public interface IUserDao {
    //通过id获取某个用户
    public User getUserById(Integer id);
    //通过用户名和密码获取用户，该方法已废弃
    public SimpleUser getUserByNamePwd(String name, String pwd);
    //通过用户id获取该用户的关注的用户
    public List<User> getMyFocus(int id);
    //通过用户id获取该用户的粉丝，即关注了该用户的用户
    public List<User> getMyFans(int id);
    //用户登录，成功返回该用户
    public User login(String username, String password);
    //更新用户
    public void updateUser(int userid, String username, int age, String sex, String password, String email, String family, String intro);
}
