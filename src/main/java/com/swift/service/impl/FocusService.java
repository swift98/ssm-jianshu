package com.swift.service.impl;

import com.swift.bean.Focus;
import com.swift.dao.IFocusDao;
import com.swift.service.IFocusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FocusService implements IFocusService {

    @Autowired
    private IFocusDao focusDao;

    @Override
    public List<Focus> getMyFocus(int userid) {
        return focusDao.getMyFocus(userid);
    }

    @Override
    public void addFocus(int userid, int beuserid) {
        focusDao.addFocus(userid, beuserid);
    }

    @Override
    public void deleteFocus(int userid, int beuserid) {
        focusDao.deleteFocus(userid, beuserid);
    }
}
