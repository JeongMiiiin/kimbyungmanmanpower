package com.kimbyungman.spring.manpower.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

//거래내역 Dto
@Component
public class DealDto extends PageDto {
	private int sn;
	private int memberSn;
	private String memberName;
	private int workSn;
	private String workTitle;
	private int recipientSn;
	private String recipientName;
	private int status;
	private String title;
	private int payment;
	private String impUid;
	private String merchantUid;
	private String paymentDateStr;
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
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getWorkSn() {
		return workSn;
	}
	
	public String getWorkTitle() {
		return workTitle;
	}

	public void setWorkTitle(String workTitle) {
		this.workTitle = workTitle;
	}

	public void setWorkSn(int workSn) {
		this.workSn = workSn;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}
	
	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPaymentDateStr() {
		return paymentDateStr;
	}

	public void setPaymentDateStr(String paymentDateStr) {
		this.paymentDateStr = paymentDateStr;
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
	
	private String searchWorkTitle;
	private String searchBuyerName;
	private String searchRecipientName;
	private int searchStatus = -1;
	
	public String getSearchWorkTitle() {
		return searchWorkTitle;
	}

	public void setSearchWorkTitle(String searchWorkTitle) {
		this.searchWorkTitle = searchWorkTitle;
	}

	public String getSearchBuyerName() {
		return searchBuyerName;
	}

	public void setSearchBuyerName(String searchBuyerName) {
		this.searchBuyerName = searchBuyerName;
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
		 +="&searchWorkTitle="+URLEncoder.encode(this.searchWorkTitle, "UTF-8"); }
		 
		 if( this.searchBuyerName != null && this.searchBuyerName != "" ) { qs
		 +="&searchBuyerName="+URLEncoder.encode(this.searchBuyerName, "UTF-8"); }
		 
		 if( this.searchRecipientName != null && this.searchRecipientName != "" ) { qs
			 +="&searchRecipientName="+URLEncoder.encode(this.searchRecipientName, "UTF-8"); }

		this.qustr = qs;
		
	}
}
