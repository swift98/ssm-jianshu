package com.swift.dao;

public interface IViaDao {
    //新增用户时也要插入一条via信息
    public void addVia(int userid, String photo);
    //更新用户还要更新此表
    public void updateVia(int userid, String photo);
}
