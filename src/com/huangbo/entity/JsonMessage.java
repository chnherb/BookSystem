package com.huangbo.entity;

public class JsonMessage {
	
	private boolean flag;
	
	private String message;
	
	public JsonMessage(boolean flag, String message){
		this.flag = flag;
		this.message= message;
	}
	
	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
