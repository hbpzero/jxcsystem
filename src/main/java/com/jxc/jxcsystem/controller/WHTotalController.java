package com.jxc.jxcsystem.controller;

import com.jxc.jxcsystem.service.WHTotalService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class WHTotalController {
    @Resource
    private WHTotalService whTotalService;

    @RequestMapping("/selectWHTotal")
    @ResponseBody
    public List<Map> selectWHTotal(){

        return whTotalService.selectWHTotal();
    }
}
