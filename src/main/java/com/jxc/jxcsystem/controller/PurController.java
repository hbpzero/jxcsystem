package com.jxc.jxcsystem.controller;

import com.jxc.jxcsystem.pojo.PurDetail;
import com.jxc.jxcsystem.pojo.PurTotal;
import com.jxc.jxcsystem.service.PurService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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
    public List<PurTotal> queryAll(){
        return purService.queryAll();
    }

    @RequestMapping(value = "/queryApply")
    @ResponseBody
    public List<PurTotal> queryApply(){
        return purService.queryApply();
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
        int flag=purService.apply(applyResult,purtoNo);
        if (flag>0)
            return "true";
        else
            return "false";

    }

    @RequestMapping(value = "/toCheck")
    public String toCheck(){
        return "/back/check";
    }

    @RequestMapping(value = "/toQuery")
    public String toQuery() {return "/back/purTotal";}
}
