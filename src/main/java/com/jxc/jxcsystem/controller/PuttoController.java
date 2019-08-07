package com.jxc.jxcsystem.controller;

import com.jxc.jxcsystem.service.PuttoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/putto")
public class PuttoController {
    @Resource
    PuttoService puttoService;
    @RequestMapping("/main")
    public String main(){
        return "/back/putTotal";
    }
    //流水号
    @RequestMapping("/getCount")
    @ResponseBody
    public String   getCount(){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmm");
        String message;
        int count=puttoService.selectCount();
        if(count<9){
            message="PUTTO"+sdf.format(new Date())+"00"+(count+1);
        }
        else if(count>=9&&count<99){
            message="PUTTO"+sdf.format(new Date())+"0"+(count+1);
        }
        else{
            message="PUTTO"+sdf.format(new Date())+(count+1);
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

    @RequestMapping("/puttoGoods")
    @ResponseBody
    public String puttoGoods(@RequestBody  Map map){
        String message;
        int count=puttoService.insertPutto(map);

        if(count==1){
            message="success";
        }else{message="false";}
        return message;
    }

    @RequestMapping("/selectWarehouse")
    @ResponseBody
    public List<Map> selectWarehouse(){
        return puttoService.selectWarehouse();
    }

}
