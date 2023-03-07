package com.kimbyungman.spring.manpower.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kimbyungman.spring.manpower.dto.CategoryDto;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<HashMap<String, Object>> getCategory(){
		List<HashMap<String, Object>> result = new ArrayList<>();
		
		try {

			result = sqlSession.selectList(SERVICE_ID+".getCategory");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	};
	
	@Override
	public List<CategoryDto> selectAdmListData(CategoryDto searchDto){
		List<CategoryDto> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".selectAdmListData",searchDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public int selectAdmTotalCnt(CategoryDto searchDto) {
		int result = 0;
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectAdmTotalCnt",searchDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public CategoryDto selectAdmViewData(int categorySn) {
		CategoryDto result = new CategoryDto();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectAdmViewData",categorySn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Transactional
	@Override
	public int insertAdmData(CategoryDto params) {
		int result = 0;
		
		try {
			result = sqlSession.insert(SERVICE_ID+".insertAdmData",params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Transactional
	@Override
	public int updateAdmData(CategoryDto params) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".updateAdmData",params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Transactional
	@Override
	public int deleteAdmData(int categorySn) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".deleteAdmData",categorySn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Transactional
	@Override
	public int updateAdmStatus(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".updateAdmStatus",params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
}
