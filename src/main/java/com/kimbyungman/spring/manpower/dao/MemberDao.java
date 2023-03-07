package com.kimbyungman.spring.manpower.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kimbyungman.spring.manpower.dto.MemberDto;

@Repository
public interface MemberDao {
	
	String SERVICE_ID = "member";
	
	int idCheck(HashMap<String, Object> params);
	MemberDto loginCheck(HashMap<String, Object> params); //사용자 로그인 체크 함수
	int checkPhoneNum(String phoneNum);
	void updateCertificationCode(HashMap<String, Object> params);
	int updateTempPassword(HashMap<String, Object> params);
	String checkCertificationCode(HashMap<String, Object> params);
	int checkFindPassword(HashMap<String, Object> params);
	int insertData(MemberDto params); //관리자 페이지 추가 함수
	int loginAdmCheck(HashMap<String, Object> params); //관리자 로그인 체크 함수
	List<MemberDto> selectAdmListData(MemberDto searchDto); //관리자 페이지 리스트 노출 함수
	int selectAdmTotalCnt(MemberDto searchDto); //관리자 페이지 총 건수 함수
	MemberDto selectAdmViewData(int categorySn); //관리자 페이지 상세 함수
	int insertAdmData(MemberDto params); //관리자 페이지 추가 함수
	int updateAdmData(MemberDto params); //관리자 페이지 업데이트 함수
	int deleteAdmData(int categorySn); //관리자 페이지 삭제 함수
	MemberDto getMyInfo(int memberSn);
	int updateMyInfo(MemberDto updateDto);
	int updateDeclaration(HashMap<String, Object> params);
	int updateApprove(HashMap<String, Object> params);
	void bannedMember(HashMap<String, Object> params);
	MemberDto checkToken(String tokenValue);
	HashMap<String, Object> getTokenValue(int memberSn);
	void updateToken(MemberDto params);
	int updateSignUpNoticeAgree(int userSn);
	MemberDto signUpLogin(int userSn);
}
