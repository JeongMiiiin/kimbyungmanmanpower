package com.kimbyungman.spring.manpower.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

//회원 Dto
@Component
public class MemberDto extends PageDto {
	private int sn;
	private String name;
	private String managerName;
	private String representativeName;
	private String password;
	private String phone0;
	private String phone1;
	private String phone2;
	private int category;
	private String email0;
	private String email1;
	private int nationality;
	private int sex;
	private String birthStr;
	private int bloodPressure;
	private int carExist;
	private String bankName;
	private String bankNum;
	private String zipCode;
	private String address0;
	private String address1;
	private String etcFileSeq;
	private List<HashMap<String,Object>> etcFileNameList;
	private int signFileSeq;
	private String signFileName;
	private String permissionFileSeq;
	private List<HashMap<String,Object>> permissionFileNameList;
	private String healthCertificateFileSeq;
	private List<HashMap<String,Object>> healthCertificateFileNameList;
	private String completeFileSeq;
	private List<HashMap<String,Object>> completeFileNameList;
	private String simpleAdvantages;
	private String createDateStr;
	private int noticeAgree;
	private String businessNum;
	private String tokenId;
	private int isApproved;
	public int getSn() {
		return sn;
	}

	public void setSn(int sn) {
		this.sn = sn;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	
	public String getRepresentativeName() {
		return representativeName;
	}

	public void setRepresentativeName(String representativeName) {
		this.representativeName = representativeName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone0() {
		return phone0;
	}

	public void setPhone0(String phone0) {
		this.phone0 = phone0;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getEmail0() {
		return email0;
	}

	public void setEmail0(String email0) {
		this.email0 = email0;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public int getNationality() {
		return nationality;
	}

	public void setNationality(int nationality) {
		this.nationality = nationality;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getBirthStr() {
		return birthStr;
	}

	public void setBirthStr(String birthStr) {
		this.birthStr = birthStr;
	}

	public int getBloodPressure() {
		return bloodPressure;
	}

	public void setBloodPressure(int bloodPressure) {
		this.bloodPressure = bloodPressure;
	}

	public int getCarExist() {
		return carExist;
	}

	public void setCarExist(int carExist) {
		this.carExist = carExist;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankNum() {
		return bankNum;
	}

	public void setBankNum(String bankNum) {
		this.bankNum = bankNum;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress0() {
		return address0;
	}

	public void setAddress0(String address0) {
		this.address0 = address0;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getEtcFileSeq() {
		return etcFileSeq;
	}

	public void setEtcFileSeq(String etcFileSeq) {
		this.etcFileSeq = etcFileSeq;
	}

	public List<HashMap<String,Object>> getEtcFileNameList() {
		return etcFileNameList;
	}

	public void setEtcFileNameList(List<HashMap<String,Object>> etcFileNameList) {
		this.etcFileNameList = etcFileNameList;
	}

	public int getSignFileSeq() {
		return signFileSeq;
	}

	public void setSignFileSeq(int signFileSeq) {
		this.signFileSeq = signFileSeq;
	}

	public String getSignFileName() {
		return signFileName;
	}

	public void setSignFileName(String signFileName) {
		this.signFileName = signFileName;
	}

	public String getPermissionFileSeq() {
		return permissionFileSeq;
	}

	public void setPermissionFileSeq(String permissionFileSeq) {
		this.permissionFileSeq = permissionFileSeq;
	}

	public List<HashMap<String,Object>> getPermissionFileNameList() {
		return permissionFileNameList;
	}

	public void setPermissionFileNameList(List<HashMap<String,Object>> permissionFileNameList) {
		this.permissionFileNameList = permissionFileNameList;
	}

	public String getHealthCertificateFileSeq() {
		return healthCertificateFileSeq;
	}

	public void setHealthCertificateFileSeq(String healthCertificateFileSeq) {
		this.healthCertificateFileSeq = healthCertificateFileSeq;
	}

	public List<HashMap<String,Object>> getHealthCertificateFileNameList() {
		return healthCertificateFileNameList;
	}

	public void setHealthCertificateFileNameList(List<HashMap<String,Object>> healthCertificateFileNameList) {
		this.healthCertificateFileNameList = healthCertificateFileNameList;
	}
	
	public String getCompleteFileSeq() {
		return completeFileSeq;
	}

	public void setCompleteFileSeq(String completeFileSeq) {
		this.completeFileSeq = completeFileSeq;
	}

	public List<HashMap<String,Object>> getCompleteFileNameList() {
		return completeFileNameList;
	}

	public void setCompleteFileNameList(List<HashMap<String,Object>> completeFileNameList) {
		this.completeFileNameList = completeFileNameList;
	}

	public String getSimpleAdvantages() {
		return simpleAdvantages;
	}

	public void setSimpleAdvantages(String simpleAdvantages) {
		this.simpleAdvantages = simpleAdvantages;
	}

	public String getCreateDateStr() {
		return createDateStr;
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}
	
	public int getNoticeAgree() {
		return noticeAgree;
	}
	
	public void setNoticeAgree(int noticeAgree) {
		this.noticeAgree = noticeAgree;
	}
	
	public int getIsApproved() {
		return isApproved;
	}
	
	public void setIsApproved(int isApproved) {
		this.isApproved = isApproved;
	}
	
	public String getBusinessNum() {
		return businessNum;
	}
	
	public void setBusinessNum(String businessNum) {
		this.businessNum = businessNum;
	}
	
	public String getTokenId() {
		return tokenId;
	}
	
	public void setTokenId(String tokenId) {
		this.tokenId = tokenId;
	}

	public void setQustr(String qustr) {
		this.qustr = qustr;
	}
	
	private String searchPhoneNum;
	private String searchName;
	private int searchMemApprove = -2;

	public String getSearchPhoneNum() {
		return searchPhoneNum;
	}

	public void setSearchPhoneNum(String searchPhoneNum) {
		this.searchPhoneNum = searchPhoneNum;
	}
	
	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	
	public int getSearchMemApprove() {
		return searchMemApprove;
	}
	
	public void setSearchMemApprove(int searchMemApprove) {
		this.searchMemApprove = searchMemApprove;
	}
	
	private String qustr;
	
	public String getQustr() {
		return qustr;
	}
	
	public void setQustr() throws UnsupportedEncodingException {
		String qs = "";
		this.setQueryString();
		qs += this.getQueryString();
		
		if( this.searchPhoneNum != null && this.searchPhoneNum != "" ) {
			qs +="&searchPhoneNum="+URLEncoder.encode(this.searchPhoneNum, "UTF-8");
		}
		 
		if( this.searchName != null && this.searchName != "" ) {
			qs +="&searchName="+URLEncoder.encode(this.searchName, "UTF-8");
		}
		 

		this.qustr = qs;
		
	}
}
