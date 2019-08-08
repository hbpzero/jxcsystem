package com.jxc.jxcsystem.controller;

import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.pojo.User;
import com.jxc.jxcsystem.service.PurService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/pur")
public class PurController {
    @Resource
    private PurService purService;

    @RequestMapping(value = "/addPur")
    @ResponseBody
    public String addPur(@RequestBody Map map ){
        boolean result=purService.addNewPur(map);
        if (result){
            return "true";
        }else{
            return "false";
        }
    }
    @RequestMapping(value = "/queryAll")
    @ResponseBody
    public PageInfo queryAll(PageInfo pageInfo, HttpSession httpSession){
        User userInfo=(User) httpSession.getAttribute("user");
        return purService.queryAll(pageInfo,userInfo);
    }

    @RequestMapping(value = "/queryApply")
    @ResponseBody
    public PageInfo queryApply(int point,PageInfo pageInfo){
        return purService.queryApply(point,pageInfo);
    }

    @RequestMapping(value = "/queryDetail")
    @ResponseBody
    public List<Map>queryDetail(String purtoNo){
        return purService.queryDetail(purtoNo);
    }

    @RequestMapping(value = "/apply")
    @ResponseBody
    public String applyResult(int result,String purtoNo){
        String applyResult="";
        if (result==1)
            applyResult="已通过";
        else if (result==0)
            applyResult="未通过";
        else if (result==2)
            applyResult="采购完成";
        int flag=purService.apply(applyResult,purtoNo);
        if (flag>0)
            return "true";
        else
            return "false";

    }
    @RequestMapping(value = "/getPurTotalPriceThisMonth")
    @ResponseBody
    public Float getPurTotalPriceThisMonth(){
        return purService.getTotalPriceThisMonth();
    }

    @RequestMapping(value = "/getPurTotalPriceThisYear")
    @ResponseBody
    public List<Map> getPurTotalPriceThisYear(){
        return purService.getPriceAyear();
    }


   @RequestMapping(value = "/search")
   @ResponseBody
   public PageInfo search(@RequestBody Map map){
        return purService.search(map);
   }

    @RequestMapping(value = "/toConfirm")
    public String toConfirm(){return "/back/purTotalConfirm";}

    @RequestMapping(value = "/toCheck")
    public String toCheck(){
        return "/back/check";
    }

    @RequestMapping(value = "/toQuery")
    public String toQuery() {return "/back/purTotal";}


}
