package com.kimbyungman.spring.manpower.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

//신고내역 Dto
@Component
public class DeclarationDto extends PageDto {
	private int sn;
	private int workSn;
	private String workTitle;
	private int category;
	private String createDateStr;
	private int status;
	private int memberSn;
	private String memberName;
	private int recipientSn;
	private String recipientName;
	private String deleteDateStr;
	
	public int getSn() {
		return sn;
	}

	public void setSn(int sn) {
		this.sn = sn;
	}

	public int getWorkSn() {
		return workSn;
	}

	public void setWorkSn(int workSn) {
		this.workSn = workSn;
	}
	
	public String getWorkTitle() {
		return workTitle;
	}

	public void setWorkTitle(String workTitle) {
		this.workTitle = workTitle;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getCreateDateStr() {
		return createDateStr;
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getMemberSn() {
		return memberSn;
	}

	public void setMemberSn(int memberSn) {
		this.memberSn = memberSn;
	}
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	public int getRecipientSn() {
		return recipientSn;
	}

	public void setRecipientSn(int recipientSn) {
		this.recipientSn = recipientSn;
	}
	
	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getDeleteDateStr() {
		return deleteDateStr;
	}

	public void setDeleteDateStr(String deleteDateStr) {
		this.deleteDateStr = deleteDateStr;
	}

	public void setQustr(String qustr) {
		this.qustr = qustr;
	}
	
	private String qustr;
	private String searchWorkTitle;
	private String searchMemberName;
	private String searchRecipientName;
	private int searchStatus = -1;
	
	public String getSearchWorkTitle() {
		return searchWorkTitle;
	}

	public void setSearchWorkTitle(String searchWorkTitle) {
		this.searchWorkTitle = searchWorkTitle;
	}

	public String getSearchMemberName() {
		return searchMemberName;
	}

	public void setSearchMemberName(String searchMemberName) {
		this.searchMemberName = searchMemberName;
	}

	public String getSearchRecipientName() {
		return searchRecipientName;
	}

	public void setSearchRecipientName(String searchRecipientName) {
		this.searchRecipientName = searchRecipientName;
	}
	
	public int getSearchStatus() {
		return searchStatus;
	}

	public void setSearchStatus(int searchStatus) {
		this.searchStatus = searchStatus;
	}

	public String getQustr() {
		return qustr;
	}
	
	public void setQustr() throws UnsupportedEncodingException {
		String qs = "";
		this.setQueryString();
		qs += this.getQueryString();
		
		  if( this.searchWorkTitle != null && this.searchWorkTitle != "" ) { qs
		  +="&searchId="+URLEncoder.encode(this.searchWorkTitle, "UTF-8"); }
		  
		  if( this.searchMemberName != null && this.searchMemberName != "" ) { qs
		  +="&searchMemberName="+URLEncoder.encode(this.searchMemberName, "UTF-8"); }
		 
		  if( this.searchRecipientName != null && this.searchRecipientName != "" ) { qs
			  +="&searchRecipientName="+URLEncoder.encode(this.searchRecipientName, "UTF-8"); }
		  if( this.searchStatus > -1) { qs
			  +="&searchStatus=" + this.searchStatus; }

		this.qustr = qs;
		
	}
}

