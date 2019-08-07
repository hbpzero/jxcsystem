package com.jxc.jxcsystem.controller;

import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.pojo.Goods;
import com.jxc.jxcsystem.pojo.User;
import com.jxc.jxcsystem.service.GoodsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Resource
    GoodsService goodsService;

    @RequestMapping("/main")
    public String Main() {
        return "/back/listShow";
    }

    @RequestMapping("/buy")
    public String buy() {
        return "/back/BuyIn";
    }

    //查商品in其他入库
    @RequestMapping("/Sgoods")
    @ResponseBody
    public List<Map> selectGoods() {
        return goodsService.getGoods();
    }

    @RequestMapping("/selectGoods")
    @ResponseBody
    public PageInfo findGoods(HttpSession session, PageInfo pageInfo) {

        return goodsService.selectGoods(pageInfo);
    }

    @RequestMapping("/addGoods")
    @ResponseBody
    public String addGoods(Goods goods) {
        //  String message;
        System.out.println("新增商品 " + goods.getGoodsName());
        int count = goodsService.insertGoods(goods);
        if (count != 0) {
            return "success";
        } else {
            return "false";
        }
    }

    @RequestMapping("/delGoods")
    @ResponseBody
    public String delGoods(Integer goodsId) {
        String message;
        int count = goodsService.delGoods(goodsId);
        if (count != 0) {
            System.out.println("删除" + goodsId);
            message = "success";
            return message;
        } else {
            message = "false";
            return message;
        }
    }

    @RequestMapping("/updateGoods")
    @ResponseBody
    public String updateGoods(Goods goods) {
        int count = goodsService.updateGoods(goods);
        if (count != 0) {
            return "success";
        } else {
            return "false";
        }
    }

    @RequestMapping("/findGoodsType")
    @ResponseBody
    public List<Map> findGoodsType() {
        return goodsService.findGoodsType();
    }

    @RequestMapping("/goodsNo")
    @ResponseBody
    public String selectGoodsNo(String goodsNo) {
        int count = goodsService.selectGoodsNo(goodsNo);
        String message;
        if (count == 0) {
            message = "success";
        } else {
            message = "false";
        }
        return message;
    }

    @RequestMapping("/selectByCheck")
    @ResponseBody
    public PageInfo selectByCheck(@RequestParam(value = "goodsName", required = false) String goodsName, @RequestParam(value = "goodsTypeId", required = false) Integer goodsTypeId, PageInfo pageInfo) {
        return goodsService.selectByCheck(goodsName, goodsTypeId, pageInfo);

    }
}
