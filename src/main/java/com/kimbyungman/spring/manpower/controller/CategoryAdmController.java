package com.kimbyungman.spring.manpower.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kimbyungman.spring.manpower.dto.CategoryDto;
import com.kimbyungman.spring.manpower.service.CategoryAdmService;

@Controller
@RequestMapping("/adm/category*")
public class CategoryAdmController {

	@Autowired
	private CategoryAdmService service;
	
	//리스트 페이지 이동 (관리자)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("searchDto") CategoryDto searchDto, HttpServletRequest request, Model model) {return service.listPage(searchDto, request, model);}
	
	//등록 페이지 이동 (관리자)
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertPage(@ModelAttribute("searchDto") CategoryDto searchDto, HttpServletRequest request, Model model) {return service.insertPage(searchDto, request, model);}
	
	//등록 (관리자)
	@RequestMapping(value = "/insertAction", method = RequestMethod.POST)
	public void insertData(@ModelAttribute("searchDto") CategoryDto searchDto, HttpServletResponse response) {service.insertData(searchDto, response);}
	
	//변경 페이지 이동 (관리자)
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updatePage(@ModelAttribute("searchDto") CategoryDto searchDto, HttpServletRequest request, @RequestParam("sn") int CategorySn, Model model) {return service.updatePage(searchDto, CategorySn, request, model);}
		
	//변경 (관리자)
	@RequestMapping(value = "/updateAction", method = RequestMethod.POST)
	public void updateData(@ModelAttribute("searchDto") CategoryDto searchDto, HttpServletResponse response) {service.updateData(searchDto, response);}
		
	//삭제 (관리자)
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void deleteData(@RequestParam("sn") int categorySn, HttpServletResponse response) {service.deleteData(categorySn, response);}
		
	//요청상태 변경 (관리자)
	@RequestMapping(value = "/updateStatus", method = RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> updateStatus(@RequestBody HashMap<String, Object> params) {return service.updateStatus(params);}
	
}
