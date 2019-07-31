package com.jxc.jxcsystem.controller;

import com.jxc.jxcsystem.pojo.Client;
import com.jxc.jxcsystem.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class ClientController {
    @Autowired
    private ClientService clientService;

    @RequestMapping("/selectClient")
    @ResponseBody
    public List<Client> selectClient(){

        return clientService.selectClient();
    }

    @RequestMapping("/addClient")
    @ResponseBody
    public String  addClient(Client client){
        System.out.println(client.toString());
        clientService.addClient(client);
        return "添加成功";
    }




    @RequestMapping("/delClient")
    @ResponseBody
    public String  delClient(Integer id){

        clientService.delClient(id);
        return "删除成功";
    }

    @RequestMapping("/updateClient")
    @ResponseBody
    public String  updateClient(Client client){
        System.out.println(client.toString());
        clientService.updateClient(client);
        return "修改成功";
    }


}
