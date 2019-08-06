package com.jxc.jxcsystem.dao;


import com.jxc.jxcsystem.pojo.Vendor;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface VendorDao {
    int getAddVen(@Param("vendorId") int vendorId, @Param("vendorNo") String vendorNo, @Param("vendorName") String vendorName, @Param("contact") String contact, @Param("contactPhone") int contactPhone, @Param("vendorAddress") String vendorAddress, @Param("vendorPostbox") String vendorPostbox, @Param("vendorBank") String vendorBank, @Param("vendorBankId") int vendorBankId);
    List<Vendor> selectVenById();
    int deleteVenById(@Param("vendorId") int vendorId);
    int updateVenById(@Param("vendorId") int vendorId, @Param("vendorNo") String vendorNo, @Param("vendorName") String vendorName, @Param("contact") String contact, @Param("contactPhone") int contactPhone, @Param("vendorAddress") String vendorAddress, @Param("vendorPostbox") String vendorPostbox, @Param("vendorBank") String vendorBank, @Param("vendorBankId") int vendorBankId);
}
