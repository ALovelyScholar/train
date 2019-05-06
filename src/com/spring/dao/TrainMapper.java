package com.spring.dao;

import java.util.List;
import java.util.Map;

import com.spring.entity.Train;

public interface TrainMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Train record);

    int insertSelective(Train record);

    Train selectByPrimaryKey(Long id);
    
    List<Train> findByPage(Map<String, Object> map);

    int updateByPrimaryKeySelective(Train record);

    int updateByPrimaryKey(Train record);

    List<Train> findAllTrain();
}