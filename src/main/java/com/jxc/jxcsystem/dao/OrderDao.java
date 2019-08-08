package com.jxc.jxcsystem.dao;

import com.jxc.jxcsystem.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface OrderDao {

    public int getCount();
    //向销售总表进行添加
    public int addSelltotal(Map map);
    //向销售详情表中进行添加
    public int addSelldetail(List<Map> list);


    public int getOuttotalCount();
    //向出库总表进行添加
    public int addOuttotal(Map map);
    //向出库详情表中进行添加
    public int addOutdetail(List<Map> list);


    public void updateSelltotal(Map map);

    public void updateOuttotal(Map map);

    //根据角色查询订单
    public List<Map> queryOrders(User info);

    //读取所有销售完成的订单
    public List<Map> getApplySuccessOrder();
    //根据订单编号查询订单详情
    public List<Map> getApplySuccessOrderDetail(@Param("selltoNo") String selltoNo);

    public List<Map> getwarehouse();
}
