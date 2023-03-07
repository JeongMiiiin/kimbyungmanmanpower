package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dto.CategoryDto;

public interface CategoryAdmService {
	String listPage(CategoryDto searchDto, HttpServletRequest request, Model model); //리스트 페이지 이동 (관리자)
	String insertPage(CategoryDto searchDto, HttpServletRequest request, Model model); //등록 페이지 이동 (관리자)
	void insertData(CategoryDto searchDto, HttpServletResponse response); //등록 (관리자)
	String updatePage(CategoryDto searchDto, int categorySn, HttpServletRequest request, Model model); //변경 페이지 이동 (관리자)
	void updateData(CategoryDto searchDto, HttpServletResponse response); //변경 (관리자)
	void deleteData(int categorySn, HttpServletResponse response); //삭제 (관리자)
	HashMap<String, Object> updateStatus(HashMap<String, Object> params); //상태 변경 (관리자)
}
