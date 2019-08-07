package com.jxc.jxcsystem.service;

import java.util.List;
import java.util.Map;

public interface PutPurchaseService {
    List<Map> selectPurchase();
    List<Map> selectPurdetail(String purtoNo);
    int selectCount();

    int insertPurchase(Map map);


}
