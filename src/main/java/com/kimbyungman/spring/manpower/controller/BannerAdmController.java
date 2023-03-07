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

import com.kimbyungman.spring.manpower.dto.BannerDto;
import com.kimbyungman.spring.manpower.service.BannerAdmService;

@Controller
@RequestMapping("/adm/banner*")
public class BannerAdmController {

	@Autowired
	private BannerAdmService service;
	
	//리스트 페이지 이동 (관리자)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("searchDto") BannerDto searchDto, HttpServletRequest request, Model model) {return service.listPage(searchDto, request, model);}
	
	//등록 페이지 이동 (관리자)
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertPage(@ModelAttribute("searchDto") BannerDto searchDto, HttpServletRequest request, Model model) {return service.insertPage(searchDto, request, model);}
	
	//등록 (관리자)
	@RequestMapping(value = "/insertAction", method = RequestMethod.POST)
	public void insertData(@ModelAttribute("searchDto") BannerDto searchDto, HttpServletRequest request, HttpServletResponse response) {service.insertData(searchDto, request, response);}
	
	//변경 페이지 이동 (관리자)
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updatePage(@ModelAttribute("searchDto") BannerDto searchDto, HttpServletRequest request, @RequestParam("sn") int BannerSn, Model model) {return service.updatePage(searchDto, BannerSn, request, model);}
		
	//변경 (관리자)
	@RequestMapping(value = "/updateAction", method = RequestMethod.POST)
	public void updateData(@ModelAttribute("searchDto") BannerDto searchDto, HttpServletRequest request, HttpServletResponse response) {service.updateData(searchDto, request, response);}
		
	//삭제 (관리자)
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void deleteData(@RequestParam("sn") int BannerSn, HttpServletResponse response) {service.deleteData(BannerSn, response);}
	
}
