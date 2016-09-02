package com.sting.vo;

public class StarVo {
	private int sid;
	private int uid;
	private String management;
	private String favoritem;
	private String SNSurl;
	private String type;
	private String wage;
	private String name;
	public String getName(){
		return name;
	}
	public void setName(String name){
		this.name=name;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int vid) {
		this.uid = vid;
	}
	public String getManagement() {
		return management;
	}
	public void setManagement(String management) {
		this.management = management;
	}
	public String getFavoritem() {
		return favoritem;
	}
	public void setFavoritem(String favoritem) {
		this.favoritem = favoritem;
	}
	public String getSNSurl() {
		return SNSurl;
	}
	public void setSNSurl(String sNSurl) {
		SNSurl = sNSurl;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getWage() {
		return wage;
	}
	public void setWage(String wage) {
		this.wage = wage;
	}
}
