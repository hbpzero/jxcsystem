package com.jxc.jxcsystem.pojo;

public class WareHouseTotal {
    private Integer wareTotalId;
    private Integer warehouseId;
    private String goodsNo;
    private Integer wGoodsNum;

    public Integer getWareTotalId() {
        return wareTotalId;
    }

    public void setWareTotalId(Integer wareTotalId) {
        this.wareTotalId = wareTotalId;
    }

    public Integer getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Integer warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getGoodsNo() {
        return goodsNo;
    }

    public void setGoodsNo(String goodsNo) {
        this.goodsNo = goodsNo;
    }

    public Integer getwGoodsNum() {
        return wGoodsNum;
    }

    public void setwGoodsNum(Integer wGoodsNum) {
        this.wGoodsNum = wGoodsNum;
    }
}
