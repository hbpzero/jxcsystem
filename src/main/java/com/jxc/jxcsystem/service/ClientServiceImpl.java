package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.pojo.Client;
import com.jxc.jxcsystem.dao.ClientDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ClientServiceImpl implements ClientService {
    @Resource
    private ClientDao clientDao;



    @Override
    public List<Client> selectClient() {
        return clientDao.selectClient();
    }

    @Override
    public void addClient(Client client) {
         clientDao.addClient(client);
    }

    @Override
    public void delClient(int id) {
         clientDao.delClient(id);
    }

    @Override
    public void updateClient(Client client) {
         clientDao.updateClient(client);
    }
}
