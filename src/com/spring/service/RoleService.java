package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.MenuMapper;
import com.spring.dao.RoleMapper;
import com.spring.entity.Menu;
import com.spring.entity.Role;

@Service
public class RoleService {

	@Autowired
	private RoleMapper roleMapper;
	
	@Autowired
	private MenuMapper menuMapper;
	
	
	public List<Role> getRolePromission(){
		return roleMapper.findRole();
	}
	
	
	public List<Menu> selectMenuByRole(Integer roleId){
		return menuMapper.selectMenuByRole(roleId);
	}
}
