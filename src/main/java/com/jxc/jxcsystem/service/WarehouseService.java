package com.jxc.jxcsystem.service;

import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface WarehouseService {
    List<Map> selectWarehous();
    List<Map> selectWarehousTotal(Integer warehouseId);
  //  List<Map> selectGoods();
    int insertWarehouse(String wareAddress);
    PageInfo getPage(Integer warehouseId,PageInfo pageInfo);
    int selectAddress(String wareAddress);
    List<Map> selectType();
    PageInfo selectByCheck(String goodsName,Integer goodsTypeId,int warehouseId,PageInfo pageInfo);
}
