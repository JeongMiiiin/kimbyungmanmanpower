package com.kimbyungman.spring.manpower.service;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kimbyungman.spring.manpower.dto.MemberDto;

public interface MemberService {
		String personalLogin(HttpServletRequest request); //개인 로그인 페이지 이동 (사용자)
		void personalLoginAction(HttpServletRequest request, HttpServletResponse response); //개인 로그인 체크 (사용자)
		String personalFindPassword(HttpServletRequest request); //개인 비밀번호 찾기 페이지 이동 (사용자)
		HashMap<String,Object> passwordCertificationCodeSend(HashMap<String, Object> params); //비밀번호 찾기 인증번호 메세지 전송 (사용자)
		HashMap<String,Object> passwordSubmitCertificationCode(HashMap<String, Object> params); //비밀번호 찾기 인증번호 체크 (사용자)
		String personalSignUp(int stepIdx, HttpServletRequest request); //개인 회원가입 페이지 이동 (사용자)
		HashMap<String,Object> certificateBankNum(HttpServletRequest request, HashMap<String, Object> params); //계좌번호 인증 시도 (사용자)
		void personalSignUpAction(MemberDto signUpDto, HttpServletRequest request, HttpServletResponse response); //개인 회원가입 (사용자)
		String businessLogin(HttpServletRequest request); //기업/단체 로그인 페이지 이동 (사용자)
		void businessLoginAction(HttpServletRequest request, HttpServletResponse response); //기업/단체 로그인 체크 (사용자)
		String businessSignUp(int stepIdx, HttpServletRequest request); //기업 회원가입 페이지 이동 (사용자)
		HashMap<String,Object> certificateBusinessNum(HttpServletRequest request, HashMap<String, Object> params); //사업자 등록번호 인증 시도 (사용자)
		void businessSignUpAction(MemberDto signUpDto, HttpServletRequest request, HttpServletResponse response); //기업/단체 회원가입 (사용자)
		String businessFindPassword(HttpServletRequest request); //기업/단체 비밀번호 찾기 페이지 이동 (사용자)
		HashMap<String,Object> certificationCodeSend(HashMap<String, Object> params); //회원가입 인증번호 메세지 전송 (사용자)
		HashMap<String,Object> submitCertificationCode(HttpServletRequest request, HashMap<String, Object> params); //회원가입 인증번호 체크 (사용자)
		HashMap<String,Object> settingTempPassword(HashMap<String, Object> params); //임시 비밀번호로 설정 (사용자)
		void signUpComplete(int siteCategory, HttpServletRequest request, HttpServletResponse response); //회원가입 완료 (사용자)
		void logout(int siteCategory, HttpServletRequest request, HttpServletResponse response); //로그아웃 (사용자)
		HashMap<String, Object> certificationCodeCheck(HashMap<String, Object> params); // 인증번호 확인 (사용자)
		HashMap<String, Object> checkMsgResend(HashMap<String, Object> params); //인증번호 메세지 재전송 (사용자)
		MemberDto getMyInfo(int memberSn); //회원정보 데이터 조회 (사용자)
		int updateMyInfo(MemberDto updateDto); //정보 수정 (사용자)
		MemberDto checkToken(String tokenValue); //토큰 기반 로그인 시도 (사용자)
		HashMap<String, Object> getTokenValue(int memberSn); //토큰값 조회 (사용자)
		HashMap<String, Object> updateNoticeAgree(HttpServletRequest request, HashMap<String, Object> params); //알림 상태 변경 (사용자)
}
