package com.jxc.jxcsystem.service;


import com.jxc.jxcsystem.dao.GoodsDao;
import com.jxc.jxcsystem.pojo.Goods;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class GoodsServiceImpl implements GoodsService {
    @Resource
    GoodsDao goodsDao;

    @Override
    public List<Map> selectGoods() {
        return goodsDao.selectGoods();
    }

    @Override
    public int insertGoods(Goods goods) {
        return goodsDao.insertGoods(goods);
    }

    @Override
    public int delGoods(Integer goodsId) {
        return goodsDao.delGoods(goodsId);
    }

    @Override
    public int updateGoods(Goods goods) {
        return goodsDao.updateGoods(goods) ;
    }

    @Override
    public List<Map> findGoodsType() {
        return goodsDao.findGoodsType();
    }

    @Override
    public List<Map> selectGoodsById(Integer goodsId) {
        return goodsDao.selectGoodsById(goodsId);
    }
}
