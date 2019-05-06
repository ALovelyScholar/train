package com.spring.dao;

import java.util.List;
import java.util.Map;

import com.spring.entity.TrainOrder;

public interface TrainOrderMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TrainOrder record);

    int insertSelective(TrainOrder record);

    TrainOrder selectByPrimaryKey(Long id);
    
    List<TrainOrder> findOrderByMap(Map<String,Object> map);
    
    List<TrainOrder> findByPage(Map<String, Object> map);

    int updateByPrimaryKeySelective(TrainOrder record);

    int updateByPrimaryKey(TrainOrder record);
}