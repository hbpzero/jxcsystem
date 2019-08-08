package com.jxc.jxcsystem.controller;

import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.pojo.Outtotal;
import com.jxc.jxcsystem.service.OuttotalService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
public class OuttoalController {
    @Resource
    private OuttotalService outtotalService;



    @RequestMapping("/selectOuttotal")
    @ResponseBody
    public PageInfo selectOuttotal(PageInfo pageInfo){
        System.out.println(outtotalService.selectOuttotal(pageInfo));
        return outtotalService.selectOuttotal(pageInfo);
    }

    @RequestMapping("/updateOuttotal")
    @ResponseBody
    public String updateOuttotal(Outtotal outtotal){


        outtotalService.updeteOuttotal(outtotal);
        return "success";
    }

    //跳转到出库总表页面
    @RequestMapping("/toOuttotal")
    public String toOuttoal(){
        return "/back/outtotal";

    }

}
