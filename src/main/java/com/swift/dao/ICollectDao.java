package com.swift.dao;

import com.swift.bean.Collect;

import java.util.List;

public interface ICollectDao {
    //通过用户id获取该用户的收藏的文章
    public List<Collect> getMyCollect(int userid);
    //增加某个用户的收藏
    public void addCollect(int userid, int fid);
    //删除某个用户的收藏
    public void deleteCollect(int userid, int fid);
    //删除文章后要删除对应的收藏
    public void deleteCollectByFid(int fid);
}
