package com.kimbyungman.spring.manpower.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kimbyungman.spring.manpower.dto.DealDto;
import com.kimbyungman.spring.manpower.service.DealAdmService;

@Controller
@RequestMapping("/adm/deal*")
public class DealAdmController {

	@Autowired
	private DealAdmService service;
	
	//리스트 페이지 이동 (관리자)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("searchDto") DealDto searchDto, HttpServletRequest request, Model model) {return service.listPage(searchDto, request, model);}
	
}
