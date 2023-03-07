package com.kimbyungman.spring.manpower.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dto.NoticeDto;

public interface NoticeAdmService {
	String listPage(NoticeDto searchDto, HttpServletRequest request, Model model);
	String insertPage(NoticeDto searchDto, HttpServletRequest request, Model model);
	void insertData(NoticeDto searchDto, HttpServletRequest request, HttpServletResponse response);
	String updatePage(NoticeDto searchDto, int noticeSn, HttpServletRequest request, Model model);
	void updateData(NoticeDto searchDto, HttpServletRequest request, HttpServletResponse response);
	void deleteData(int noticeSn, HttpServletResponse response);
}
