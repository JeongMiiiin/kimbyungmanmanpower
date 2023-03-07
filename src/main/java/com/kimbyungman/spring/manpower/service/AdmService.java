package com.kimbyungman.spring.manpower.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AdmService {
	
	String loginPage(HttpServletRequest request);	//로그인 페이지 이동 (관리자)
	void loginAction(HttpServletRequest request, HttpServletResponse response);	//로그인 시도 (관리자)
	void logout(HttpServletRequest request, HttpServletResponse response); //로그아웃 (관리자)
}
