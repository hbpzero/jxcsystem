package com.jxc.jxcsystem.service;

import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.pojo.Selltotal;


public interface SelltotalService {
    public PageInfo selectSellTal(PageInfo pageInfo);

    public void updeteSellTal(Selltotal selltotal);

    public void updateOutSellState(String  selltoNo);
}
