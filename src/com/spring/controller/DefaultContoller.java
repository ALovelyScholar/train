package com.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class DefaultContoller {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("index")
	public String index(){
		return "index";
	}

	@GetMapping("main")
	public String main(){
		return "main";
	}
	
	@GetMapping("product")
	public String product(){
		return "front/index";
	}
}
