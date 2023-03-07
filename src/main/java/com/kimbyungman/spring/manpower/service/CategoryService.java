package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;
import java.util.List;

public interface CategoryService {
	List<HashMap<String, Object>> getCategory(); //카테고리 데이터 조회 (사용자)
}
