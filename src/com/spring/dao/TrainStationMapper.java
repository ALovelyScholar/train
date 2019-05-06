package com.spring.dao;

import java.util.List;
import java.util.Map;

import com.spring.entity.TrainStation;

public interface TrainStationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TrainStation record);

    int insertSelective(TrainStation record);

    TrainStation selectByPrimaryKey(Long id);
    
    List<TrainStation> findStationByMap(Map<String, Object> map);

    int updateByPrimaryKeySelective(TrainStation record);

    int updateByPrimaryKey(TrainStation record);
}