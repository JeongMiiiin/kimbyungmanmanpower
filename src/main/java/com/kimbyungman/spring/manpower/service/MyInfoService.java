package com.kimbyungman.spring.manpower.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dto.MemberDto;

public interface MyInfoService {
	String personalSettingPage(HttpServletRequest request, int tabIdx, Model model); //개인 마이페이지 이동 (사용자)
	void updatePersonalMyInfo(MemberDto updateDto, HttpServletRequest request, HttpServletResponse response); //개인 내정보 수정 (사용자)
	String workViewPage(HttpServletRequest request, int workSn, String pageCategory, int category, Model model); //구인/구직내역 상세 페이지 이동 (사용자)
	String workUpdatePage(HttpServletRequest request, int workSn, String pageCategory, int category, Model model); //구인/구직내역 변경 페이지 이동 (사용자)
	String businessSettingPage(HttpServletRequest request, int tabIdx, Model model); //기업/단체 마이페이지 이동 (사용자)
	void updateBusinessMyInfo(MemberDto updateDto, HttpServletRequest request, HttpServletResponse response); //기업/단체 내정보 수정 (사용자)
	
}
