package com.kimbyungman.spring.manpower.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dto.DealDto;

public interface DealAdmService {
	String listPage(DealDto searchDto, HttpServletRequest request, Model model); //리스트 페이지 이동 (관리자)
}
