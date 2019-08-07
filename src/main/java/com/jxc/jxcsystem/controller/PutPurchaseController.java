package com.jxc.jxcsystem.controller;

import com.jxc.jxcsystem.service.PutPurchaseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/putpurchase")
public class PutPurchaseController {

    @Resource
    PutPurchaseService putPurchaseService;


    @RequestMapping("/main")
    public String main(){
        return "/back/putPurchase";
    }
    @RequestMapping("/select")
    @ResponseBody
    public List<Map> selectPurchase(){
        return putPurchaseService.selectPurchase();
    }
    @RequestMapping("/selectPurdetail")
    @ResponseBody
    public List<Map> selectPurde(String purtoNo){
        return putPurchaseService.selectPurdetail(purtoNo);
    }
    @RequestMapping("/getCount")
    @ResponseBody
    public String   getCount(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmm");
        String message;
        int count=putPurchaseService.selectCount();
        if(count<9){
            message="PUR"+sdf.format(new Date())+"00"+(count+1);
        }
        else if(count>=9&&count<99){
            message="PUR"+sdf.format(new Date())+"0"+(count+1);
        }
        else{
            message="PUR"+sdf.format(new Date())+(count+1);
        }
        return message;
    }
    //日期
    @RequestMapping("/getTime")
    @ResponseBody
    public String getTime(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(new Date());
    }

    @RequestMapping("/puttoPurchase")
    @ResponseBody
    public String puttoGoods(@RequestBody  Map map){
        String message;
        int count=putPurchaseService.insertPurchase(map);

        if(count==1){
            message="success";
        }else{message="false";}
        return message;
    }

}
