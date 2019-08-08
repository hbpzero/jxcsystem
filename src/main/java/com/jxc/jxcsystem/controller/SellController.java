package com.jxc.jxcsystem.controller;

import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.service.SellService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/sell")
public class SellController {
    @Resource
    private SellService sellService;
    @RequestMapping(value = "/queryComplete")
    @ResponseBody
    public PageInfo queryComplete(PageInfo pageInfo){
        return sellService.queryComplete(pageInfo);
    }

    @RequestMapping(value = "/queryDetail")
    @ResponseBody
    public List<Map>queryDetail(String selltoNo){
        return sellService.queryDetail(selltoNo);
    }

    @RequestMapping(value = "/search")
    @ResponseBody
    public PageInfo search(@RequestBody Map map ){
        return sellService.searchSell(map);
    }

    @RequestMapping(value = "/sellPricethisMonth")
    @ResponseBody
    public Float sellPricethisMonth(){
        return sellService.getSellPriceThisMonth();
    }

    @RequestMapping(value = "/sellPricethisYear")
    @ResponseBody
    public List<Map> sellPricethisYear(){
        return sellService.getSellPriceThisYear();
    }
}

