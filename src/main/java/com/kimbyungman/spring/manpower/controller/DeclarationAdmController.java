package com.kimbyungman.spring.manpower.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kimbyungman.spring.manpower.dto.DeclarationDto;
import com.kimbyungman.spring.manpower.service.DeclarationAdmService;

@Controller
@RequestMapping("/adm/declaration*")
public class DeclarationAdmController {

	@Autowired
	private DeclarationAdmService service;
	
	//리스트 페이지 이동 (관리자)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("searchDto") DeclarationDto searchDto, HttpServletRequest request, Model model) {return service.listPage(searchDto, request, model);}
	
	//신고 상태 변경 (관리자)
	@RequestMapping(value = "/updateStatus", method = RequestMethod.POST)
	public @ResponseBody boolean updateStatus(@RequestBody HashMap<String, Object> params) {return service.updateStatus(params);}
	
}
