package com.swift.service;

import com.swift.bean.Focus;

import java.util.List;

public interface IFocusService {
    //通过用户id获取该用户的关注用户
    public List<Focus> getMyFocus(int userid);
    //增加关注
    public void addFocus(int userid, int beuserid);
    //取消关注
    public void deleteFocus(int userid, int beuserid);
}
