package com.jxc.jxcsystem.service;


import com.jxc.jxcsystem.dao.VendorDao;
import com.jxc.jxcsystem.pojo.Vendor;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class VendorServiceImpl implements VendorService{
    @Resource
    private VendorDao vendorDao;
    @Override
    public int addVenr(int vendorId,String vendorNo,String vendorName,String contact,String contactPhone,String vendorAddress,String vendorPostbox,String vendorBank,String vendorBankId){
        return vendorDao.getAddVen(vendorId,vendorNo,vendorName,contact,contactPhone,vendorAddress,vendorPostbox,vendorBank,vendorBankId);
    }
    @Override
    public List<Vendor> select(){
        return vendorDao.selectVenById();
    }
    @Override
    public int delete(int vendorId){return vendorDao.deleteVenById(vendorId);}
    @Override
    public int modify(int vendorId,String vendorNo,String vendorName,String contact,String contactPhone,String vendorAddress,String vendorPostbox,String vendorBank,String vendorBankId){
        return vendorDao.updateVenById(vendorId,vendorNo,vendorName,contact,contactPhone,vendorAddress,vendorPostbox,vendorBank,vendorBankId);
    }

}
