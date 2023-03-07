package com.kimbyungman.spring.manpower.dao;

import java.util.HashMap;
import java.util.List;

import com.kimbyungman.spring.manpower.dto.WorkDto;

public interface WorkDao {
	String SERVICE_ID = "work";
	
	List<WorkDto> selectAdmListData(WorkDto searchDto);
	int selectAdmTotalCnt(WorkDto searchDto);
	WorkDto selectAdmViewData(int WorkSn);
	int deleteAdmData(int WorkSn);
	List<WorkDto> selectListData(WorkDto params);
	int insertData(HashMap<String, Object> params);
	int updateData(HashMap<String, Object> params);
	int deleteData(HashMap<String, Object> params);
	List<HashMap<String, Object>> searchData(HashMap<String, Object> params);
	HashMap<String, Object> viewPopupData(HashMap<String, Object> params);
	WorkDto viewData(int sn);
	List<HashMap<String, Object>> favoriteData(List<Integer> favoriteSnList);
	WorkDto completeMyInfoData(int workSn);
	void changeWorkStatus(HashMap<String, Object> params);
	int getMemberSn(int workSn);
	WorkDto getDataForApp(String merchantUid);
	int updateTempMerchant(HashMap<String,Object> params);
}
