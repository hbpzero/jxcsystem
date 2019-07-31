package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.pojo.Client;

import java.util.List;

public interface ClientService {

    public List<Client> selectClient();

    public void addClient(Client client);

    public void delClient(int id);

    public void updateClient(Client client);

}
