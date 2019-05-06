package com.spring.dao;

import java.util.List;
import java.util.Map;

import com.spring.entity.Message;

public interface MessageMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Long id);
    
    List<Message> findByPage(Map<String,Object> map);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);
}