//사용자 Controller
package com.kimbyungman.spring.manpower.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kimbyungman.spring.manpower.service.AdmService;

@Controller
public class AdmController {
	
	@Autowired
	private AdmService service;

	//관리자 페이지 접근 (관리자)
	@RequestMapping("/adm")
	public String goAdm() {return "redirect:/adm/login";}
	
	//관리자 페이지 접근 (관리자)
	@RequestMapping("/adm/")
	public String goAdm2() {return "redirect:/adm/login";}
	
	//로그인 페이지 이동 (관리자)
	@RequestMapping(value="/adm/login")
	public String admPage(HttpServletRequest request) {return service.loginPage(request);}
	
	//로그인 시도 (관리자)
	@RequestMapping(value="/adm/loginAction", method = RequestMethod.POST)
	public void loginAction(HttpServletRequest request, HttpServletResponse response) {service.loginAction(request, response);}
	
	//로그아웃 (관리자)
	@RequestMapping(value="/adm/logout")
	public void admLogout(HttpServletRequest request, HttpServletResponse response) {service.logout(request, response);}
	
}
