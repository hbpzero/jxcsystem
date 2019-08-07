package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.dao.PutPurchaseMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class PutPurchaseServiceImpl implements PutPurchaseService {
    @Resource
    PutPurchaseMapper putPurchaseMapper;

    public int selectCount() {
        return putPurchaseMapper.selectCount();
    }

    @Override
    public List<Map> selectPurchase() {
        return putPurchaseMapper.selectPurchase();
    }

    @Override
    public List<Map> selectPurdetail(String purtoNo) {
        return putPurchaseMapper.selectPurdetail(purtoNo);
    }

    public int insertPurchase(Map map) {
        int count1 = putPurchaseMapper.insertPurchase(map);
        List<Map> list = (List<Map>) map.get("goodsArray");
        int count2 = putPurchaseMapper.insertPurchaseList(list);
        if (count1 != 0 && count2 != 0) {
            return 1;
        } else {
            return 0;
        }
    }
}
