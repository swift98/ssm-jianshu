package com.swift.service;

import com.swift.bean.Plate;

import java.util.List;

public interface IPlateService {
    public List<Plate> getAllPlate();
    //通过板块名获取板块
    public Plate getPlateById(int bid);
}
