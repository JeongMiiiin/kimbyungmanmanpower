package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kimbyungman.spring.manpower.dao.AppealDao;
import com.kimbyungman.spring.manpower.dto.AppealDto;
import com.kimbyungman.spring.manpower.dto.MemberDto;

@Service
public class AppealServiceImpl extends RootService implements AppealService {
	@Autowired
	private AppealDao dao;
	
	//나의 어필정보 데이터 조회 (사용자)
	@Override
	public List<AppealDto> getMyAppeal(HttpServletRequest request){
		HttpSession session = request.getSession();
		int memberSn = ((MemberDto) session.getAttribute("memberInfo")).getSn();
		return dao.selectListData(memberSn);
	}
	
	//나의 어필정보 리스트 조회 (사용자)
	@Override
	public List<AppealDto> selectListData(int memberSn){return dao.selectListData(memberSn);}
	
	//나의 어필정보 업데이트 (사용자)
	@Override
	public HashMap<String,Object> updateAppeal(HttpServletRequest request, HashMap<String,Object> params){
		HttpSession session = request.getSession();
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("result", false);
		int resultCnt = 0;
		if(params.get("sn") != null) {
			resultCnt = dao.updateData(params);
		} else {
			int memberSn = ((MemberDto) session.getAttribute("memberInfo")).getSn();
			params.put("memberSn", memberSn);
			resultCnt = dao.insertData(params);
		}
		
		if(resultCnt > 0) {result.put("result", true);}
		
		return result;
	}

	//나의 어필정보 삭제 (사용자)
	@Override
	public HashMap<String,Object> deleteAppeal(HashMap<String,Object> params){
		
		HashMap<String, Object> result = new HashMap<String, Object>(); 
		result.put("result", false);
		
		int resultCnt = dao.deleteData(params);
		if(resultCnt > 0) {result.put("result", true);}
		
		return result;
	}
	
}
