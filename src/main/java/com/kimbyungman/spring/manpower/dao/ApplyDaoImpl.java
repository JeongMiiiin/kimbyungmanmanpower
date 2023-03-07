package com.kimbyungman.spring.manpower.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kimbyungman.spring.manpower.dto.ApplyDto;

@Service
public class ApplyDaoImpl implements ApplyDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Transactional
	@Override
	public int insertData(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.insert(SERVICE_ID+".insertData",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public int checkDuplicate(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".checkDuplicate",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	@Override
	public List<ApplyDto> selectListData(ApplyDto params){
		List<ApplyDto> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".selectListData",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Transactional
	@Override
	public int changeApplyStatus(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".changeApplyStatus",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
}
