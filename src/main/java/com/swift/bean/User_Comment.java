package com.swift.bean;

public class User_Comment {
    private int pid;
    private int userid;
    private int fid;
    private String pcontent;
    private String time;
    private String photo;
    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
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

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "User_Comment{" +
                "pid=" + pid +
                ", userid=" + userid +
                ", fid=" + fid +
                ", pcontent='" + pcontent + '\'' +
                ", time='" + time + '\'' +
                ", photo='" + photo + '\'' +
                ", username='" + username + '\'' +
                '}';
    }
}
