package com.jxc.jxcsystem.controller;


import com.jxc.jxcsystem.pojo.Vendor;
import com.jxc.jxcsystem.service.VendorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;


@Controller
public class VendorController {
    @Resource
    private VendorService vendorService;
    @RequestMapping("add")
    public ModelAndView add(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/back/adder");
        return mav;
    }
    @RequestMapping("/addVendor")
    @ResponseBody
    public int addVendor(int vendorId,String vendorNo,String vendorName,String contact,String contactPhone,String vendorAddress,String vendorPostbox,String vendorBank,String vendorBankId){
        System.out.println(vendorId+"/"+vendorNo+"/"+vendorName+"/"+contact+"/"+contactPhone+"/"+vendorAddress+"/"+vendorPostbox+"/"+vendorBank+"/"+vendorBankId);
       return  vendorService.addVenr(vendorId,vendorNo,vendorName,contact,contactPhone,vendorAddress,vendorPostbox,vendorBank,vendorBankId);
    }
    @RequestMapping("ma")
    public String ma(){

        return "/back/select";
    }
    @RequestMapping("/query")
    @ResponseBody
    public List<Vendor> query(){

       return vendorService.select();
    }
    @RequestMapping("/delstu")
    @ResponseBody
    public int delstu(int vendorId) {

        return vendorService.delete(vendorId);
    }
    @RequestMapping("/updates")
    @ResponseBody
    public int updates(int vendorId,String vendorNo,String vendorName,String contact,String contactPhone,String vendorAddress,String vendorPostbox,String vendorBank,String vendorBankId) {
        return vendorService.modify(vendorId,vendorNo,vendorName,contact,contactPhone,vendorAddress,vendorPostbox,vendorBank,vendorBankId);
    }
}
