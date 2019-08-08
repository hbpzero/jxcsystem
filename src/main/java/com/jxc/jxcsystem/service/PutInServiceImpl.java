package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.dao.PutMapper;
import com.jxc.jxcsystem.pojo.Puttotal;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class PutInServiceImpl implements PutInService {
    @Resource
    private PutMapper putMapper;
    @Override
    public List<Puttotal> queryApply() {
        return putMapper.queryApply();
    }

    @Override
    public List<Map> queryDetail(String puttoNo) {
        return putMapper.queryDetail(puttoNo);
    }
}
