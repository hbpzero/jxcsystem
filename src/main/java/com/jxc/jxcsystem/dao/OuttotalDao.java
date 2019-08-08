package com.jxc.jxcsystem.dao;

import com.jxc.jxcsystem.pojo.Outtotal;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface OuttotalDao {

    @Select("select * from outtotal where outtoAuResult='待出库'")
    public List<Map> selectOuttotal();

    @Update("update outtotal set outtoTime=#{outtoTime},outtoMan=#{outtoMan},outtoShiUnit=#{outtoShiUnit},outtoAuResult=#{outtoAuResult} where outtoNo=#{outtoNo} ")
    public void updeteOuttotal(Outtotal outtotal);
}
