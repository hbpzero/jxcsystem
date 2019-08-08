package com.jxc.jxcsystem.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface WHTotalDao {
    @Select("select * from warehouseTotal ")
    public List<Map> selectWHTotal();



}
