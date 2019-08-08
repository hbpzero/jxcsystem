package com.jxc.jxcsystem.service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.dao.SellMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class SellServiceImpl implements SellService {
    @Resource
    private SellMapper sellMapper;
    @Override
    public PageInfo queryComplete(PageInfo pageInfo) {
        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        PageInfo page=new PageInfo(sellMapper.queryComplete());
        return page;
    }

    @Override
    public PageInfo searchSell(Map map) {
        PageHelper.startPage(Integer.parseInt(map.get("pageNum").toString()) ,Integer.parseInt(map.get("pageSize").toString()));
        PageInfo page=new PageInfo(sellMapper.searchSell(map));
        return page;
    }

    @Override
    public List<Map> queryDetail(String selltoNo) {
        return sellMapper.queryDetail(selltoNo);
    }

    @Override
    public Float getSellPriceThisMonth() {
        return sellMapper.getSellPriceThisMonth();
    }

    @Override
    public List<Map> getSellPriceThisYear() {
        return sellMapper.getSellPriceThisYear();
    }
}
