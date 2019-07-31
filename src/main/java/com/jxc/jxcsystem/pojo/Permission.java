package com.jxc.jxcsystem.pojo;

public class Permission {
    private Integer perId;
    private String perName;
    private String perDepict;
    private String perType;
    private String perUrl;

    public String getPerUrl() {

        return perUrl;
    }

    public void setPerUrl(String perUrl) {
        this.perUrl = perUrl;
    }

    public Integer getPerId() {
        return perId;
    }

    public void setPerId(Integer perId) {
        this.perId = perId;
    }

    public String getPerName() {
        return perName;
    }

    public void setPerName(String perName) {
        this.perName = perName;
    }

    public String getPerDepict() {
        return perDepict;
    }

    public void setPerDepict(String perDepict) {
        this.perDepict = perDepict;
    }

    public String getPerType() {
        return perType;
    }

    public void setPerType(String perType) {
        this.perType = perType;
    }
}
