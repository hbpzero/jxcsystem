package com.jxc.jxcsystem.service;


import com.jxc.jxcsystem.pojo.Goods;
import org.apache.ibatis.annotations.Insert;

import java.util.List;
import java.util.Map;

public interface GoodsService {
      List<Map> selectGoods();
      int insertGoods(Goods goods);
      int delGoods(Integer goodsId);
      int updateGoods(Goods goods);
      List<Map> selectGoodsById(Integer goodsId);
      List<Map> findGoodsType();

}
