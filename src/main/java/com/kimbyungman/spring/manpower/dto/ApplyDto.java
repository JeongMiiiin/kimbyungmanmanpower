package com.kimbyungman.spring.manpower.dto;

import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Component;

//지원내역 Dto
@Component
public class ApplyDto extends PageDto {
	private int sn;
	private int memberSn;
	private int workSn;
	private int status;
	private String title;
	private String memberName;
	private int payment;
	private String appealContents;
	private String createDateStr;
	public int getSn() {
		return sn;
	}

	public void setSn(int sn) {
		this.sn = sn;
	}
	
	public int getMemberSn() {
		return memberSn;
	}

	public void setMemberSn(int memberSn) {
		this.memberSn = memberSn;
	}
	
	public int getWorkSn() {
		return workSn;
	}

	public void setWorkSn(int workSn) {
		this.workSn = workSn;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}
	
	public String getAppealContents() {
		return appealContents;
	}

	public void setAppealContents(String appealContents) {
		this.appealContents = appealContents;
	}
	
	public String getCreateDateStr() {
		return createDateStr;
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}

	public void setQustr(String qustr) {
		this.qustr = qustr;
	}
	
	private String qustr;
	
	public String getQustr() {
		return qustr;
	}
	
	public void setQustr() throws UnsupportedEncodingException {
		String qs = "";
		this.setQueryString();
		qs += this.getQueryString();
		/*
		 * if( this.searchId != null && this.searchId != "" ) { qs
		 * +="&searchId="+URLEncoder.encode(this.searchId, "UTF-8"); }
		 * 
		 * if( this.searchName != null && this.searchName != "" ) { qs
		 * +="&searchName="+URLEncoder.encode(this.searchName, "UTF-8"); }
		 */

		this.qustr = qs;
		
	}
}
