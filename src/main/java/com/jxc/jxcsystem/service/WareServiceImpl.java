package com.jxc.jxcsystem.service;

import com.jxc.jxcsystem.dao.PutMapper;
import com.jxc.jxcsystem.dao.WareMapper;
import com.jxc.jxcsystem.pojo.WareHouse;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class WareServiceImpl  implements WareService {
    @Resource
    private WareMapper wareMapper;
    @Resource
    private PutMapper putMapper;
    @Override
    public List<WareHouse> queryAll() {
        return wareMapper.queryAll();
    }

    @Override
    public Boolean applyToWare(Map map) {//入库操作并修改采购表的转台
        ArrayList putNo=(ArrayList) map.get("puttoNoes");
        List<Map> goods=(List<Map>) map.get("goodsputin");
        System.out.println(putNo);
        System.out.println(goods);
        int flag1=0;
        int flag2=0;
        int flag3=0;
        for (int i=0;i<goods.size();i++){
            Map map1=goods.get(i);
            int wareId=wareMapper.findWareIdByAddress(map1.get("wareAddress").toString());
            map1.put("warehouseId",wareId);

            int flag=wareMapper.judge(map1.get("goodsNo").toString(),(Integer) map1.get("warehouseId"));
            if (flag==1){
                flag1=wareMapper.updateGood(map1);
            }else if (flag==0){
                flag1=wareMapper.createNewGood(map1);
            }
            flag3=putMapper.setDetail(map1.get("puttoNo").toString(),map1.get("goodsNo").toString(),Integer.parseInt( map1.get("wGoodsNum").toString()),map1.get("wareAddress").toString());
            if (flag1>0 && flag3>0){
                continue;
            }
            else
                break;
        }
        for (int i=0;i<putNo.size();i++){
            flag2=putMapper.complete(putNo.get(i).toString());
            if (flag2>0)
                continue;
            else
                break;
        }
        if (flag1==1 && flag2==1 && flag3==1){
            return true;
        }else
            return false;
    }
}
