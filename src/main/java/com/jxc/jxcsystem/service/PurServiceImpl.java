package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.dao.PurMapper;
import com.jxc.jxcsystem.pojo.PurDetail;
import com.jxc.jxcsystem.pojo.PurTotal;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class PurServiceImpl implements PurService{
    @Resource
    private PurMapper purMapper;
    @Override
    public boolean addNewPur(Map map) {
        int result1=purMapper.addNewPurtotal(map);
        List<Map> list=(List<Map>)map.get("goods");
        int result2=purMapper.addNewPur(list);
        if (result1>0 && result2>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public List<PurTotal> queryApply() {
        return purMapper.queryApply();
    }

    @Override
    public List<Map> queryDetail(String purtoNo) {
        return purMapper.queryDetail(purtoNo);
    }

    @Override
    public int apply(String result, String purtoNo) {
        return purMapper.apply(result,purtoNo);
    }

    @Override
    public List<PurTotal> queryAll() {
        return  purMapper.queryAll();
    }
}
