package com.jxc.jxcsystem.controller;

import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.service.WarehouseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/warehouse")
public class WarehouseController {
    @Resource
    WarehouseService warehouseService;
    @RequestMapping("/main")
    public String main(){
        return "/back/houseList";
    }

    @RequestMapping("/house")
    @ResponseBody
    public List<Map> selectWarehouse(){
        return warehouseService.selectWarehous();
    }
    @RequestMapping("/total")
    @ResponseBody
    public List<Map> selectWarehouseTotal(@RequestParam(value = "warehouseId") Integer warehouseId){
        return warehouseService.selectWarehousTotal(warehouseId);
    }
    @RequestMapping("/addhouse")
    @ResponseBody
    public String addHouse(String wareAddress){
        String message;
        int count=warehouseService.insertWarehouse(wareAddress);
        if(count!=0){
            message="success";
        }else{
            message="false";
        }return message;
    }
    @RequestMapping("/check")
    @ResponseBody
    public String checkAddress(String wareAddress){
        String message;
        int count=warehouseService.selectAddress(wareAddress);
        if(count!=0){
            message="false";
        }else {message="success";}
        return message;
    }
    @RequestMapping("/page")
    @ResponseBody
    public PageInfo getPage(Integer warehouseId,PageInfo pageInfo){
        return warehouseService.getPage(warehouseId,pageInfo);
    }
    @RequestMapping("/type")
    @ResponseBody
    public List<Map> selectType(){
        return warehouseService.selectType();
    }
    @RequestMapping("/selectByCheck")
    @ResponseBody
    public PageInfo selectByCheck(@RequestParam(value = "goodsName",required = false)String goodsName,@RequestParam(value = "goodsTypeId",required = false)Integer goodsTypeId,@RequestParam(value = "warehouseId")Integer warehouseId,PageInfo pageInfo){
       return warehouseService.selectByCheck(goodsName,goodsTypeId,warehouseId,pageInfo);
    }
    /*
    @RequestMapping("/goods")
    @ResponseBody
    public List<Map> selectGoods(){
        return warehouseService.selectGoods();
    }
    */
    /*
    @RequestMapping("/insert")
    @ResponseBody
    public String insertTotal(@RequestParam(value = "warehouseId")int warehouseId,@RequestParam(value = "goodsNo")String goodsNo,@RequestParam(value = "wGoodsNum")int wGoodsNum){
        String message;
        int count=warehouseService.insertWarehouseTotal(warehouseId,goodsNo,wGoodsNum);
        if(count!=0){
            message="success";
        }else{message="false";}
        return message;
    }
*/
}
