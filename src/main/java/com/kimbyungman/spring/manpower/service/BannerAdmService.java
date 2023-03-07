package com.kimbyungman.spring.manpower.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dto.BannerDto;

public interface BannerAdmService {
	String listPage(BannerDto searchDto, HttpServletRequest request, Model model); //리스트 페이지 이동 (관리자)
	String insertPage(BannerDto searchDto, HttpServletRequest request, Model model); //등록 페이지 이동 (관리자)
	void insertData(BannerDto searchDto, HttpServletRequest request, HttpServletResponse response); //등록 (관리자)
	String updatePage(BannerDto searchDto, int categorySn, HttpServletRequest request, Model model); //변경 페이지 이동 (관리자)
	void updateData(BannerDto searchDto, HttpServletRequest request, HttpServletResponse response); //변경 (관리자)
	void deleteData(int BannerSn, HttpServletResponse response); //삭제 (관리자)
}
