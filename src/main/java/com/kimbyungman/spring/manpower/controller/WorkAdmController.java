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

import com.kimbyungman.spring.manpower.dto.WorkDto;
import com.kimbyungman.spring.manpower.service.WorkAdmService;

@Controller
@RequestMapping("/adm/work*")
public class WorkAdmController {

	@Autowired
	private WorkAdmService service;
	
	//리스트 페이지 이동 (관리자)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("searchDto") WorkDto searchDto, HttpServletRequest request, Model model) {return service.listPage(searchDto, request, model);}

	//상세 페이지 이동 (관리자)
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String viewPage(@ModelAttribute("sn") int WorkSn, HttpServletRequest request, Model model) {return service.viewPage(WorkSn, request, model);}
		
	//삭제 (관리자)
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void deleteData(@RequestParam("sn") int WorkSn, HttpServletResponse response) {service.deleteData(WorkSn, response);}
	
}
