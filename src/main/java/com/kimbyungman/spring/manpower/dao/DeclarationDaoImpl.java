package com.kimbyungman.spring.manpower.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kimbyungman.spring.manpower.dto.DeclarationDto;

@Service
public class DeclarationDaoImpl implements DeclarationDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<DeclarationDto> selectAdmListData(DeclarationDto searchDto){
		List<DeclarationDto> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".selectAdmListData",searchDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public int selectAdmTotalCnt(DeclarationDto searchDto) {
		int result = 0;
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectAdmTotalCnt",searchDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
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
	};
	
	@Override
	public int selectData(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectData",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Transactional
	@Override
	public int cancelData(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".cancelData",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Transactional
	@Override
	public int updateStatus(HashMap<String, Object> params) {
		int result = 0;
		try {
			result = sqlSession.update(SERVICE_ID+".updateStatus",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
