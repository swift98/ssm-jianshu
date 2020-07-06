package com.swift.bean;

public class Comment {
    private int pid;
    private String pcontent;
    private int userid;
    private int fid;
    private String time;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "pid=" + pid +
                ", pcontent='" + pcontent + '\'' +
                ", userid=" + userid +
                ", fid=" + fid +
                ", time='" + time + '\'' +
                '}';
    }
}
