package com.bluesoft.associations.management.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author yasserhesham
 *
 */
@ResponseStatus(HttpStatus.NOT_ACCEPTABLE)
public class BusinessException extends Exception{

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    protected String message;

    protected String code;

    protected Exception rootException;

    public BusinessException(){

    }
    public BusinessException(String message){
        this.message = message;
    }
    public BusinessException(String message, String code){
        this.message = message;
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message=message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Exception getRootException() {
        return rootException;
    }

    public void setRootException(Exception rootException) {
        this.rootException = rootException;
    }

}
