package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.pojo.WareHouse;

import java.util.List;
import java.util.Map;

public interface WareService {
    public List<WareHouse> queryAll();
    public Boolean applyToWare(Map map);
}
