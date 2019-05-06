package com.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.spring.dao.RoleMapper;
import com.spring.dao.UserMapper;
import com.spring.entity.Role;
import com.spring.entity.User;
import com.spring.resp.PageReq;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RoleMapper roleMapper;
	
	
	public void saveUser(User user){
		if(user.getId()==null){
		userMapper.insert(user);
		}else{
			userMapper.updateByPrimaryKeySelective(user);
		}
	}
	
	public void updateUser(User user){
		userMapper.updateByPrimaryKey(user);
	}
	
	public User getUserObj(int id){
		return userMapper.selectByPrimaryKey(id);
	}
	
	 
	public User loginUser(String account,String psw){
		User user=new User();
		user.setAccount(account);
		user.setPsw(psw);
		return userMapper.selectByUser(user);
	}
	
	public PageInfo<User> findByPage(PageReq page,String name,String account){
		PageHelper.startPage(page.getPage(), page.getLimit(),true);
		Map<String, Object> param=new HashMap<>();
		if(StringUtils.isNotEmpty(name)){
			param.put("name",name);
		}
		if(StringUtils.isNotEmpty(account)){
			param.put("account", account);
		}
		List<User> list=userMapper.findByPage(param);
		list.forEach(u->{
			Role role=roleMapper.selectByPrimaryKey(u.getRoleId());
			u.setRoleName(role.getName());
		});
		PageInfo<User> pageList=new PageInfo<>(list);
		return pageList;
	}
	
	 
	
	public void deleteUser(String[] ids){
		if(ids!=null){
			for(String id:ids){
				userMapper.deleteByPrimaryKey(Integer.parseInt(id));
			}
		}
	}
	
	
 
	
	public boolean valiadeAccount(String account){
		Map<String, Object> param=new HashMap<>();
		param.put("account", account);
		User user=userMapper.findByUser(param);
		if(user==null){
			return false;
		}
		return true;
	}
}
