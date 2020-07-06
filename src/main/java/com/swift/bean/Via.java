package com.swift.bean;

public class Via {
    private int userid;
    private String photo;

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Via{" +
                "userid=" + userid +
                ", photo='" + photo + '\'' +
                '}';
    }
}
