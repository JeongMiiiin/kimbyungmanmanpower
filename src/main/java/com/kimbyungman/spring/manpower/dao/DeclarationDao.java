package com.kimbyungman.spring.manpower.dao;

import java.util.HashMap;
import java.util.List;

import com.kimbyungman.spring.manpower.dto.DeclarationDto;

public interface DeclarationDao {
	String SERVICE_ID = "declaration";

	List<DeclarationDto> selectAdmListData(DeclarationDto searchDto);
	int selectAdmTotalCnt(DeclarationDto searchDto);
	int insertData(HashMap<String, Object> params);
	int selectData(HashMap<String, Object> params);
	int cancelData(HashMap<String, Object> params);
	int updateStatus(HashMap<String, Object> params);
}
