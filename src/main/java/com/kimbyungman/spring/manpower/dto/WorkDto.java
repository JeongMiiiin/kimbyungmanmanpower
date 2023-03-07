package com.kimbyungman.spring.manpower.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.stereotype.Component;

//구인/구직 Dto
@Component
public class WorkDto extends PageDto {
	private int sn;
	private int memberSn;
	private String title;
	private String memberName;
	private int status;
	private int memCategory;
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	public int getMemCategory() {
		return memCategory;
	}

	public void setMemCategory(int memCategory) {
		this.memCategory = memCategory;
	}

	public int getClassType() {
		return classType;
	}

	public void setClassType(int classType) {
		this.classType = classType;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public int getNumbers() {
		return numbers;
	}

	public void setNumbers(int numbers) {
		this.numbers = numbers;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}
	
	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemPhoneNum() {
		return memPhoneNum;
	}

	public void setMemPhoneNum(String memPhoneNum) {
		this.memPhoneNum = memPhoneNum;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public void setCategory(String category) {
		this.category = category;
	}

	private int classType;
	private int sex;
	private String category;
	private String region;
	private int numbers = -1;
	private String startDateStr;
	private String endDateStr;
	private String startTime;
	private String endTime;
	private int payment;
	private String contents;
	private String memName;
	private String memPhoneNum;
	private String password;
	private String createDateStr;
	private String updateDateStr;
	private int hits;
	private String buyerEmail;
	private String buyerAddr;
	private String buyerZipCode;
	private String tempMerchantUid;
	private int tempApplySn;
	private int tempRecipientSn;
	private List<ApplyDto> applyList;
	
	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}

	public String getBuyerAddr() {
		return buyerAddr;
	}

	public void setBuyerAddr(String buyerAddr) {
		this.buyerAddr = buyerAddr;
	}

	public String getBuyerZipCode() {
		return buyerZipCode;
	}

	public void setBuyerZipCode(String buyerZipCode) {
		this.buyerZipCode = buyerZipCode;
	}
	
	public String getTempMerchantUid() {
		return tempMerchantUid;
	}

	public void setTempMerchantUid(String tempMerchantUid) {
		this.tempMerchantUid = tempMerchantUid;
	}
	
	public int getTempApplySn() {
		return tempApplySn;
	}

	public void setTempApplySn(int tempApplySn) {
		this.tempApplySn = tempApplySn;
	}
	
	public int getTempRecipientSn() {
		return tempRecipientSn;
	}

	public void setTempRecipientSn(int tempRecipientSn) {
		this.tempRecipientSn = tempRecipientSn;
	}

	public List<ApplyDto> getApplyList(){
		return applyList;
	}
	
	public void setApplyList(List<ApplyDto> applyList){
		this.applyList = applyList;
	}
	
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

	public String getCategory() {
		return category;
	}
	
	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public void setQustr(String qustr) {
		this.qustr = qustr;
	}
	
	private String qustr;
	
	public String getQustr() {
		return qustr;
	}
	
	private String searchTitle;
	private int searchMemCategory = -1;
	private int searchClassType = -1;
	private String searchStartDate;
	private String searchEndDate;
	
	public String getSearchTitle() {
		return searchTitle;
	}
	
	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}
	
	public int getSearchMemCategory() {
		return searchMemCategory;
	}
	
	public void setSearchMemCategory(int searchMemCategory) {
		this.searchMemCategory = searchMemCategory;
	}
	
	public int getSearchClassType() {
		return searchClassType;
	}
	
	public void setSearchClassType(int searchClassType) {
		this.searchClassType = searchClassType;
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
	
	public void setQustr() throws UnsupportedEncodingException {
		String qs = "";
		this.setQueryString();
		qs += this.getQueryString();
		
		
			if( this.searchTitle != null && this.searchTitle != "" ) { qs
			+="&searchTitle="+URLEncoder.encode(this.searchTitle, "UTF-8"); }
		
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
