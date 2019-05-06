package com.spring.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.spring.entity.Role;
import com.spring.entity.User;
import com.spring.resp.PageReq;
import com.spring.resp.ResponseDataBody;
import com.spring.service.RoleService;
import com.spring.service.UserService;

@Controller
@RequestMapping("user")
public class UserContoller extends BaseContoller{

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	
	@GetMapping("{url}")
	public String defaultUrl(@PathVariable("url") String url){
		logger.info("默认url="+url);
		return "user/"+url;
	}
	
	@GetMapping("init")
	public String initAdd(HttpServletRequest request){
		List<Role> list=roleService.getRolePromission();
		request.setAttribute("list", list);
		return "user/add";
	}
	
	
	@GetMapping("detail")
	public String detail(Integer id,HttpServletRequest request){
		User user=userService.getUserObj(id);
		List<Role> list=roleService.getRolePromission();
		request.setAttribute("user", user);
		request.setAttribute("list", list);
		return "user/update";
	}

	@PostMapping("save")
	@ResponseBody
	public ResponseDataBody<Object> update(User user){
		 userService.saveUser(user);
		 return successData();
	}
	
	@RequestMapping("list")
	@ResponseBody
	public ResponseDataBody<List<User>> list(PageReq page,String name,String account){
		PageInfo<User> info=userService.findByPage(page, name, account);
		return successData(info.getTotal(),info.getList());
	}
	
	
	@PostMapping("delete")
	@ResponseBody
	public ResponseDataBody<Object> delete(String[] ids){
		 userService.deleteUser(ids);
		 return successData();
	}
	
}
