package com.kimbyungman.spring.manpower.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kimbyungman.spring.manpower.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<NoticeDto> selectListData(NoticeDto searchDto){
		List<NoticeDto> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".selectListData", searchDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public int selectTotalCnt(NoticeDto searchDto) {
		int result = 0;
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectTotalCnt", searchDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public List<NoticeDto> selectAdmListData(NoticeDto searchDto){
		List<NoticeDto> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".selectAdmListData",searchDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public int selectAdmTotalCnt(NoticeDto searchDto) {
		int result = 0;
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectAdmTotalCnt",searchDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public NoticeDto selectAdmViewData(int noticeSn) {
		NoticeDto result = new NoticeDto();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectAdmViewData",noticeSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Transactional
	@Override
	public int insertAdmData(NoticeDto params) {
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
	public int updateAdmData(NoticeDto params) {
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
	public int deleteAdmData(int noticeSn) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".deleteAdmData",noticeSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
}
