package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.kimbyungman.spring.manpower.dto.AppealDto;

public interface AppealService {
	
	List<AppealDto> getMyAppeal(HttpServletRequest request); //나의 어필정보 데이터 조회 (사용자)
	List<AppealDto> selectListData(int memberSn); //나의 어필정보 리스트 조회 (사용자)
	HashMap<String,Object> updateAppeal(HttpServletRequest request, HashMap<String,Object> params); //나의 어필정보 업데이트 (사용자)
	HashMap<String,Object> deleteAppeal(HashMap<String,Object> params); //나의 어필정보 삭제 (사용자)
	
}
