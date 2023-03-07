//사용자 Controller

package com.kimbyungman.spring.manpower.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kimbyungman.spring.manpower.dto.MemberDto;
import com.kimbyungman.spring.manpower.service.WorkService;

@Controller
public class WorkController {
	
	@Autowired
	private WorkService service;
	
	//구인/구직 게시판 등록 (사용자)
	@RequestMapping("/work/insertData")
	public @ResponseBody HashMap<String, Object> insertData(HttpServletRequest request, @RequestBody HashMap<String, Object> params) {return service.insertData(request, params);}
	
	//구인/구직 게시판 변경 (사용자)
	@RequestMapping("/work/updateData")
	public @ResponseBody HashMap<String, Object> updateData(HttpServletRequest request, @RequestBody HashMap<String, Object> params) {return service.updateData(request, params);}
	
	//구인/구직 게시판 변경 (사용자)
	@RequestMapping("/work/deleteData")
	public @ResponseBody HashMap<String, Object> deleteData(HttpServletRequest request, @RequestBody HashMap<String, Object> params) {return service.deleteData(request, params);}

	//구인/구직 게시판 검색 (사용자)
	@RequestMapping("/work/searchWork")
	public @ResponseBody HashMap<String, Object> searchWork(@RequestBody HashMap<String, Object> params) {return service.searchData(params);}
	
	//팝업 상세 데이터 조회 (사용자)
	@RequestMapping("/work/viewPopupData")
	public @ResponseBody HashMap<String, Object> viewPopupData(@RequestBody HashMap<String, Object> params) {return service.viewPopupData(params);}

	//지원상태 변경 (사용자)
	@RequestMapping("/work/changeApplyStatus")
	public @ResponseBody HashMap<String, Object> changeApplyStatus(@RequestBody HashMap<String, Object> params) {return service.changeApplyStatus(params);}
	
	//임시 데이터 업데이트 (사용자 앱용)
	@RequestMapping("/work/updateTempMerchant")
	public @ResponseBody HashMap<String, Object> updateTempMerchant(@RequestBody HashMap<String, Object> params){return service.updateTempMerchant(params);};
	
	//지원상태 변경 (사용자 앱용)
	@RequestMapping("/work/changeApplyStatusForApp")
	public void changeApplyStatusForApp(HttpServletRequest request, HttpServletResponse response) {service.changeApplyStatusForApp(request, response);}
	
	//지원자 상세 보기 (사용자)
	@RequestMapping("/work/viewApplyMember")
	public @ResponseBody MemberDto viewApplyMember(@RequestBody HashMap<String, Object> params) {return service.viewApplyMember(params);}
	
	//지원하기 (사용자)
	@RequestMapping("/work/insertApply")
	public @ResponseBody HashMap<String, Object> insertApply(HttpServletRequest request, @RequestBody HashMap<String, Object> params) {return service.insertApply(request, params);}

	//거래상태 변경 (사용자)
	@RequestMapping("/work/updateDeal")
	public @ResponseBody HashMap<String, Object> updateDeal(HttpServletRequest request, @RequestBody HashMap<String, Object> params) {return service.updateDeal(request, params);}
	
}
