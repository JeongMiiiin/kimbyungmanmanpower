package com.kimbyungman.spring.manpower.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kimbyungman.spring.manpower.dto.BannerDto;

@Repository
public interface BannerDao {
	
	String SERVICE_ID = "banner";
	
	List<BannerDto> getList(int categoryNum); //사용자 페이지 리스트 노출 함수
	List<BannerDto> selectAdmListData(BannerDto searchDto); //관리자 페이지 리스트 노출 함수
	int selectAdmTotalCnt(BannerDto searchDto); //관리자 페이지 총 건수 함수
	BannerDto selectAdmViewData(int bannerSn); //관리자 페이지 상세 함수
	int insertAdmData(BannerDto params); //관리자 페이지 추가 함수
	int updateAdmData(BannerDto params); //관리자 페이지 업데이트 함수
	int deleteAdmData(int bannerSn); //관리자 페이지 삭제 함수
}
