package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kimbyungman.spring.manpower.dao.CategoryDao;

@Service
public class CategoryServiceImpl extends RootService implements CategoryService {
	
	@Autowired
	private CategoryDao dao;
	
	//카테고리 데이터 조회 (사용자)
	@Override
	public List<HashMap<String, Object>> getCategory(){return dao.getCategory();};
}
