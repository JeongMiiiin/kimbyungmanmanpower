package com.kimbyungman.spring.manpower.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kimbyungman.spring.manpower.dao.BannerDao;
import com.kimbyungman.spring.manpower.dto.BannerDto;

@Service
public class BannerServiceImpl extends RootService implements BannerService {
	
	@Autowired
	private BannerDao dao;
	
	//배너 리스트 조회 (사용자)
	public List<BannerDto> getList(int categoryNum){return dao.getList(categoryNum);};
}
