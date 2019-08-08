package com.jxc.jxcsystem.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.dao.SelltotalDao;
import com.jxc.jxcsystem.pojo.Selltotal;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SelltotalServiceImp implements SelltotalService{
    @Resource
    private SelltotalDao selltotalDao;

    @Override
    public PageInfo selectSellTal(PageInfo pageInfo) {
        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        PageInfo page=new PageInfo(selltotalDao.selectSellTal());
        //查询所有订单之前

        return page;

    }

    @Override
    public void updeteSellTal(Selltotal selltotal) {
        selltotalDao.updeteSellTal(selltotal);
    }

    @Override
    public void updateOutSellState(String selltoNo) {
        selltotalDao.updateOutSellState(selltoNo);
    }


}
