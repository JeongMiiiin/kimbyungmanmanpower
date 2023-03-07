package com.kimbyungman.spring.manpower.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dto.WorkDto;

public interface WorkAdmService {
	String listPage(WorkDto searchDto, HttpServletRequest request, Model model);
	String viewPage(int WorkSn, HttpServletRequest request, Model model);
	void deleteData(int WorkSn, HttpServletResponse response);
}
