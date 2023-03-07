package com.kimbyungman.spring.manpower.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kimbyungman.spring.manpower.dto.CategoryDto;

@Repository
public interface CategoryDao {
	
	String SERVICE_ID = "category";
	
	List<HashMap<String, Object>> getCategory(); //사용자 페이지 리스트 노출 함수
	List<CategoryDto> selectAdmListData(CategoryDto searchDto); //관리자 페이지 리스트 노출 함수
	int selectAdmTotalCnt(CategoryDto searchDto); //관리자 페이지 총 건수 함수
	CategoryDto selectAdmViewData(int categorySn); //관리자 페이지 상세 함수
	int insertAdmData(CategoryDto params); //관리자 페이지 추가 함수
	int updateAdmData(CategoryDto params); //관리자 페이지 업데이트 함수
	int deleteAdmData(int categorySn); //관리자 페이지 삭제 함수
	int updateAdmStatus(HashMap<String, Object> params); //관리자 페이지 상태변경 함수
}
