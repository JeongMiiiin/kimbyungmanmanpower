package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface FavoriteService {
	String listPage(HttpServletRequest request, Model model); // 리스트 페이지 이동 (사용자)
	HashMap<String, Object> updateFavorite(HttpServletRequest request, HashMap<String, Object> params); // 즐겨찾기 상태 변경 (사용자)
	List<HashMap<String, Object>> getFavoriteList(int memberSn); // 즐겨찾기 리스트 데이터 조회 (사용자)
}
