package com.swift.dao;

import com.swift.bean.Plate;

import java.util.List;

public interface IPlateDao {
    //返回所有的板块
    public List<Plate> getAllPlate();
    //通过板块名获取板块
    public Plate getPlateById(int bid);
}
