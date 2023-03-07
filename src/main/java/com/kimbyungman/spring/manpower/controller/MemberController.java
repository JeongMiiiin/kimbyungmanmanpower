//사용자 Controller

package com.kimbyungman.spring.manpower.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kimbyungman.spring.manpower.dto.MemberDto;
import com.kimbyungman.spring.manpower.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//개인 로그인 페이지 이동 (사용자)
	@RequestMapping(value = "/personal/login")
	public String personalLoginPage(HttpServletRequest request) {return service.personalLogin(request);}

	//개인 페이지 로그인 시도 (사용자)
	@RequestMapping(value = "/personal/loginAction")
	public void personalLoginAction(HttpServletRequest request, HttpServletResponse response) {service.personalLoginAction(request, response);}
	
	//개인 비밀번호찾기 페이지 이동 (사용자)
	@RequestMapping(value = "/personal/findPassword")
	public String personalFindPassword(HttpServletRequest request) {return service.personalFindPassword(request);}
	
	//비밀번호 찾기용 인증번호 전송 (사용자)
	@RequestMapping(value = "/passwordCertificationCodeSend")
	public @ResponseBody HashMap<String,Object> passwordCertificationCodeSend(@RequestBody HashMap<String, Object> params) {return service.passwordCertificationCodeSend(params);}
	
	//비밀번호 찾기용 인증번호 확인 (사용자)
	@RequestMapping(value = "/passwordSubmitCertificationCode", method = RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> passwordSubmitCertificationCode(@RequestBody HashMap<String, Object> params) {return service.passwordSubmitCertificationCode(params);}
	
	//페이지 알림 동의 상태 변경 (사용자)
	@RequestMapping(value = "/updateNoticeAgree", method = RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> updateNoticeAgree(HttpServletRequest request, @RequestBody HashMap<String, Object> params) {return service.updateNoticeAgree(request, params);}
	
	//개인 페이지 회원가입 페이지 이동 (사용자)
	@RequestMapping(value = "/personal/signUp")
	public String personalSignUp(@RequestParam("stepIdx") int stepIdx, HttpServletRequest request) {return service.personalSignUp(stepIdx, request);}
	
	//회원가입용 계좌번호 확인 (사용자)
	@RequestMapping(value = "/certificateBankNum", method = RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> certificateBankNum(HttpServletRequest request, @RequestBody HashMap<String, Object> params) {return service.certificateBankNum(request, params);}
	
	//개인 페이지 회원가입 시도 (사용자)
	@RequestMapping(value = "/personal/signUpAction", method = RequestMethod.POST)
	public void personalSignUpAction(@ModelAttribute("signUpDto") MemberDto signUpDto, HttpServletRequest request, HttpServletResponse response) {service.personalSignUpAction(signUpDto, request, response);}
	
	//개인 페이지 회원가입 완료 (사용자)
	@RequestMapping(value = "/personal/signUpComplete")
	public void personalSignUpComplete(HttpServletRequest request, HttpServletResponse response) {service.signUpComplete(0, request, response);}
	
	//개인 페이지 로그아웃 (사용자)
	@RequestMapping(value = "/personal/logout")
	public void personalLogout(HttpServletRequest request, HttpServletResponse response) {service.logout(0, request, response);}
	
	//회원가입용 인증번호 전송 (사용자)
	@RequestMapping(value = "/certificationCodeSend", method = RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> certificationCodeSend(@RequestBody HashMap<String, Object> params) {return service.certificationCodeSend(params);}
	
	//회원가입용 인증번호 확인 (사용자)
	@RequestMapping(value = "/submitCertificationCode", method = RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> submitCertificationCode(HttpServletRequest request, @RequestBody HashMap<String, Object> params) {return service.submitCertificationCode(request, params);}
	
	//회원 비밀번호 재설정 (사용자)
	@RequestMapping(value = "/settingTempPassword", method = RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> settingTempPassword(@RequestBody HashMap<String, Object> params) {return service.settingTempPassword(params);}
	
	//기업/단체 로그인 페이지 이동 (사용자)
	@RequestMapping(value = "/business/login")
	public String businessLoginPage(HttpServletRequest request) {return service.businessLogin(request);}

	//기업/단체 로그인 시도 (사용자)
	@RequestMapping(value = "/business/loginAction")
	public void businessLoginAction(HttpServletRequest request, HttpServletResponse response) {service.businessLoginAction(request, response);}
	
	//기업/단체 회원가입 페이지 이동 (사용자)
	@RequestMapping(value = "/business/signUp")
	public String businessSignUp(@RequestParam("stepIdx") int stepIdx, HttpServletRequest request) {return service.businessSignUp(stepIdx, request);}
	
	//회원가입용 사업자 등록번호 확인 (사용자)
	@RequestMapping(value = "/business/certificateBusinessNum", method = RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> certificateBusinessNum(HttpServletRequest request, @RequestBody HashMap<String, Object> params) {return service.certificateBusinessNum(request, params);}
		
	//기업/단체 회원가입 시도 (사용자)
	@RequestMapping(value = "/business/signUpAction", method = RequestMethod.POST)
	public void businessSignUpAction(@ModelAttribute("signUpDto") MemberDto signUpDto, HttpServletRequest request, HttpServletResponse response) {service.businessSignUpAction(signUpDto, request, response);}
	
	//기업/단체 회원가입 완료 (사용자)
	@RequestMapping(value = "/business/signUpComplete")
	public void businessSignUpComplete(HttpServletRequest request, HttpServletResponse response) {service.signUpComplete(1, request, response);}
	
	//기업/단체 비밀번호 찾기 페이지 이동 (사용자)
	@RequestMapping(value = "/business/findPassword")
	public String businessFindPassword(HttpServletRequest request) {return service.businessFindPassword(request);}
	
	//기업/단체 로그아웃 (사용자)
	@RequestMapping(value = "/business/logout")
	public void businessLogout(HttpServletRequest request, HttpServletResponse response) {service.logout(1, request, response);}
	
}