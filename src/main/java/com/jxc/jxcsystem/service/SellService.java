package com.jxc.jxcsystem.service;

import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface SellService {
    public PageInfo queryComplete(PageInfo pageInfo);
    public PageInfo searchSell(Map map);
    public List<Map> queryDetail(String selltoNo);
    public Float getSellPriceThisMonth();
    public List<Map> getSellPriceThisYear();
}
