package com.jxc.jxcsystem.dao;

import com.jxc.jxcsystem.pojo.Client;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ClientDao {

    @Select("select * from client")
    public List<Client> selectClient();


    @Insert("insert into client values(#{cliId},#{cliNo},#{cliName},#{cliMan},#{cliPhone},#{cliAddress},#{cliPostbox},#{cliBank},#{cliBankId})")
    public void addClient(Client client);

    @Delete("delete from client where cliId=#{id}")
    public void delClient(int id);

    @Update("update client set  cliNo=#{cliNo},cliName=#{cliName},\n" +
            "cliMan=#{cliMan},cliPhone=#{cliPhone},cliAddress=#{cliAddress},\n" +
            "cliPostbox=#{cliPostbox},cliBank=#{cliBank},cliBankId=#{cliBankId} where cliId=#{cliId}")
    public void updateClient(Client client);
}
