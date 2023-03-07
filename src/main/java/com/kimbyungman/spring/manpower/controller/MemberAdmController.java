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

import com.kimbyungman.spring.manpower.dto.MemberDto;
import com.kimbyungman.spring.manpower.service.MemberAdmService;

@Controller
@RequestMapping("/adm/member*")
public class MemberAdmController {
	
	@Autowired
	private MemberAdmService service;
	
	//리스트 페이지 이동 (관리자)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("searchDto") MemberDto searchDto, HttpServletRequest request, Model model) {return service.listPage(searchDto, request, model);}
	
	//등록 페이지 이동 (관리자)
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertPage(@ModelAttribute("searchDto") MemberDto searchDto, HttpServletRequest request, Model model) {return service.insertPage(searchDto, request, model);}
	
	//등록 (관리자)
	@RequestMapping(value = "/insertAction", method = RequestMethod.POST)
	public void insertData(@ModelAttribute("searchDto") MemberDto searchDto, HttpServletResponse response) {service.insertData(searchDto, response);}
	
	//변경 페이지 이동 (관리자)
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updatePage(@ModelAttribute("searchDto") MemberDto searchDto, HttpServletRequest request, @RequestParam("sn") int MemberSn, Model model) {return service.updatePage(searchDto, MemberSn, request, model);}
		
	//변경 (관리자)
	@RequestMapping(value = "/updateAction", method = RequestMethod.POST)
	public void updateData(@ModelAttribute("searchDto") MemberDto searchDto, HttpServletRequest request, HttpServletResponse response) {service.updateData(searchDto, request, response);}
		
	//삭제 (관리자)
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void deleteData(@RequestParam("sn") int MemberSn, HttpServletResponse response) {service.deleteData(MemberSn, response);}
	
	//승인 상태 변경 (관리자)
	@RequestMapping(value = "/updateApprove", method = RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> updateApprove(@RequestBody HashMap<String, Object> params) {return service.updateApprove(params);}
}
