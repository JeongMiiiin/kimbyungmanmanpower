package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kimbyungman.spring.manpower.dto.MemberDto;
import com.kimbyungman.spring.manpower.dto.WorkDto;

public interface WorkService {
	List<WorkDto> selectListData(WorkDto params);
	HashMap<String, Object> insertData(HttpServletRequest request, HashMap<String, Object> params);
	HashMap<String, Object> updateData(HttpServletRequest request, HashMap<String, Object> params);
	HashMap<String, Object> deleteData(HttpServletRequest request, HashMap<String, Object> params);
	HashMap<String, Object> searchData(HashMap<String, Object> params);
	WorkDto viewData(int sn);
	HashMap<String, Object> viewPopupData(HashMap<String, Object> params);
	List<HashMap<String, Object>> favoriteData(List<Integer> favoriteSnList);
	HashMap<String, Object> insertApply(HttpServletRequest request, HashMap<String, Object> params);
	HashMap<String, Object> changeApplyStatus(HashMap<String, Object> params);
	void changeApplyStatusForApp(HttpServletRequest request, HttpServletResponse response);
	HashMap<String, Object> updateTempMerchant(HashMap<String, Object> params);
	MemberDto viewApplyMember(HashMap<String, Object> params);
	WorkDto completeMyInfoData(int workSn);
	void changeWorkStatus(HashMap<String, Object> params);
	HashMap<String, Object> updateDeal(HttpServletRequest request, HashMap<String, Object> params);
	int getMemberSn(int workSn);
}
