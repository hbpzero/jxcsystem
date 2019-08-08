package com.jxc.jxcsystem.dao;


import com.jxc.jxcsystem.pojo.Selltotal;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface SelltotalDao {
    @Select("select * from selltotal where selltoOrdSta='未审核'")
    public List<Map> selectSellTal();

    @Update("update selltotal set selltoTime=#{selltoTime},selltoClient=#{selltoClient},selltoMan=#{selltoMan},selltoMan=#{selltoMan},selltoOrdSta=#{selltoOrdSta},selltoPrices=#{selltoPrices} where selltoNo=#{selltoNo} ")
    public void updeteSellTal(Selltotal selltotal);

    @Update("update selltotal set selltoOrdSta=#{selltoOrdSta} where  selltoNo=#{selltoNo} ")
    public void updateOutSellState(String  selltoNo);
}
