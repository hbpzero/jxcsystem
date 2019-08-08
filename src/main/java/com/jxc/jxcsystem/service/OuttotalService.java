package com.jxc.jxcsystem.service;


import com.github.pagehelper.PageInfo;
import com.jxc.jxcsystem.pojo.Outtotal;

public interface OuttotalService {

    public PageInfo selectOuttotal(PageInfo pageInfo);

    public void updeteOuttotal(Outtotal outtotal);
}
