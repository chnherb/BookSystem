package com.huangbo.entity;

public class BarPer {
	private int sum;
	private Double per1;
	private Double per2;
	private Double per3;
	private Double per4;
	private Double per5;
	private int bar1;
	private int bar2;
	private int bar3;
	private int bar4;
	private int bar5;
	
	public BarPer(){
		sum = 150;
	}
	public int getBar1() {
		return bar1;
	}
	public void setBar1(int bar1) {
		this.bar1 = bar1;
	}
	public int getBar2() {
		return bar2;
	}
	public void setBar2(int bar2) {
		this.bar2 = bar2;
	}
	public int getBar3() {
		return bar3;
	}
	public void setBar3(int bar3) {
		this.bar3 = bar3;
	}
	public int getBar4() {
		return bar4;
	}
	public void setBar4(int bar4) {
		this.bar4 = bar4;
	}
	public int getBar5() {
		return bar5;
	}
	public void setBar5(int bar5) {
		this.bar5 = bar5;
	}
	public Double getPer1() {
		return per1;
	}
	public void setPer1(Double per1) {
		this.per1 = per1;
		this.bar1 = (int)(this.per1 / 100 * this.sum);
	}
	public Double getPer2() {
		return per2;
	}
	public void setPer2(Double per2) {
		this.per2 = per2;
		this.bar2 = (int)(this.per2 / 100 * this.sum);
	}
	public Double getPer3() {
		return per3;
	}
	public void setPer3(Double per3) {
		this.per3 = per3;
		this.bar3 = (int)(this.per3 / 100 * this.sum);
	}
	public Double getPer4() {
		return per4;
	}
	public void setPer4(Double per4) {
		this.per4 = per4;
		this.bar4 = (int)(this.per4 / 100 * this.sum);
	}
	public Double getPer5() {
		return per5;
	}
	public void setPer5(Double per5) {
		this.per5 = per5;
		this.bar5 = (int)(this.per5 / 100 * this.sum);
	}

	
	
}
