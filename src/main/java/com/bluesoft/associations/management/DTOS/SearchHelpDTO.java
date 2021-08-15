package com.bluesoft.associations.management.DTOS;

import java.time.LocalDateTime;

public class SearchHelpDTO {

    private String name;
    private String ssn;
    private String helpType;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSsn() {
        return ssn;
    }

    public void setSsn(String ssn) {
        this.ssn = ssn;
    }

    public String getHelpType() {
        return helpType;
    }

    public void setHelpType(String helpType) {
        this.helpType = helpType;
    }
}
