package com.huangbo.entity;

public class BookState {
	private String callnum;
	private String barcode;
	private String readingroom;
	private String state;
	public String getCallnum() {
		return callnum;
	}
	public void setCallnum(String callnum) {
		this.callnum = callnum;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public String getReadingroom() {
		return readingroom;
	}
	public void setReadingroom(String readingroom) {
		this.readingroom = readingroom;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public String toString(){
		StringBuffer sb = new StringBuffer();
		sb.append("[callnum:" + this.callnum + "\n");
		sb.append("barcode:" + this.barcode + "\n");
		sb.append("readingroom:" + this.readingroom + "\n");
		sb.append("state:" + this.state + "]\n");
		return sb.toString();
	}
	
}
