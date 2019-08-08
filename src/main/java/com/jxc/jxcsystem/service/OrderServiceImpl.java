package com.jxc.jxcsystem.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.dao.OrderDao;
import com.jxc.jxcsystem.pojo.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderDao orderDao;


    /*销售操作*/
    @Override
    public int getCount() {
        return orderDao.getCount();
    }
    //需要同时向两个表进行添加，是一个业务单元，要不同时成功，要不同时失败，事务管理
    @Override
    public boolean addApplyOrder(Map map) {
      int num=  orderDao.addSelltotal(map);//添加总表
        //添加详情表
       List<Map> list= (List<Map>)map.get("goods");
     int num2=   orderDao.addSelldetail(list);
     if(num>0 && num2>0){
         return  true;

     }
        return false;
    }




    /*出库操作*/
    @Override
    public int getOuttotalCount() {
        return orderDao.getOuttotalCount();
    }

    @Override
    public boolean addApplyOrderOuttotal(Map map) {
        int num=  orderDao.addOuttotal(map);//添加总表
        //添加详情表
        List<Map> list= (List<Map>)map.get("goods");
        int num2=   orderDao.addOutdetail(list);
        if(num>0 && num2>0){
            return  true;

        }
        return false;
    }

   /* @Override
    public boolean updateSO(Map map) {
        orderDao.updateSelltotal(map);
        orderDao.updateOuttotal(map);
        return true;
    }*/


    @Override
    public PageInfo quertOrders(User info, PageInfo pageInfo) {

        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        PageInfo page=new PageInfo(orderDao.queryOrders(info));
        //查询所有订单之前
        return page;
    }

    @Override
    public List<Map> getApplySuccessOrder() {
        return orderDao.getApplySuccessOrder();
    }

    @Override
    public List<Map> getApplySuccessOrderDetail(String selltoNo) {
        return orderDao.getApplySuccessOrderDetail(selltoNo);
    }

    @Override
    public List<Map> getwarehouse() {
        return orderDao.getwarehouse();
    }
}
