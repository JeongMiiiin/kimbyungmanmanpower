//사용자 Controller

package com.kimbyungman.spring.manpower.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kimbyungman.spring.manpower.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;

	//인트로 페이지 접근 (사용자)
	@RequestMapping("/")
	public String goIntro() {return "redirect:/intro";}
	
	//인트로 페이지 이동 (사용자)
	@RequestMapping(value="/intro")
	public String introPage(HttpServletRequest request) {return service.goIntro(request);}
	
	//인트로 페이지 이동 (사용자)
	@RequestMapping(value="/introFirst")
	public String introFirstPage(HttpServletRequest request) {return service.goIntroFirst(request);}

	//개인 메인 페이지 접근 (사용자)
	@RequestMapping("/personal/")
	public String goPersonal() {return "redirect:/business/main";}
	
	// 개인 메인 페이지 이동 (사용자)
	@RequestMapping(value="/personal/main")
	public String personalMain(HttpServletRequest request, Model model) {return service.personalMain(request, model);}

	//기업/단체 메인 페이지 접근 (사용자)
	@RequestMapping("/business/")
	public String goBusiness() {return "redirect:/business/main";}
	
	//기업/단체 메인 페이지 이동 (사용자)
	@RequestMapping(value="/business/main")
	public String businessMain(HttpServletRequest request, Model model) {return service.businessMain(request, model);}
	
}
