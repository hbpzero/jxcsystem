package com.jxc.jxcsystem.dao;

import com.jxc.jxcsystem.pojo.PurTotal;
import com.jxc.jxcsystem.pojo.User;
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
    public List<PurTotal> queryAll(User user);
    public PurTotal queryBypurNo(String purtoNo);
    public List<PurTotal> queryApply(@Param("point") int point);
    public List<Map>queryDetail(String purtoNo);
    public int apply(@Param("result") String result, @Param("purtoNo") String purtoNo);
    public List<PurTotal> search(Map map);
    public float getTotalPriceThisMonth();
    public List<Map> getPriceAyear();

}
