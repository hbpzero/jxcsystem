package com.jxc.jxcsystem.controller;

import com.jxc.jxcsystem.pojo.Puttotal;
import com.jxc.jxcsystem.service.PutInService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/putIn")
public class PutInController {
    @Resource
    private PutInService putInService;

    @RequestMapping(value = "/queryApply")
    @ResponseBody
    public List<Puttotal>queryApply(){
        return putInService.queryApply();
    }
    @RequestMapping(value = "/queryDetail")
    @ResponseBody
    public List<Map> queryDetail(String puttoNo){
        return putInService.queryDetail(puttoNo);
    }



    @RequestMapping(value = "/toConfirm")
    public String toConfirm(){
        return "/back/putinConfirm";
    }
}
