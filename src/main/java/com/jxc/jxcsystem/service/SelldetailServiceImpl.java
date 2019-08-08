package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.dao.SelldetailDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class SelldetailServiceImpl implements SelldetailService{
    @Resource
    private SelldetailDao selldetailDao;

    @Override
    public List<Map> selectSell() {
        return selldetailDao.selectSell();
    }
}
