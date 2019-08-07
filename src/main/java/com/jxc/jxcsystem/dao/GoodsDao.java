package com.jxc.jxcsystem.dao;

import com.jxc.jxcsystem.pojo.Goods;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
@Mapper
public interface GoodsDao {
       // @Select("select g.*,gt.goodsTypeName goodsTypeName from goods g join goodstype gt on g.goodstypeid=gt.goodsTypeId ")
        public List<Map> selectGoods();//猹
      //  @Insert("insert into goods(goodsNo,goodsName,goodstypeid,goodsSize,proPrice,salePrice,srPrice,goodsPlace,unit) values(#{goodsNo},#{goodsName},#{goodstypeid},#{goodsSize},#{proPrice},#{salePrice},#{srPrice},#{goodsPlace},#{unit})")
       int insertGoods(Goods goods);
     //  @Delete("delete from goods where goodsId=#{goodsId}")
       int delGoods(Integer goodsId);
    //   @Update("update goods set goodstypeid=#{goodstypeid},goodsName=#{goodsName},goodsSize=#{goodsSize},proPrice=#{proPrice},salePrice=#{salePrice},srPrice=#{srPrice},goodsPlace=#{goodsPlace},unit=#{unit} where goodsNo=#{goodsNo}")
       int updateGoods(Goods goods);
      // @Select("select g.*,gt.goodsTypeName goodsTypeName from goods g join goodstype gt on g.goodstypeid=gt.goodsTypeId where goodsId=#{goodsId}")
       List<Map> selectGoodsById(Integer goodsId);
     //  @Select("select * from goodstype")
       List<Map> findGoodsType();
    //   @Select("select count(1) from goods where goodsNo=#{goodsNo}")
       int selectGoodsNo(String goodsNo);

       List<Map> selectByCheck(@Param("goodsName") String goodsName,@Param("goodsTypeId") Integer goodsTypeId);
}
