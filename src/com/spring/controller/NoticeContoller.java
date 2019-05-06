package com.spring.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.spring.entity.Notice;
import com.spring.resp.PageReq;
import com.spring.resp.ResponseDataBody;
import com.spring.service.NoticeService;

@Controller
@RequestMapping("notice")
public class NoticeContoller extends BaseContoller{

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("{url}")
	public String defaultUrl(@PathVariable("url") String url){
		logger.info("默认url="+url);
		return "notice/"+url;
	}
	
	@RequestMapping("list")
	@ResponseBody
	public ResponseDataBody<List<Notice>> list(PageReq page,String title){
		PageInfo<Notice> info=noticeService.findByPage(page, title);
		return successData(info.getTotal(),info.getList());
	}
	
	
	@PostMapping("save")
	@ResponseBody
	public ResponseDataBody<Object> save(Notice notice){
		 noticeService.save(notice);
		 return successData();
	}
	
	
	@PostMapping("delete")
	@ResponseBody
	public ResponseDataBody<Object> delete(String[] ids){
		noticeService.delete(ids);
		 return successData();
	}
	
}
