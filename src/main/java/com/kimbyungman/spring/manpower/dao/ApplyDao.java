package com.kimbyungman.spring.manpower.dao;

import java.util.HashMap;
import java.util.List;

import com.kimbyungman.spring.manpower.dto.ApplyDto;

public interface ApplyDao {
	String SERVICE_ID = "apply";
	
	int insertData(HashMap<String, Object> params);
	int checkDuplicate(HashMap<String, Object> params);
	List<ApplyDto> selectListData(ApplyDto params);
	int changeApplyStatus(HashMap<String, Object> params);
}
