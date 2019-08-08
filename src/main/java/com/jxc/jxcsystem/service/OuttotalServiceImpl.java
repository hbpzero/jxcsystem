package com.jxc.jxcsystem.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.dao.OuttotalDao;
import com.jxc.jxcsystem.pojo.Outtotal;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class OuttotalServiceImpl implements OuttotalService {

    @Resource
    private OuttotalDao outtotalDao;



    @Override
    public PageInfo selectOuttotal(PageInfo pageInfo) {
        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        PageInfo page=new PageInfo(outtotalDao.selectOuttotal());
        //查询所有订单之前

        return page;
    }

    @Override
    public void updeteOuttotal(Outtotal outtotal) {
        outtotalDao.updeteOuttotal(outtotal);
    }


}
