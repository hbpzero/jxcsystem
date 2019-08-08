package com.jxc.jxcsystem.pojo;

import java.util.Date;

public class Outtotal {
    private int outtoId;
    private String outtoNo;
    private Date outtoTime;
    private String outtoMan;
    private String outtoShiUnit;
    private String outtoAuResult;

    public Outtotal() {
    }

    public Outtotal(int outtoId, String outtoNo, Date outtoTime, String outtoMan, String outtoShiUnit, String outtoAuResult) {

        this.outtoId = outtoId;
        this.outtoNo = outtoNo;
        this.outtoTime = outtoTime;
        this.outtoMan = outtoMan;
        this.outtoShiUnit = outtoShiUnit;
        this.outtoAuResult = outtoAuResult;
    }

    public int getOuttoId() {

        return outtoId;
    }

    public void setOuttoId(int outtoId) {
        this.outtoId = outtoId;
    }

    public String getOuttoNo() {
        return outtoNo;
    }

    public void setOuttoNo(String outtoNo) {
        this.outtoNo = outtoNo;
    }

    public Date getOuttoTime() {
        return outtoTime;
    }

    public void setOuttoTime(Date outtoTime) {
        this.outtoTime = outtoTime;
    }

    public String getOuttoMan() {
        return outtoMan;
    }

    public void setOuttoMan(String outtoMan) {
        this.outtoMan = outtoMan;
    }

    public String getOuttoShiUnit() {
        return outtoShiUnit;
    }

    public void setOuttoShiUnit(String outtoShiUnit) {
        this.outtoShiUnit = outtoShiUnit;
    }

    public String getOuttoAuResult() {
        return outtoAuResult;
    }

    public void setOuttoAuResult(String outtoAuResult) {
        this.outtoAuResult = outtoAuResult;
    }
}
