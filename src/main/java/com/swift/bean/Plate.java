package com.swift.bean;

public class Plate {
    private int bid;
    private String bname;
    private String btime;

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getBtime() {
        return btime;
    }

    public void setBtime(String btime) {
        this.btime = btime;
    }

    @Override
    public String toString() {
        return "Plate{" +
                "bid=" + bid +
                ", bname='" + bname + '\'' +
                ", btime='" + btime + '\'' +
                '}';
    }
}
