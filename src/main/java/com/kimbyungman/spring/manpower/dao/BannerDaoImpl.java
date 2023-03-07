package com.kimbyungman.spring.manpower.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kimbyungman.spring.manpower.dto.BannerDto;

@Repository
public class BannerDaoImpl implements BannerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BannerDto> getList(int categoryNum){
		List<BannerDto> result = new ArrayList<>();
		
		try {

			result = sqlSession.selectList(SERVICE_ID+".getList", categoryNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	};
	
	@Override
	public List<BannerDto> selectAdmListData(BannerDto searchDto){
		List<BannerDto> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".selectAdmListData",searchDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public int selectAdmTotalCnt(BannerDto searchDto) {
		int result = 0;
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectAdmTotalCnt",searchDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public BannerDto selectAdmViewData(int bannerSn) {
		BannerDto result = new BannerDto();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectAdmViewData",bannerSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Transactional
	@Override
	public int insertAdmData(BannerDto params) {
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
	public int updateAdmData(BannerDto params) {
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
	public int deleteAdmData(int bannerSn) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".deleteAdmData",bannerSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
}
