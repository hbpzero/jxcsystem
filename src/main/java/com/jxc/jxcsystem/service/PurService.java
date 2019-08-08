package com.jxc.jxcsystem.service;

import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.pojo.User;

import java.util.List;
import java.util.Map;

public interface PurService {
    public boolean addNewPur(Map map);
    public PageInfo queryApply(int point, PageInfo pageInfo);
    public List<Map>queryDetail(String purtoNo);
    public int apply(String result, String purtoNo);
    public PageInfo queryAll(PageInfo pageInfo, User user);
    public PageInfo search(Map map);
    public float getTotalPriceThisMonth();
    public List<Map> getPriceAyear();
}
