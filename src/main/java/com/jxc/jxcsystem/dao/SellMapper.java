package com.jxc.jxcsystem.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface SellMapper {
    public List<Map> queryComplete();
    public List<Map> queryDetail(@Param("selltoNo") String selltoNo);
    public List<Map> searchSell(Map map);
    public Float getSellPriceThisMonth();
    public List<Map> getSellPriceThisYear();
}
