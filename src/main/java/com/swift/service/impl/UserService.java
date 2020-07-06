package com.swift.service.impl;

import com.swift.bean.SimpleUser;
import com.swift.bean.User;
import com.swift.dao.IUserDao;
import com.swift.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService implements IUserService{
    @Autowired
    private IUserDao userDao;

    //通过用户id获取用户信息
    @Override
    public User getUserById(Integer id) {
        return userDao.getUserById(id);
    }

    //通过用户名和密码获取用户，该方法已废弃
    @Override
    public SimpleUser getUserByNamePwd(String name, String pwd) {
        return userDao.getUserByNamePwd(name, pwd);
    }

    //通过用户id获取该用户的所有关注用户
    @Override
    public List<User> getMyFocus(int id) {
        return userDao.getMyFocus(id);
    }

    @Override
    public List<User> getMyFans(int id) {
        return userDao.getMyFans(id);
    }

    @Override
    public User login(String username, String password) {
        return userDao.login(username, password);
    }

    @Override
    public void updateUser(int userid, String username, int age, String sex, String password, String email, String family, String intro) {
        userDao.updateUser(userid, username, age, sex, password, email, family, intro);
    }


}
