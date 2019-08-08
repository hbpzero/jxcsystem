package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.dao.WHTotalDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class WHTotalServiceImpl implements WHTotalService {
    @Resource
    private WHTotalDao whTotalDao;



    @Override
    public List<Map> selectWHTotal() {
        return whTotalDao.selectWHTotal();
    }
}
