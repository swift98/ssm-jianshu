package com.swift.service.impl;

import com.swift.bean.Plate;
import com.swift.dao.IPlateDao;
import com.swift.service.IPlateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlateService implements IPlateService {

    @Autowired
    private IPlateDao plateDao;

    @Override
    public List<Plate> getAllPlate() {
        return plateDao.getAllPlate();
    }

    @Override
    public Plate getPlateById(int bid) {
        return plateDao.getPlateById(bid);
    }
}
