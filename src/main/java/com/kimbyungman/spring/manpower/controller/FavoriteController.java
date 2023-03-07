package com.kimbyungman.spring.manpower.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kimbyungman.spring.manpower.service.FavoriteService;

@Controller
@RequestMapping("/favorite*")
public class FavoriteController {
	@Autowired
	private FavoriteService service;
	
	//즐겨찾기 페이지 이동 (사용자)
	@RequestMapping("/list")
	public String listPage(HttpServletRequest request, Model model) {return service.listPage(request, model);}
	
	//요청상태 변경 (사용자)
	@RequestMapping(value = "/updateFavorite", method = RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> updateFavorite(HttpServletRequest request, @RequestBody HashMap<String, Object> params) {return service.updateFavorite(request, params);}
	
}
