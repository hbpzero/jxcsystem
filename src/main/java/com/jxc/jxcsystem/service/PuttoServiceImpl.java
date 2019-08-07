package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.dao.PuttoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class PuttoServiceImpl implements  PuttoService {

    @Resource
    PuttoMapper puttoMapper;

    @Override
    public int selectCount() {
        return puttoMapper.selectCount();
    }

    @Override
    public int insertPutto(Map map) {
        int count1=puttoMapper.insertPuttotal(map);
        List<Map> list=(List<Map>)map.get("goodsArray");
        int count2=puttoMapper.insertPutdetail(list);
        if(count1!=0&&count2!=0){
            return 1;
        }else{
        return 0;}
    }

    @Override
    public List<Map> selectWarehouse() {
        return puttoMapper.selectWarehouse();
    }
}
