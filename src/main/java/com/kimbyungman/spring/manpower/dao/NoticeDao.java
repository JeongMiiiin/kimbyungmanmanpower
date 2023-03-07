package com.kimbyungman.spring.manpower.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kimbyungman.spring.manpower.dto.NoticeDto;

@Repository
public interface NoticeDao {
	
	String SERVICE_ID = "notice";
	
	List<NoticeDto> selectListData(NoticeDto searchDto); //사용자 페이지 리스트 노출 함수
	int selectTotalCnt(NoticeDto searchDto); //사용자 페이지 총 건수 함수
	List<NoticeDto> selectAdmListData(NoticeDto searchDto); //관리자 페이지 리스트 노출 함수
	int selectAdmTotalCnt(NoticeDto searchDto); //관리자 페이지 총 건수 함수
	NoticeDto selectAdmViewData(int noticeSn); //관리자 페이지 상세 함수
	int insertAdmData(NoticeDto params); //관리자 페이지 추가 함수
	int updateAdmData(NoticeDto params); //관리자 페이지 업데이트 함수
	int deleteAdmData(int noticeSn); //관리자 페이지 삭제 함수
}
