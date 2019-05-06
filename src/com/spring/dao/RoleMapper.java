package com.spring.dao;

import java.util.List;

import com.spring.entity.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);
    
    List<Role> findRole();

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
}