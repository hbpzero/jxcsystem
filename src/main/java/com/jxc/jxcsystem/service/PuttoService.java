package com.jxc.jxcsystem.service;

import java.util.List;
import java.util.Map;

public interface PuttoService {
    int selectCount();
    int insertPutto(Map map);
    List<Map> selectWarehouse();
}
