package com.kimbyungman.spring.manpower.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kimbyungman.spring.manpower.dto.NoticeDto;
import com.kimbyungman.spring.manpower.service.NoticeService;

@Controller
@RequestMapping("/notice*")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	//리스트 페이지 이동 (사용자)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(NoticeDto searchDto, HttpServletRequest request, Model model) {return service.listPage(searchDto, request, model);}
	
}
