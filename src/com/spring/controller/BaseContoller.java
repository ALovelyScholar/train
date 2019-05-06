package com.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.spring.resp.ResponseDataBody;
import com.spring.util.BusinessCodes;

@Controller
public class BaseContoller {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	
	public <T> ResponseDataBody<T> successData(Long count,T data){
		return new ResponseDataBody<T>(BusinessCodes.SUCCESS_CODE, BusinessCodes.SUCCESS_MSG,count, data);
	}
	
	
	public <T> ResponseDataBody<T> successData(T data){
		return new ResponseDataBody<T>(BusinessCodes.SUCCESS_CODE, BusinessCodes.SUCCESS_MSG,0l, data);
	}
	public ResponseDataBody<Object> successData(){
		return new ResponseDataBody<Object>(BusinessCodes.SUCCESS_CODE, BusinessCodes.SUCCESS_MSG);
	}
	
	public ResponseDataBody<Object> errorData(String msg){
		return new ResponseDataBody<Object>(BusinessCodes.ERROR_CODE,msg);
	}
}
