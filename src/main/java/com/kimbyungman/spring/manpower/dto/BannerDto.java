package com.kimbyungman.spring.manpower.dto;

import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Component;

//배너 Dto
@Component
public class BannerDto extends PageDto {
	private int sn;
	private String title;
	private int category;
	private String link;
	private int imgFileSeq;
	private String fileName;
	private String fileOriginName;
	private String fileExt;
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

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public int getImgFileSeq() {
		return imgFileSeq;
	}

	public void setImgFileSeq(int imgFileSeq) {
		this.imgFileSeq = imgFileSeq;
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getFileOriginName() {
		return fileOriginName;
	}

	public void setFileOriginName(String fileOriginName) {
		this.fileOriginName = fileOriginName;
	}
	
	public String getFileExt() {
		return fileExt;
	}

	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
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
	private String searchTitle;
	private int searchCategory = -1;
	
	public String getSearchTitle() {
		return searchTitle;
	}

	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}
	
	public int getSearchCategory() {
		return searchCategory;
	}

	public void setSearchCategory(int searchCategory) {
		this.searchCategory = searchCategory;
	}
	
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