package com.kimbyungman.spring.manpower.dao;

import java.util.HashMap;
import java.util.List;

import com.kimbyungman.spring.manpower.dto.DealDto;

public interface DealDao {
	String SERVICE_ID = "deal";
	
	int insertData(HashMap<String, Object> params);
	int updateData(HashMap<String, Object> params);
	int checkDuplicate(HashMap<String, Object> params);
	List<DealDto> selectListData(DealDto params);
	DealDto selectDealData(HashMap<String, Object> params);
	List<DealDto> selectAdmListData(DealDto searchDto); //관리자 페이지 리스트 노출 함수
	int selectAdmTotalCnt(DealDto searchDto); //관리자 페이지 총 건수 함수
}
