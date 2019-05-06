package com.spring.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.constant.Constants;
import com.spring.entity.Menu;
import com.spring.entity.User;
import com.spring.resp.ResponseDataBody;
import com.spring.service.RoleService;

@RestController
@RequestMapping("role")
public class RoleContoller extends BaseContoller{

	@Autowired
	private RoleService roleService;
	
	@PostMapping("menu")
	public ResponseDataBody<List<Menu>> list(HttpSession session){
		User user=(User) session.getAttribute(Constants.loginUser);
		List<Menu> list=roleService.selectMenuByRole(user.getRoleId());
		return successData(list);
	}
	
	
}
