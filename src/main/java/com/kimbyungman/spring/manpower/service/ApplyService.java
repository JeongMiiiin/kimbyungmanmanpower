package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;
import java.util.List;

import com.kimbyungman.spring.manpower.dto.ApplyDto;

public interface ApplyService {
	int insertData(HashMap<String, Object> params); //지원내역 추가 (사용자)
	boolean checkDuplicate(HashMap<String, Object> params); //지원내역 중복체크 (사용자)
	List<ApplyDto> selectListData(ApplyDto params); //지원내역 리스트 조회 (사용자)
	int changeApplyStatus(HashMap<String, Object> params); //지원상태 변경 (사용자)
}
