package com.jxc.jxcsystem.controller;

import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.pojo.User;
import com.jxc.jxcsystem.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {
    @Resource
    private OrderService orderService;

    /*销售操作*/
    @RequestMapping("/getNo")
    @ResponseBody
    public String getNo(){
        String orderid=null;
      int count=  orderService.getCount();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
        if(count==0){
            orderid="NO"+sdf.format(new Date())+"001";
        }else
      if(count<10){
          orderid="NO"+sdf.format(new Date())+"00"+count;
      }else if(count<100){
          orderid="NO"+sdf.format(new Date())+"0"+count;
      }else{
          orderid="NO"+sdf.format(new Date())+count;
      }
      return  orderid;
    }

    @RequestMapping("/applyOrder")
    @ResponseBody//向客户端响应一个json数据
    public String applyOrder(@RequestBody Map map){//从客户端接收一个数据
        boolean flag=orderService.addApplyOrder(map);
        if(flag)
            return "true";
        else
             return "false";
    }


    /*出库操作*/
    @RequestMapping("/getNoOuttotal")
    @ResponseBody
    public String getNoOuttotal(){
        String orderid=null;
        int count=  orderService.getOuttotalCount();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
        if(count==0){
            orderid="NO"+sdf.format(new Date())+"001";
        }else
        if(count<10){
            orderid="NO"+sdf.format(new Date())+"00"+count;
        }else if(count<100){
            orderid="NO"+sdf.format(new Date())+"0"+count;
        }else{
            orderid="NO"+sdf.format(new Date())+count;
        }
        return  orderid;
    }

    @RequestMapping("/applyOrderOuttotal")
    @ResponseBody//向客户端响应一个json数据
    public String applyOrderOuttotal(@RequestBody Map map){//从客户端接收一个数据
        boolean flag=orderService.addApplyOrderOuttotal(map);
        if(flag)
            return "true";
        else
            return "false";
    }





    @RequestMapping("/toGetOrder")
    public String togetOrder(){
        return "/back/getOrder";
    }

    @RequestMapping("/getOrders")
    @ResponseBody
    public PageInfo getOrders(HttpSession session, PageInfo pageInfo){
        User info=(User)session.getAttribute("userInfo");
        System.out.println(info.getUserName());
        return orderService.quertOrders(info,pageInfo);
    }
    //跳转到采购入库页面
    @RequestMapping("/toGetApplyOrder")
    public String toGetApplyOrder(){
        return "/back/getApplyOrder";

    }
    //获取所有的采购已完成的
    @RequestMapping("/getApplySuccessOrder")
    @ResponseBody
    public List<Map> getApplySuccessOrder(){
        return orderService.getApplySuccessOrder();

    }
    @RequestMapping("/detailSuccessOrder")
    @ResponseBody
    public List<Map> detailSuccessOrder(String selltoNo){
        System.out.println(selltoNo);
        return orderService.getApplySuccessOrderDetail(selltoNo);

    }

    @RequestMapping("/getwarehouse")
    @ResponseBody
    public List<Map> getwarehouse(){

        return orderService.getwarehouse();
    }

}
