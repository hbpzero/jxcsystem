package com.jxc.jxcsystem.service;


import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.pojo.Goods;
import com.jxc.jxcsystem.pojo.User;
import org.apache.ibatis.annotations.Insert;

import java.util.List;
import java.util.Map;

public interface GoodsService {
      List<Map> getGoods();
      PageInfo selectGoods(PageInfo pageInfo);
      int insertGoods(Goods goods);
      int delGoods(Integer goodsId);
      int updateGoods(Goods goods);
      List<Map> selectGoodsById(Integer goodsId);
      List<Map> findGoodsType();
      int selectGoodsNo(String goodsNo);
      PageInfo selectByCheck(String goodsName,Integer goodsTypeId,PageInfo pageInfo);
}
