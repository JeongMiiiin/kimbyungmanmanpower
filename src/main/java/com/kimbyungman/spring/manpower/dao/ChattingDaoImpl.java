package com.kimbyungman.spring.manpower.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kimbyungman.spring.manpower.dto.ChattingDto;

@Repository
public class ChattingDaoImpl implements ChattingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Transactional
	@Override
	public int insertData(ChattingDto Data) {
		int result = 0;
		
		try {
			sqlSession.insert(SERVICE_ID+".insertData",Data);
			result = Data.getSn();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public List<ChattingDto> selectListData(int memberSn){
		List<ChattingDto> result = new ArrayList<>();
		try {
			result = sqlSession.selectList(SERVICE_ID+".selectListData",memberSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	};
	
	@Override
	public ChattingDto viewData(int ChatSn) {
		ChattingDto result = new ChattingDto();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".viewData",ChatSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public int checkData(ChattingDto Data) {
		int result = 0;
		
		try {
			HashMap<String, Object> tempResult = sqlSession.selectOne(SERVICE_ID+".checkData",Data);
			if(tempResult != null) {
				result = (int) tempResult.get("sn"); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public void updateRecentMsg(HashMap<String, Object> params) {
		try {
			sqlSession.update(SERVICE_ID+".updateRecentMsg",params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	};
	
	@Override
	public int checkUserSn(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".checkUserSn",params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Transactional
	@Override
	public int exitChat(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".exitChat",params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public HashMap<String, Integer> getUserSn(int ChatSn){
		HashMap<String, Integer> result = new HashMap<String, Integer>();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".getUserSn",ChatSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
