package com.sting.vo;

public class SNSstarVo {
	private int sid;
	private int uid;
	private String bankname;
	private String favoritem;
	private String SNSurl;
	private String wage;
	private String accountnumber;
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
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
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
	public String getWage() {
		return wage;
	}
	public void setWage(String wage) {
		this.wage = wage;
	}
	public String getAccountnumber() {
		return accountnumber;
	}
	public void setAccountnumber(String accountnumber) {
		this.accountnumber = accountnumber;
	}
}
