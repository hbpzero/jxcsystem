package com.jxc.jxcsystem.controller;

import com.jxc.jxcsystem.pojo.Goods;
import com.jxc.jxcsystem.service.GoodsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Resource
    GoodsService goodsService;
    @RequestMapping("/main")
    public String Main(){
        return "back/listShow";
    }
    @RequestMapping("/buy")
    public String buy(){
        return "/back/BuyIn";
    }

    @RequestMapping("/selectGoods")
    @ResponseBody
    public List<Map> findGoods(){
       return  goodsService.selectGoods();
    }

    @RequestMapping("/addGoods")
    @ResponseBody
    public String addGoods(Goods goods){
      //  String message;
        System.out.println("新增商品 "+goods.getGoodsName());
        int count=goodsService.insertGoods(goods);
        if(count!=0){
            return "success";
        }else{return "false";}
    }
    @RequestMapping("/delGoods")
    @ResponseBody
    public String delGoods(Integer goodsId){
        String message;
        int count=goodsService.delGoods(goodsId);
    if(count!=0){
        System.out.println("删除"+goodsId);
        message="success";
        return message;
    }else{message="false";return message;}
}
     @RequestMapping("/updateGoods")
    @ResponseBody
    public String updateGoods(Goods goods){
        int count=goodsService.updateGoods(goods);
         if(count!=0){
             return "success";
         }else{return "false";}
     }
     @RequestMapping("findGoodsType")
    @ResponseBody
    public List<Map> findGoodsType(){
        return goodsService.findGoodsType();
     }


}
