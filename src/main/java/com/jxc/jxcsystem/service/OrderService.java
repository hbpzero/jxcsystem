package com.jxc.jxcsystem.service;

import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.pojo.User;

import java.util.List;
import java.util.Map;

public interface OrderService {
    public int getCount();
    public boolean addApplyOrder(Map map);

    public int getOuttotalCount();
    public boolean addApplyOrderOuttotal(Map map);



    /*public boolean updateSO(Map map);*/



    public PageInfo quertOrders(User info, PageInfo pageInfo);
    //获取所有的采购完成的
    public List<Map> getApplySuccessOrder();
    public List<Map> getApplySuccessOrderDetail(String selltoNo);

    public List<Map> getwarehouse();
}
