package com.kimbyungman.spring.manpower.dto;

import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Component;

//어필정보 Dto
@Component
public class AppealDto extends PageDto {
	private int sn;
	private int memberSn;
	private String title;
	private String contents;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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

	private String createDateStr;
	
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
