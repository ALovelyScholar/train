package com.spring.dao;

import java.util.List;
import java.util.Map;

import com.spring.entity.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);
    
    User selectByUser(User user);
    
    User findByUser(Map<String,Object> param);
    
    List<User> findByPage(Map<String, Object> map);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}