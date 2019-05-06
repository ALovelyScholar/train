package com.spring.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.spring.constant.Constants;
import com.spring.entity.Message;
import com.spring.entity.User;
import com.spring.resp.PageReq;
import com.spring.resp.ResponseDataBody;
import com.spring.service.MessageService;

@Controller
@RequestMapping("msg")
public class MessageContoller extends BaseContoller{

	@Autowired
	private MessageService messageService;
	
	@GetMapping("{url}")
	public String defaultUrl(@PathVariable("url") String url){
		logger.info("默认url="+url);
		return "msg/"+url;
	}
	
	@GetMapping("backMsg")
	public String backMsg(Integer msgId,HttpServletRequest request){
		request.setAttribute("msgId", msgId);
		return "msg/backMsg";
	}
	
	@RequestMapping("list")
	@ResponseBody
	public ResponseDataBody<List<Message>> list(PageReq page,HttpSession session){
		User user=(User) session.getAttribute(Constants.loginUser);
		PageInfo<Message> info=messageService.findByPage(page, user);
		return successData(info.getTotal(),info.getList());
	}
	
	
	@PostMapping("save")
	@ResponseBody
	public ResponseDataBody<Object> save(Message msg,HttpSession session){
		User user=(User) session.getAttribute(Constants.loginUser);
		msg.setSendId(user.getId().longValue());
		msg.setState(0);
		messageService.save(msg);
		return successData();
	}
	
	
	@PostMapping("saveBack")
	@ResponseBody
	public ResponseDataBody<Object> saveBack(Message msg,HttpSession session){
		User user=(User) session.getAttribute(Constants.loginUser);
		messageService.saveBack(msg,user);
		return successData();
	}
	
	@PostMapping("read")
	@ResponseBody
	public ResponseDataBody<Message> read(Long id){
		Message msg=messageService.getMessageObj(id);
		return successData(msg);
	}
	
	
	
	@PostMapping("delete")
	@ResponseBody
	public ResponseDataBody<Object> delete(String[] ids){
		messageService.delete(ids);
		 return successData();
	}
	
}
