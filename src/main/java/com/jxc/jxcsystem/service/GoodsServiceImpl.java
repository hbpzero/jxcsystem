package com.jxc.jxcsystem.service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.dao.GoodsDao;
import com.jxc.jxcsystem.pojo.Goods;
import com.jxc.jxcsystem.pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class GoodsServiceImpl implements GoodsService {
    @Resource
    GoodsDao goodsDao;

    @Override
    public List<Map> getGoods() {
        return goodsDao.selectGoods();
    }

   @Override
   public PageInfo selectGoods(PageInfo pageInfo) {
       PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
       PageInfo page=new PageInfo(goodsDao.selectGoods());
       return page;
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
    public int selectGoodsNo(String goodsNo){
        return goodsDao.selectGoodsNo(goodsNo);
    }

    @Override
    public PageInfo selectByCheck(String goodsName, Integer goodsTypeId, PageInfo pageInfo) {
        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        PageInfo page=new PageInfo(goodsDao.selectByCheck(goodsName,goodsTypeId));
        return page;
    }
}
