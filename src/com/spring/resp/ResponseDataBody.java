package com.spring.resp;

public class ResponseDataBody<T> {

	private int code;
	private String msg;
	private long count;
	private T data;
	
	
	
	
	public ResponseDataBody(int code, String msg, long count, T data) {
		super();
		this.code = code;
		this.msg = msg;
		this.count = count;
		this.data = data;
	}
	
	public ResponseDataBody(int code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public long getCount() {
		return count;
	}
	public void setCount(long count) {
		this.count = count;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	
 
	
}
