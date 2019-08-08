package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.pojo.Puttotal;

import java.util.List;
import java.util.Map;

public interface PutInService {
    public List<Puttotal> queryApply();
    public List<Map> queryDetail(String puttoNo);
}
