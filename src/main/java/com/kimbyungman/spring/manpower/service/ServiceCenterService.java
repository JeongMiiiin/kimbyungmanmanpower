package com.kimbyungman.spring.manpower.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ServiceCenterService {
	String settingPage(HttpServletRequest request, int tabIdx, Model model);
}
