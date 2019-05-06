package com.spring.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Message {
    private Long id;

    private Long userId;

    private String message;

    private Long sendId;
    
    private String sendName;

    private Integer state;
    
    private String stateMsg;

    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message == null ? null : message.trim();
    }

    public String getSendName() {
        return sendName;
    }

    public void setSendName(String sendName) {
        this.sendName = sendName == null ? null : sendName.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getCreateTime() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(createTime);
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

	public Long getSendId() {
		return sendId;
	}

	public void setSendId(Long sendId) {
		this.sendId = sendId;
	}

	public String getStateMsg() {
		return stateMsg;
	}

	public void setStateMsg(String stateMsg) {
		this.stateMsg = stateMsg;
	}
    
    
}