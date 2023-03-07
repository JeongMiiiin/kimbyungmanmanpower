package com.kimbyungman.spring.manpower.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kimbyungman.spring.manpower.service.CategoryService;

@Controller
@RequestMapping("/category*")
public class CategoryController {
	
	@Autowired
	private CategoryService service;
	
	//카테고리 데이터 조회 (사용자)
	@RequestMapping("/getCategory")
	public @ResponseBody List<HashMap<String, Object>> getCategory() {return service.getCategory();}
	
}
