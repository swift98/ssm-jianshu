package com.swift.dao;

import com.swift.bean.SimpleUser;

public interface ISimpleUserDao {
    //用户注册
    public void register(String username, String password, String email);
    //通过用户名密码获取一个SimpleUser
    public SimpleUser getSimpleUser(String username, String password);
}
