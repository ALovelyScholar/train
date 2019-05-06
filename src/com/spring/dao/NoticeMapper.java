package com.spring.dao;

import java.util.List;
import java.util.Map;

import com.spring.entity.Notice;

public interface NoticeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Notice record);

    int insertSelective(Notice record);

    Notice selectByPrimaryKey(Long id);
    
    List<Notice> findByPage(Map<String, Object> map);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKeyWithBLOBs(Notice record);

    int updateByPrimaryKey(Notice record);
}