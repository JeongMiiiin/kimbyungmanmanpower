package com.kimbyungman.spring.manpower.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kimbyungman.spring.manpower.dto.DealDto;

@Service
public class DealDaoImpl implements DealDao {
	
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
	public List<DealDto> selectListData(DealDto params){
		List<DealDto> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".selectListData",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public DealDto selectDealData(HashMap<String, Object> params) {
		DealDto result = new DealDto();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectDealData",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	@Override
	public List<DealDto> selectAdmListData(DealDto searchDto){
		List<DealDto> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".selectAdmListData",searchDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public int selectAdmTotalCnt(DealDto searchDto){
		int result = 0;
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectAdmTotalCnt",searchDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
