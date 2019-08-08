package com.jxc.jxcsystem.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface MenuDao {
    //只取所有权限
    @Select("select * from permission ps\n" +
            "join  role_permission rp on ps.perId=rp.perId \n" +
            "join role r on r.roleId=rp.roleId\n" +
            "join user u on u.userRole=r.roleId\n" +
            "where userId=#{userId}")
  public List<Map> query(Integer id);
}
