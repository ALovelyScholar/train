package com.spring.entity;

public class TrainCar {
    private Long id;

    private Long trainId;

    private Integer carNo;

    private Integer type;

    private Integer seatNum;

    private Integer noMun;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTrainId() {
        return trainId;
    }

    public void setTrainId(Long trainId) {
        this.trainId = trainId;
    }

    public Integer getCarNo() {
        return carNo;
    }

    public void setCarNo(Integer carNo) {
        this.carNo = carNo;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getSeatNum() {
        return seatNum;
    }

    public void setSeatNum(Integer seatNum) {
        this.seatNum = seatNum;
    }

    public Integer getNoMun() {
        return noMun;
    }

    public void setNoMun(Integer noMun) {
        this.noMun = noMun;
    }
}