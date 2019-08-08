package com.jxc.jxcsystem.pojo;

import java.util.Date;

public class SellTotal {
    private Integer selltoId;
    private String selltoNo;
    private Date selltoTime;
    private String selltoClient;
    private String selltoMan;
    private String selltoExplain;
    private String selltoOrdSta;
    private float selltoPrices;

    public Integer getSelltoId() {
        return selltoId;
    }

    public void setSelltoId(Integer selltoId) {
        this.selltoId = selltoId;
    }

    public String getSelltoNo() {
        return selltoNo;
    }

    public void setSelltoNo(String selltoNo) {
        this.selltoNo = selltoNo;
    }

    public Date getSelltoTime() {
        return selltoTime;
    }

    public void setSelltoTime(Date selltoTime) {
        this.selltoTime = selltoTime;
    }

    public String getSelltoClient() {
        return selltoClient;
    }

    public void setSelltoClient(String selltoClient) {
        this.selltoClient = selltoClient;
    }

    public String getSelltoMan() {
        return selltoMan;
    }

    public void setSelltoMan(String selltoMan) {
        this.selltoMan = selltoMan;
    }

    public String getSelltoExplain() {
        return selltoExplain;
    }

    public void setSelltoExplain(String selltoExplain) {
        this.selltoExplain = selltoExplain;
    }

    public String getSelltoOrdSta() {
        return selltoOrdSta;
    }

    public void setSelltoOrdSta(String selltoOrdSta) {
        this.selltoOrdSta = selltoOrdSta;
    }

    public float getSelltoPrices() {
        return selltoPrices;
    }

    public void setSelltoPrices(float selltoPrices) {
        this.selltoPrices = selltoPrices;
    }
}
