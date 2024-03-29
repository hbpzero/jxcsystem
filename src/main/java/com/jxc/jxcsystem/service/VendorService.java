package com.jxc.jxcsystem.service;



import com.jxc.jxcsystem.pojo.Vendor;

import java.util.List;

public interface VendorService {
    int addVenr(int vendorId, String vendorNo, String vendorName, String contact, String contactPhone, String vendorAddress, String vendorPostbox, String vendorBank, String vendorBankId);
    List<Vendor> select();
    int delete(int vendorId);
    int modify(int vendorId, String vendorNo, String vendorName, String contact, String contactPhone, String vendorAddress, String vendorPostbox, String vendorBank, String vendorBankId);
}
