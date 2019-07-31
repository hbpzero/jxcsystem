package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.pojo.PurDetail;
import com.jxc.jxcsystem.pojo.PurTotal;

import java.util.List;
import java.util.Map;

public interface PurService {
    public boolean addNewPur(Map map);
    public List<PurTotal> queryApply();
    public List<Map>queryDetail(String purtoNo);
    public int apply(String result,String purtoNo );
    public List<PurTotal> queryAll();
}
