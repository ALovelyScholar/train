package com.spring.entity;

import java.math.BigDecimal;
import java.util.Date;

public class TrainOrder {
    private Long id;

    private Long trianId;
    
    private String name;
    
    private Long userId;

    private String startAddress;

    private Long startStationId;

    private String endAddress;

    private Long endStationId;

    private Integer trianCarId;
    
    private Integer carNo;

    private Integer seatNum;

    private Date trainDate;
    
    private String trainDateMsg;

    private String trainTime;

    private BigDecimal price;
    
    private Integer trainType;
    
    private String trainTypeMsg;
    
    private Integer state;
    
    private String stateMsg;
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTrianId() {
        return trianId;
    }

    public void setTrianId(Long trianId) {
        this.trianId = trianId;
    }

    public String getStartAddress() {
        return startAddress;
    }

    public void setStartAddress(String startAddress) {
        this.startAddress = startAddress == null ? null : startAddress.trim();
    }

    public Long getStartStationId() {
        return startStationId;
    }

    public void setStartStationId(Long startStationId) {
        this.startStationId = startStationId;
    }

    public String getEndAddress() {
        return endAddress;
    }

    public void setEndAddress(String endAddress) {
        this.endAddress = endAddress == null ? null : endAddress.trim();
    }

    public Long getEndStationId() {
        return endStationId;
    }

    public void setEndStationId(Long endStationId) {
        this.endStationId = endStationId;
    }

    public Integer getTrianCarId() {
        return trianCarId;
    }

    public void setTrianCarId(Integer trianCarId) {
        this.trianCarId = trianCarId;
    }

    public Integer getSeatNum() {
        return seatNum;
    }

    public void setSeatNum(Integer seatNum) {
        this.seatNum = seatNum;
    }

    public Date getTrainDate() {
        return trainDate;
    }

    public void setTrainDate(Date trainDate) {
        this.trainDate = trainDate;
    }

    public String getTrainTime() {
        return trainTime;
    }

    public void setTrainTime(String trainTime) {
        this.trainTime = trainTime == null ? null : trainTime.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Integer getCarNo() {
		return carNo;
	}

	public void setCarNo(Integer carNo) {
		this.carNo = carNo;
	}

	public Integer getTrainType() {
		return trainType;
	}

	public void setTrainType(Integer trainType) {
		this.trainType = trainType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTrainTypeMsg() {
		return trainTypeMsg;
	}

	public void setTrainTypeMsg(String trainTypeMsg) {
		this.trainTypeMsg = trainTypeMsg;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getStateMsg() {
		return stateMsg;
	}

	public void setStateMsg(String stateMsg) {
		this.stateMsg = stateMsg;
	}

	public String getTrainDateMsg() {
		return trainDateMsg;
	}

	public void setTrainDateMsg(String trainDateMsg) {
		this.trainDateMsg = trainDateMsg;
	}
    
    
}