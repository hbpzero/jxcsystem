package com.jxc.jxcsystem.pojo;

public class Vendor {
    private int vendorId;
    private String vendorNo;
    private String vendorName;
    private String contact;
    private int contactPhone;
    private String vendorAddress;
    private String vendorPostbox;
    private String vendorBank;
    private int vendorBankId;

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public String getVendorNo() {
        return vendorNo;
    }

    public void setVendorNo(String vendorNo) {
        this.vendorNo = vendorNo;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public int getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(int contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getVendorAddress() {
        return vendorAddress;
    }

    public void setVendorAddress(String vendorAddress) {
        this.vendorAddress = vendorAddress;
    }

    public String getVendorPostbox() {
        return vendorPostbox;
    }

    public void setVendorPostbox(String vendorPostbox) {
        this.vendorPostbox = vendorPostbox;
    }

    public String getVendorBank() {
        return vendorBank;
    }

    public void setVendorBank(String vendorBank) {
        this.vendorBank = vendorBank;
    }

    public int getVendorBankId() {
        return vendorBankId;
    }

    public void setVendorBankId(int vendorBankId) {
        this.vendorBankId = vendorBankId;
    }
    public Vendor(){

    }
    public Vendor(int vendorId, String vendorNo, String vendorName, String contact, int contactPhone, String vendorAddress, String vendorPostbox, String vendorBank, int vendorBankId){
      this.vendorId=vendorId;
      this.vendorNo=vendorNo;
      this.vendorName=vendorName;
      this.contact=contact;
      this.contactPhone=contactPhone;
      this.vendorAddress=vendorAddress;
      this.vendorPostbox=vendorPostbox;
      this.vendorBank=vendorBank;
      this.vendorBankId=vendorBankId;
    }
    @Override
    public String toString() {
        return "Vendor{" +
                "vendorId=" + vendorId +
                ", vendorNo='" + vendorNo + '\'' +
                ", vendorName='" + vendorName + '\'' +
                ", contact='" + contact + '\'' +
                ", contactPhone=" + contactPhone +
                ", vendorAddress='" + vendorAddress + '\'' +
                ", vendorPostbox='" + vendorPostbox + '\'' +
                ", vendorBank='" + vendorBank + '\'' +
                ", vendorBankId=" + vendorBankId +
                '}';
    }
}
