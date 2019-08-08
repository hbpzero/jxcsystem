package com.jxc.jxcsystem.controller;

import com.jxc.jxcsystem.service.SelldetailService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class SelldetailController {

    @Resource
    private SelldetailService selldetailService;

    @RequestMapping("/selectSell")
    @ResponseBody
    public List<Map> selectSell(){



        return selldetailService.selectSell();
    }
}
