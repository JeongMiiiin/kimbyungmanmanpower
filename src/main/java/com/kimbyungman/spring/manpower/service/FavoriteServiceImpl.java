package com.kimbyungman.spring.manpower.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dao.FavoriteDao;
import com.kimbyungman.spring.manpower.dto.MemberDto;

@Service
public class FavoriteServiceImpl extends RootService implements FavoriteService {
	
	@Autowired
	private FavoriteDao dao;
	
	@Autowired
	private WorkService WorkService;
	
	//리스트 페이지 이동 (사용자)
	@Override
	public String listPage(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		int memberSn = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getSn() : 5; 
		List<HashMap<String, Object>> favoriteList = getFavoriteList(memberSn);
		List<Integer> favoriteSnList = new ArrayList<>();
		
		for(int i=0; i < favoriteList.size(); i++) {
			favoriteSnList.add((int) favoriteList.get(i).get("work_sn"));
		}
		
		List<HashMap<String, Object>> workList = WorkService.favoriteData(favoriteSnList);
		
		session.setAttribute("workList", workList);
		
		return "client/personal/favorite/list";
	};
	
	// 즐겨찾기 상태 변경 (사용자)
	@Override
	public HashMap<String, Object> updateFavorite(HttpServletRequest request, HashMap<String, Object> params){
		
		HttpSession session = request.getSession();
		
		int memberSn = ((MemberDto) session.getAttribute("memberInfo")).getSn();
		
		params.put("memberSn", memberSn);
		
		int data = 0;
		
		if((boolean) params.get("status")) {
			data = dao.insertFavorite(params);
		} else {
			data = dao.deleteFavorite(params);
		}
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("result", false);
		
		if(data > 0) {result.put("result", true);}
		
		return result;
		
	};
	
	// 즐겨찾기 리스트 데이터 조회 (사용자)
	@Override
	public List<HashMap<String, Object>> getFavoriteList(int memberSn){return dao.getFavoriteList(memberSn);}
	
}
