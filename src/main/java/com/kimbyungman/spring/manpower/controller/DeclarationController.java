package com.kimbyungman.spring.manpower.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kimbyungman.spring.manpower.service.DeclarationService;

@Controller
@RequestMapping("/declaration*")
public class DeclarationController {

	@Autowired
	private DeclarationService service;
	
	//신고 데이터 추가 (사용자)
	@RequestMapping("/insertData")
	public @ResponseBody HashMap<String, Object> insertData(HttpServletRequest request, @RequestBody HashMap<String, Object> params) {return service.insertData(request, params);}

	//신고 취소 (사용자)
	@RequestMapping("/cancelData")
	public @ResponseBody HashMap<String, Object> cancelData(@RequestBody HashMap<String, Object> params) {return service.cancelData(params);}
	
}
