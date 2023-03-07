package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;
import java.util.List;

import com.kimbyungman.spring.manpower.dto.DealDto;

public interface DealService {
	int insertData(HashMap<String, Object> params); //등록 (사용자)
	int updateData(HashMap<String, Object> params); //변경 (사용자)
	boolean checkDuplicate(HashMap<String, Object> params); //중복체크 (사용자)
	List<DealDto> selectListData(DealDto params); //리스트 조회 (사용자)
}
