package com.kimbyungman.spring.manpower.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dto.NoticeDto;

public interface NoticeService {
	String listPage(NoticeDto searchDto, HttpServletRequest request, Model model);
}
