package com.swift.service.impl;

import com.swift.bean.SimpleUser;
import com.swift.dao.ISimpleUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SimpleUserService {
    @Autowired
    private ISimpleUserDao simpleUserDao;
    //用户注册
    public void register(String username, String password, String email) {
        simpleUserDao.register(username, password, email);
    }

    //通过用户名密码获取一个SimpleUser
    public SimpleUser getSimpleUser(String username, String password) {
        return simpleUserDao.getSimpleUser(username, password);
    }
}
