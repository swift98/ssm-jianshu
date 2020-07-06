package com.swift.dao;

import com.swift.bean.Focus;

import java.util.List;

public interface IFocusDao {
    //通过用户id获取用户的关注用户
    public List<Focus> getMyFocus(int userid);
    //增加关注
    public void addFocus(int userid, int beuserid);
    //取消关注
    public void deleteFocus(int userid, int beuserid);
}
