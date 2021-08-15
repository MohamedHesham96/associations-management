package com.bluesoft.associations.management.response;

public class ResponseModel {

    private boolean status;

    private String message;

    public ResponseModel() {
    }

    public ResponseModel(String message, boolean status) {
        this.status = status;
        this.message = message;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
