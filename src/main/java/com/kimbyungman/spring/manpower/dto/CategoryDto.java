package com.kimbyungman.spring.manpower.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

//카테고리 Dto
@Component
public class CategoryDto extends PageDto {
	private int sn;
	private String title;
	private int status;
	private String createDateStr;
	private String updateDateStr;
	
	public int getSn() {
		return sn;
	}

	public void setSn(int sn) {
		this.sn = sn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCreateDateStr() {
		return createDateStr;
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}

	public String getUpdateDateStr() {
		return updateDateStr;
	}

	public void setUpdateDateStr(String updateDateStr) {
		this.updateDateStr = updateDateStr;
	}

	public void setQustr(String qustr) {
		this.qustr = qustr;
	}
	
	private String qustr;
	
	public String getQustr() {
		return qustr;
	}
	
	private String searchName;
	private int searchStatus = -1;
	
	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public int getSearchStatus() {
		return searchStatus;
	}

	public void setSearchStatus(int searchStatus) {
		this.searchStatus = searchStatus;
	}
	
	public void setQustr() throws UnsupportedEncodingException {
		String qs = "";
		this.setQueryString();
		qs += this.getQueryString();
		
		if( this.searchName != null && this.searchName != "" ) { qs +="&searchName="+URLEncoder.encode(this.searchName, "UTF-8"); }
		 
		qs +="&searchStatus="+ this.searchStatus;
		 
		this.qustr = qs;
		
	}
}
