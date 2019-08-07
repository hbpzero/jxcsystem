package com.jxc.jxcsystem.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.dao.WarehouseMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class WarehouseServiceImpl implements WarehouseService {
    @Resource
    WarehouseMapper warehouseMapper;

    @Override
    public List<Map> selectWarehous() {
        return warehouseMapper.selectWarehous();
    }

    @Override
    public List<Map> selectWarehousTotal(Integer warehouseId) {
        return warehouseMapper.selectWarehousTotal(warehouseId);
    }
/*
    @Override
    public List<Map> selectGoods() {
        return warehouseMapper.selectGoods();
    }
*/
    @Override
    public int insertWarehouse(String wareAddress) {
        return warehouseMapper.insertWarehouse(wareAddress);
    }

    @Override
    public int selectAddress(String wareAddress) {
        return warehouseMapper.getAddress(wareAddress);
    }

    @Override
    public PageInfo getPage(Integer warehouseId,PageInfo pageInfo) {
        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        PageInfo page=new PageInfo(warehouseMapper.selectWarehousTotal(warehouseId));
        return page;
    }

    @Override
    public List<Map> selectType() {
        return warehouseMapper.selectType();
    }

    @Override
    public PageInfo selectByCheck(String goodsName, Integer goodsTypeId, int warehouseId, PageInfo pageInfo) {
        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        PageInfo page=new PageInfo(warehouseMapper.selectByCheck(goodsName,goodsTypeId,warehouseId));
        return page;
    }

}
