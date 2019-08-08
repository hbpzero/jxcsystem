package com.jxc.jxcsystem.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.dao.PurMapper;
import com.jxc.jxcsystem.dao.PutMapper;
import com.jxc.jxcsystem.pojo.PurTotal;
import com.jxc.jxcsystem.pojo.Puttotal;
import com.jxc.jxcsystem.pojo.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class PurServiceImpl implements PurService {
    @Resource
    private PurMapper purMapper;
    @Resource
    private PutMapper putMapper;
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
    public PageInfo queryApply(int point,PageInfo pageInfo) {
        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        PageInfo page=new PageInfo(purMapper.queryApply(point));
        return page;
    }

    @Override
    public List<Map> queryDetail(String purtoNo) {
        return purMapper.queryDetail(purtoNo);
    }

    @Override
    public int apply(String result, String purtoNo) {
        if (result.equals("采购完成")){
            PurTotal purTotal=purMapper.queryBypurNo(purtoNo);
            Puttotal puttotal=new Puttotal();
            puttotal.setPuttoNo(purTotal.getPurtoNo());
            puttotal.setPuttoMan(purTotal.getPurtoAppMan());
            List<Map> maps=purMapper.queryDetail(purtoNo);
            int flag1=putMapper.createPut(puttotal);
            int flag2=purMapper.apply(result,purtoNo);
            int flag3=putMapper.createDetail(maps);
            if (flag1>0 && flag2>0  && flag3>0){
                return 1;
            }
            else
                return 0;
        }
        else{
            return purMapper.apply(result,purtoNo);
        }

    }

    @Override
    public PageInfo queryAll(PageInfo pageInfo,User user) {
        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        PageInfo page=new PageInfo(purMapper.queryAll(user));
        return  page;
    }

    @Override
    public PageInfo search(Map map) {
        PageHelper.startPage(Integer.parseInt(map.get("pageNum").toString()) ,Integer.parseInt(map.get("pageSize").toString()));
        PageInfo page=new PageInfo(purMapper.search(map));
        return page;
    }

    @Override
    public float getTotalPriceThisMonth() {
        return purMapper.getTotalPriceThisMonth();
    }

    @Override
    public List<Map> getPriceAyear() {
        return purMapper.getPriceAyear();
    }
}
