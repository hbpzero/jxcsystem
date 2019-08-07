package com.jxc.jxcsystem.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface PutPurchaseMapper {
    int selectCount();
    List<Map> selectPurchase();
    List<Map> selectPurdetail(@Param("purtoNo") String purtoNo);

    int insertPurchase(Map map);
    int insertPurchaseList(List<Map> list);
}
