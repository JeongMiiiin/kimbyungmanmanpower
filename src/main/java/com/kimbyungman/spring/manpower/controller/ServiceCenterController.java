package com.kimbyungman.spring.manpower.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kimbyungman.spring.manpower.service.ServiceCenterService;

@Controller
@RequestMapping("/personal/serviceCenter*")
public class ServiceCenterController {
	
	@Autowired
	private ServiceCenterService service;
	
	//고객센터 페이지 이동 (사용자)
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public String stepPage(HttpServletRequest request, @RequestParam("tabIdx") int tabIdx, Model model) {return service.settingPage(request, tabIdx, model);}
	
}
