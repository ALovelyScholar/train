package com.spring.entity;

import java.math.BigDecimal;

public class TrainStation {
    private Long id;

    private Long trainId;

    private String address;

    private Integer sort;

    private String startTime;

    private String endTime;
    
    private BigDecimal sleepPrice;
    
    private BigDecimal seatPrice;
    
    private BigDecimal standPrice;

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime == null ? null : startTime.trim();
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime == null ? null : endTime.trim();
    }

	public BigDecimal getSleepPrice() {
		return sleepPrice;
	}

	public void setSleepPrice(BigDecimal sleepPrice) {
		this.sleepPrice = sleepPrice;
	}

	public BigDecimal getSeatPrice() {
		return seatPrice;
	}

	public void setSeatPrice(BigDecimal seatPrice) {
		this.seatPrice = seatPrice;
	}

	public BigDecimal getStandPrice() {
		return standPrice;
	}

	public void setStandPrice(BigDecimal standPrice) {
		this.standPrice = standPrice;
	}
    
    
}