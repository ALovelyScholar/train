package com.spring.dao;

import java.util.List;

import com.spring.entity.TrainCar;

public interface TrainCarMapper {
    int deleteByPrimaryKey(Long id);

    int insert(TrainCar record);

    int insertSelective(TrainCar record);

    TrainCar selectByPrimaryKey(Long id);
    
    List<TrainCar> selectByTrainId(Long trainId);

    int updateByPrimaryKeySelective(TrainCar record);

    int updateByPrimaryKey(TrainCar record);
}