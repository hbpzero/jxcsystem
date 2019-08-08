package com.jxc.jxcsystem.pojo;

public class SellDetail {
    private Integer selldeId;
    private String goodsNo;
    private String selltoNo;
    private float selldeSub;
    private int selldeNum;

    public Integer getSelldeId() {
        return selldeId;
    }

    public void setSelldeId(Integer selldeId) {
        this.selldeId = selldeId;
    }

    public String getGoodsNo() {
        return goodsNo;
    }

    public void setGoodsNo(String goodsNo) {
        this.goodsNo = goodsNo;
    }

    public String getSelltoNo() {
        return selltoNo;
    }

    public void setSelltoNo(String selltoNo) {
        this.selltoNo = selltoNo;
    }

    public float getSelldeSub() {
        return selldeSub;
    }

    public void setSelldeSub(float selldeSub) {
        this.selldeSub = selldeSub;
    }

    public int getSelldeNum() {
        return selldeNum;
    }

    public void setSelldeNum(int selldeNum) {
        this.selldeNum = selldeNum;
    }
}
