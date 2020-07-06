package com.swift.bean;

public class Focus {
    private int gid;
    private int userid;
    private int beuserid;

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getBeuserid() {
        return beuserid;
    }

    public void setBeuserid(int beuserid) {
        this.beuserid = beuserid;
    }

    @Override
    public String toString() {
        return "Focus{" +
                "gid=" + gid +
                ", userid=" + userid +
                ", beuserid=" + beuserid +
                '}';
    }
}
