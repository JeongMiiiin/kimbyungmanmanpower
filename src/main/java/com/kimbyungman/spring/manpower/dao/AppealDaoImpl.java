package com.kimbyungman.spring.manpower.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kimbyungman.spring.manpower.dto.AppealDto;

@Service
public class AppealDaoImpl implements AppealDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<AppealDto> selectListData(int memberSn){
		List<AppealDto> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".selectListData",memberSn);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
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
	
	@Transactional
	@Override
	public int updateData(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".updateData",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Transactional
	@Override
	public int deleteData(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".deleteData",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
