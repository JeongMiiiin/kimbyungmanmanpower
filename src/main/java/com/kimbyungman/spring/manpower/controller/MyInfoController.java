package com.kimbyungman.spring.manpower.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kimbyungman.spring.manpower.dto.MemberDto;
import com.kimbyungman.spring.manpower.service.MyInfoService;

@Controller
public class MyInfoController {
	
	@Autowired
	private MyInfoService service;
	
	//개인 마이페이지 이동 (사용자)
	@RequestMapping("/personal/myInfo/page")
	public String personalStepPage(HttpServletRequest request, @RequestParam("tabIdx") int tabIdx, Model model) {return service.personalSettingPage(request, tabIdx, model);}
	
	//개인 휴대폰 재인증 성공 페이지 이동 (사용자)
	@RequestMapping("/personal/myInfo/successPhoneNum")
	public String personalSuccessPhoneNum() {return "client/personal/myInfo/niceID/checkplus_success";}

	//개인 휴대폰 재인증 실패 페이지 이동 (사용자)
	@RequestMapping("/personal/myInfo/failPhoneNum")
	public String personalFailPhoneNum() {return "client/personal/myInfo/niceID/checkplus_fail";}
	
	//개인 정보수정 시도 (사용자)
	@RequestMapping(value="/personal/myInfo/updateMyInfo", method = RequestMethod.POST)
	public void updatePersonalMyInfo(@ModelAttribute("updateDto") MemberDto updateDto, HttpServletRequest request, HttpServletResponse response) {service.updatePersonalMyInfo(updateDto, request, response);}
	
	//개인 구인/구직 게시판 상세 페이지 이동 (사용자)
	@RequestMapping("/personal/myInfo/workView")
	public String personalWorkViewPage(HttpServletRequest request, @RequestParam("sn") int workSn, @RequestParam("pageCategory") String pageCategory, Model model) {return service.workViewPage(request, workSn, pageCategory, 0, model);}
	
	//개인 구인/구직 게시판 변경 페이지 이동 (사용자)
	@RequestMapping("/personal/myInfo/workUpdate")
	public String personalWorkUpdatePage(HttpServletRequest request, @RequestParam("sn") int workSn, @RequestParam("pageCategory") String pageCategory, Model model) {return service.workUpdatePage(request, workSn, pageCategory, 0, model);}

	//기업/단체 마이페이지 이동 (사용자)
	@RequestMapping("/business/myInfo/page")
	public String businessStepPage(HttpServletRequest request, @RequestParam("tabIdx") int tabIdx, Model model) {return service.businessSettingPage(request, tabIdx, model);}

	//기업/단체 휴대폰 재인증 성공 페이지 이동 (사용자)
	@RequestMapping("/business/myInfo/successPhoneNum")
	public String businessSuccessPhoneNum() {return "client/business/myInfo/niceID/checkplus_success";}

	//기업/단체 휴대폰 재인증 실패 페이지 이동 (사용자)
	@RequestMapping("/business/myInfo/failPhoneNum")
	public String businessFailPhoneNum() {return "client/business/myInfo/niceID/checkplus_fail";}
	
	//기업/단체 정보수정 시도 (사용자)
	@RequestMapping(value="/business/myInfo/updateMyInfo", method = RequestMethod.POST)
	public void updateBusinessMyInfo(@ModelAttribute("updateDto") MemberDto updateDto, HttpServletRequest request, HttpServletResponse response) {service.updateBusinessMyInfo(updateDto, request, response);}

	//기업/단체 구인/구직 게시판 상세 페이지 이동 (사용자)
	@RequestMapping("/business/myInfo/workView")
	public String businessWorkViewPage(HttpServletRequest request, @RequestParam("sn") int workSn, @RequestParam("pageCategory") String pageCategory, Model model) {return service.workViewPage(request, workSn, pageCategory, 1, model);}
	
	//기업/단체 구인/구직 게시판 상세 페이지 이동 (사용자)
	@RequestMapping("/business/myInfo/workUpdate")
	public String businessWorkUpdatePage(HttpServletRequest request, @RequestParam("sn") int workSn, @RequestParam("pageCategory") String pageCategory, Model model) {return service.workUpdatePage(request, workSn, pageCategory, 1, model);}
	
}
