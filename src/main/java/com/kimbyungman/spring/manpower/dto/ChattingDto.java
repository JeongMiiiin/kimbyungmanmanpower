package com.kimbyungman.spring.manpower.dto;

import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Component;

//채팅 Dto
@Component
public class ChattingDto extends PageDto {
	private int sn;
	private int user1Sn;
	private int user2Sn;
	private String user1Name;
	private String user2Name;
	private String fileName;
	private int fileSeq;
	private int roomNumber;
	private String roomName;
	private String user1OutDateStr;
	private String user2OutDateStr;
	private String createDateStr;
	private String recentMsgDateStr;
	private String recentMsg;
	private int recentMsgSn;
	
	private String contents;
	private String sendTime;
	private String senderName;

	public String getRecentMsgDateStr() {
		return recentMsgDateStr;
	}

	public void setRecentMsgDateStr(String recentMsgDateStr) {
		this.recentMsgDateStr = recentMsgDateStr;
	}
	
	public String getRecentMsg() {
		return recentMsg;
	}

	public void setRecentMsg(String recentMsg) {
		this.recentMsg = recentMsg;
	}

	public int getRecentMsgSn() {
		return recentMsgSn;
	}

	public void setRecentMsgSn(int recentMsgSn) {
		this.recentMsgSn = recentMsgSn;
	}

	public int getSn() {
		return sn;
	}

	public void setSn(int sn) {
		this.sn = sn;
	}

	public int getUser1Sn() {
		return user1Sn;
	}

	public void setUser1Sn(int user1Sn) {
		this.user1Sn = user1Sn;
	}

	public int getUser2Sn() {
		return user2Sn;
	}

	public void setUser2Sn(int user2Sn) {
		this.user2Sn = user2Sn;
	}

	public String getUser1Name() {
		return user1Name;
	}

	public void setUser1Name(String user1Name) {
		this.user1Name = user1Name;
	}

	public String getUser2Name() {
		return user2Name;
	}

	public void setUser2Name(String user2Name) {
		this.user2Name = user2Name;
	}

	public int getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public int getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}

	
	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getUser1OutDateStr() {
		return user1OutDateStr;
	}

	public void setUser1OutDateStr(String user1OutDateStr) {
		this.user1OutDateStr = user1OutDateStr;
	}
	
	public String getUser2OutDateStr() {
		return user2OutDateStr;
	}

	public void setUser2OutDateStr(String user2OutDateStr) {
		this.user2OutDateStr = user2OutDateStr;
	}
	
	public String getCreateDateStr() {
		return createDateStr;
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
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
		 * if( this.searchName != null && this.searchName != "" ) { qs
		 * +="&searchName="+URLEncoder.encode(this.searchName, "UTF-8"); }
		 * 
		 * qs +="&searchStatus="+ this.searchStatus;
		 */
		 
		this.qustr = qs;
		
	}
}
