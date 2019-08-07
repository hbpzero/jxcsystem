package com.jxc.jxcsystem.dao;

import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
@Mapper
public interface WarehouseMapper {


        List<Map> selectWarehous();
        List<Map> selectWarehousTotal(Integer warehouseId);
        List<Map> selectGoods();
        int insertWarehouse(String wareAddress);
        int getAddress(String wareAddress);
        List<Map> selectType();

        List<Map> selectByCheck(@Param("goodsName") String goodsName,@Param("goodsTypeId") Integer goodsTypeId,@Param("warehouseId") int warehouseId);
}
