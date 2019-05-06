package com.spring.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Train {
    private Long id;

    private String name;

    private Date startDate;

    private Date endDate;

    private String startTime;

    private String endTime;

    private String startAddress;

    private String endAddress;

    private Integer type;
    
    private String typeMsg;

    private String sleepNum="--";
    
    private BigDecimal sleepPrice;
    
    private String seatNum="--";

    private BigDecimal seatPrice;
    
    private String standNum="--";

    private BigDecimal standPrice;
    
    private Integer valid;

    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
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

    public String getStartAddress() {
        return startAddress;
    }

    public void setStartAddress(String startAddress) {
        this.startAddress = startAddress == null ? null : startAddress.trim();
    }

    public String getEndAddress() {
        return endAddress;
    }

    public void setEndAddress(String endAddress) {
        this.endAddress = endAddress == null ? null : endAddress.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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

    
    public Integer getValid() {
		return valid;
	}

	public void setValid(Integer valid) {
		this.valid = valid;
	}
	

	public String getSleepNum() {
		return sleepNum;
	}

	public void setSleepNum(String sleepNum) {
		this.sleepNum = sleepNum;
	}

	public String getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}

	public String getStandNum() {
		return standNum;
	}

	public void setStandNum(String standNum) {
		this.standNum = standNum;
	}

	public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

	public String getTypeMsg() {
		return typeMsg;
	}

	public void setTypeMsg(String typeMsg) {
		this.typeMsg = typeMsg;
	}
    
    
}