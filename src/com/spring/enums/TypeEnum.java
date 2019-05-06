package com.spring.enums;

public enum TypeEnum {

	DC(1,"动车"),
	GT(2,"高铁"),
	PK(3,"普快"),
	TK(4,"特快");
	
	private int index;
	
	private String msg;
	
	

	private TypeEnum(int index, String msg) {
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
		for(TypeEnum a:TypeEnum.values()){
			if(a.index==index){
				return a.getMsg();
			}
		}
		return null;
	}
	
	
}
