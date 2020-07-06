package com.swift.service;

import com.swift.dao.IViaDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ViaService {
    @Autowired
    private IViaDao viaDao;
    //新增用户时也要新增一个via
    public void addVia(Integer userid, String photo) {
        viaDao.addVia(userid, photo);
    }
    //更新用户还要更新此表
    public void updateVia(Integer userid, String photo) {
        viaDao.updateVia(userid, photo);
    }
}
