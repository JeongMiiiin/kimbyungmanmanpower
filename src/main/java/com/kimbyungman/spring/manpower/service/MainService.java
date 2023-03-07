package com.kimbyungman.spring.manpower.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MainService {
	String goIntro(HttpServletRequest request); //인트로 페이지 이동 (사용자)
	String goIntroFirst(HttpServletRequest request); //모바일용 인트로 페이지 이동 (사용자)
	String businessMain(HttpServletRequest request, Model model); //개인 메인 페이지 이동 (사용자)
	String personalMain(HttpServletRequest request, Model model); //기업/단체 메인 페이지 이동 (사용자)
}
