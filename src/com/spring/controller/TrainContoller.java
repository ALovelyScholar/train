package com.spring.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.spring.entity.Train;
import com.spring.resp.PageReq;
import com.spring.resp.ResponseDataBody;
import com.spring.resp.TrainReq;
import com.spring.service.TrainService;

@Controller
@RequestMapping("train")
public class TrainContoller extends BaseContoller{

	@Autowired
	private TrainService trainService;
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    dateFormat.setLenient(false);
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));//true:允许输入空值，false:不能为空值
	}
	
	@GetMapping("{url}")
	public String defaultUrl(@PathVariable("url") String url){
		logger.info("默认url="+url);
		return "train/"+url;
	}
	
	@RequestMapping("list")
	@ResponseBody
	public ResponseDataBody<List<Train>> list(PageReq page,String name,String nowDate,String start,String end){
		Map<String, Object> param=new HashMap<>();
		if(StringUtils.isNotEmpty(name)){
			param.put("name",name);
		}
		if(StringUtils.isNotEmpty(nowDate)){
			param.put("nowDate", nowDate);
		}
		if(StringUtils.isNotEmpty(start)){
			param.put("start", start);
		}
		if(StringUtils.isNotEmpty(end)){
			param.put("end", end);
		}
		PageInfo<Train> info=trainService.findByPage(page,param);
		return successData(info.getTotal(),info.getList());
	}
	
	
	@PostMapping("save")
	@ResponseBody
	public ResponseDataBody<Object> save(Train train,TrainReq req){
		 trainService.save(train,req);
		 return successData();
	}
	
	
	@PostMapping("delete")
	@ResponseBody
	public ResponseDataBody<Object> delete(String[] ids){
		 trainService.delete(ids);
		 return successData();
	}
	
}
