package com.jxc.jxcsystem.dao;

import com.jxc.jxcsystem.pojo.PurDetail;
import com.jxc.jxcsystem.pojo.PurTotal;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface PurMapper {
    public int addNewPurtotal(Map map);
    public int addNewPur(List<Map> list);
    public List<PurTotal> queryAll();
    public List<PurTotal> queryApply();
    public List<Map>queryDetail(String purtoNo);
    public int apply(@Param("result") String result,@Param("purtoNo") String purtoNo );

}
