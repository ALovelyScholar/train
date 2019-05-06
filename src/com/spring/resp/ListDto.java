package com.spring.resp;

import java.util.List;

public class ListDto<T> {

	private long count;
	
	private List<T> data;

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}
	
	
}
