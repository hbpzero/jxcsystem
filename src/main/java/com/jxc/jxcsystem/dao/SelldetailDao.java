package com.jxc.jxcsystem.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface SelldetailDao {
    @Select("select * from selldetail join goods on selldetail.goodsNo=goods.goodsNo join goodstype on goods.goodstypeid=goodstype.goodsTypeId")
    public List<Map> selectSell();




}
