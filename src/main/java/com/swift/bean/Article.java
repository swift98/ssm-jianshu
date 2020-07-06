package com.swift.bean;

public class Article {
    private int fid;
    private String titles;
    private String fcontent;
    private String photo;
    private String bname;
    private String time;
    private int userid;
    private String username;
    private int status;

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getTitles() {
        return titles;
    }

    public void setTitles(String titles) {
        this.titles = titles;
    }

    public String getFcontent() {
        return fcontent;
    }

    public void setFcontent(String fcontent) {
        this.fcontent = fcontent;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Article{" +
                "fid=" + fid +
                ", titles='" + titles + '\'' +
                ", fcontent='" + fcontent + '\'' +
                ", photo='" + photo + '\'' +
                ", bname='" + bname + '\'' +
                ", time='" + time + '\'' +
                ", userid=" + userid +
                ", username='" + username + '\'' +
                ", status=" + status +
                '}';
    }
}
