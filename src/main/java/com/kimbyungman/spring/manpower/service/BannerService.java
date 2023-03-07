package com.kimbyungman.spring.manpower.service;

import java.util.List;

import com.kimbyungman.spring.manpower.dto.BannerDto;

public interface BannerService {
	List<BannerDto> getList(int categoryNum); //배너 리스트 조회 (사용자)
}
