package com.kimbyungman.spring.manpower.dao;

import java.util.HashMap;
import java.util.List;

import com.kimbyungman.spring.manpower.dto.AppealDto;

public interface AppealDao {
	String SERVICE_ID = "appeal";
	
	List<AppealDto> selectListData(int memberSn);
	int insertData(HashMap<String, Object> params);
	int updateData(HashMap<String, Object> params);
	int deleteData(HashMap<String, Object> params);
}
