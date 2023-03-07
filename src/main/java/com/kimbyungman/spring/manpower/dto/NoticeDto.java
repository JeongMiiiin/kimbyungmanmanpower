package com.kimbyungman.spring.manpower.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

//공지사항 Dto
@Component
public class NoticeDto extends PageDto {
	private int sn;
	private String title;
	private int isNotice;
	private String contents;
	private int hit;
	private String createDateStr;
	private String updateDateStr;
	private int imgFileSeq;
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

	public int getIsNotice() {
		return isNotice;
	}

	public void setIsNotice(int isNotice) {
		this.isNotice = isNotice;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
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

	public int getImgFileSeq() {
		return imgFileSeq;
	}

	public void setImgFileSeq(int imgFileSeq) {
		this.imgFileSeq = imgFileSeq;
	}
	
	private String searchTitle;
	private String searchStartDate;
	private String searchEndDate;
	
	public String getSearchTitle() {
		return searchTitle;
	}
	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}
	
	public String getSearchStartDate() {
		return searchStartDate;
	}
	public void setSearchStartDate(String searchStartDate) {
		this.searchStartDate = searchStartDate;
	}
	public String getSearchEndDate() {
		return searchEndDate;
	}
	public void setSearchEndDate(String searchEndDate) {
		this.searchEndDate = searchEndDate;
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
		
		if( this.searchTitle != null && this.searchTitle != "" ) {
			qs +="&searchTitle="+URLEncoder.encode(this.searchTitle, "UTF-8");
		}
		
		if( this.searchStartDate != null && this.searchStartDate != "" ) {
			qs +="&searchStartDate="+URLEncoder.encode(this.searchStartDate, "UTF-8");
		}
		
		if( this.searchEndDate != null && this.searchEndDate != "" ) {
			qs +="&searchEndDate="+URLEncoder.encode(this.searchEndDate, "UTF-8");
		}

		this.qustr = qs;
		
	}
}
