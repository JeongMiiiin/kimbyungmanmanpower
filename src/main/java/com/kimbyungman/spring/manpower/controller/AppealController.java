//사용자 Controller

package com.kimbyungman.spring.manpower.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kimbyungman.spring.manpower.dto.AppealDto;
import com.kimbyungman.spring.manpower.service.AppealService;

@Controller
@RequestMapping("/appeal*")
public class AppealController {
	
	@Autowired
	private AppealService service;
	
	//나의 어필정보 데이터 조회 (사용자)
	@RequestMapping("/getMyAppeal")
	public @ResponseBody List<AppealDto> getMyAppeal(HttpServletRequest request){return service.getMyAppeal(request);}

	//나의 어필정보 업데이트 (사용자)
	@RequestMapping("/updateAppeal")
	public @ResponseBody HashMap<String,Object> updateAppeal(HttpServletRequest request, @RequestBody HashMap<String, Object> params) {return service.updateAppeal(request, params);}

	//나의 어필정보 삭제 (사용자)
	@RequestMapping("/deleteAppeal")
	public @ResponseBody HashMap<String,Object> deleteAppeal(@RequestBody HashMap<String, Object> params) {return service.deleteAppeal(params);}
	
}
