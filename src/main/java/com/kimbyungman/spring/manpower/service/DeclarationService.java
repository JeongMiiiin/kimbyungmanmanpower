package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface DeclarationService {
	HashMap<String, Object> insertData(HttpServletRequest request, HashMap<String, Object> params); //등록 (사용자)
	HashMap<String, Object> cancelData(HashMap<String, Object> params); //취소 (사용자)
}
