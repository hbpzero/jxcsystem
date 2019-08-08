package com.jxc.jxcsystem.dao;

import com.jxc.jxcsystem.pojo.WareHouse;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface WareMapper {
    public List<WareHouse> queryAll();
    public int judge(@Param("goodsNo") String goodNo, @Param("warehouseId") Integer warehouseId);
    public int createNewGood(Map map);
    public int updateGood(Map map);
    public int findWareIdByAddress(@Param("address") String address);
}
