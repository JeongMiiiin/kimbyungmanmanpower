package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dto.DeclarationDto;

public interface DeclarationAdmService {
	String listPage(DeclarationDto searchDto, HttpServletRequest request, Model model); //리스트 페이지 이동 (관리자)
	boolean updateStatus(HashMap<String, Object> params); //상태 변경 (관리자)
}
