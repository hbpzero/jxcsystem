package com.jxc.jxcsystem.dao;

import com.jxc.jxcsystem.pojo.Puttotal;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface PutMapper {
    public int createPut(Puttotal puttotal);
    public int createDetail(List<Map> list);
    public List<Puttotal> queryApply();
    public List<Map> queryDetail(@Param("puttoNo") String puttoNo);
    public int complete(@Param("puttoNo") String puttoNo);
    public int setDetail(@Param("puttoNo") String puttoNo, @Param("goodsNo") String goodsNo, @Param("putdeActNum") Integer putdeActNum, @Param("putdewareAddress") String putdewareAddress);
}
