package com.jxc.jxcsystem.controller;

import com.jxc.jxcsystem.service.StateService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class StateController {

    @Resource
    private StateService stateService;

    @RequestMapping("/selectState")
    @ResponseBody
    public List<Map> selectState(){

        return stateService.selectState();
    }

}
