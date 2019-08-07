package com.jxc.jxcsystem.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface PuttoMapper {
    int selectCount();
    int insertPuttotal(Map map);
    int insertPutdetail(List<Map> list);
    List<Map> selectWarehouse();
}
