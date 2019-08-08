package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.dao.StateDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class StateServiceImpl implements StateService{
    @Resource
    private StateDao stateDao;

    @Override
    public List<Map> selectState() {
        return stateDao.selectState();
    }



}
