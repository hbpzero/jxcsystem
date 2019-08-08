package com.jxc.jxcsystem.controller;

import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.pojo.Selltotal;
import com.jxc.jxcsystem.service.SelltotalService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
public class SelltotalController {
    @Resource
    private SelltotalService selltotalService;

    @RequestMapping("/selectTal")
    @ResponseBody
    public PageInfo selectTal(PageInfo pageInfo){

        return selltotalService.selectSellTal(pageInfo);
    }

    @RequestMapping("/updateTal")
    @ResponseBody
    public String updateTal(Selltotal selltotal){

        System.out.println(selltotal);
        selltotalService.updeteSellTal(selltotal);
        return "success";
    }
    @RequestMapping("/updateOutSellState")
    @ResponseBody
    public String updateOutSellState(String selltoNo){
        selltotalService.updateOutSellState(selltoNo);
        return "success";
    }
    @RequestMapping("/toSell")
    public String toSell(){
        return "/back/sellTotal";
    }

}
