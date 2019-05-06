package com.spring.enums;

public enum TrainTypeEnum {

	WP(1,"卧铺"),
	ZP(2,"坐票"),
	WZ(3,"无座");
	
	private int index;
	
	private String msg;
	
	

	private TrainTypeEnum(int index, String msg) {
		this.index = index;
		this.msg = msg;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public static String getMsgIndex(int index){
		for(TrainTypeEnum a:TrainTypeEnum.values()){
			if(a.index==index){
				return a.getMsg();
			}
		}
		return null;
	}
	
	
}
