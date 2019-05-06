package com.spring.resp;

public class OrderReq {

	private Long orderId;
	
	private Long trainId;
	
	private String start;
	
	private String end;
	
	private String nowDate;
	
	private Integer trainType;

	public Long getTrainId() {
		return trainId;
	}

	public void setTrainId(Long trainId) {
		this.trainId = trainId;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getNowDate() {
		return nowDate;
	}

	public void setNowDate(String nowDate) {
		this.nowDate = nowDate;
	}

	public Integer getTrainType() {
		return trainType;
	}

	public void setTrainType(Integer trainType) {
		this.trainType = trainType;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	
	
}
