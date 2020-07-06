package com.swift.service.impl;

import com.swift.bean.Collect;
import com.swift.dao.ICollectDao;
import com.swift.service.ICollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CollectService implements ICollectService {

    @Autowired
    private ICollectDao collectDao;

    @Override
    public List<Collect> getMyCollect(int userid) {
        return collectDao.getMyCollect(userid);
    }

    @Override
    public void addCollect(int userid, int fid) {
        collectDao.addCollect(userid, fid);
    }

    @Override
    public void deleteCollect(int userid, int fid) {
        collectDao.deleteCollect(userid, fid);
    }

    @Override
    public void deleteCollectByFid(int fid) {
        collectDao.deleteCollectByFid(fid);
    }
}
