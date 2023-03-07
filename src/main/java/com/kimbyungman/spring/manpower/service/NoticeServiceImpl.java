package com.kimbyungman.spring.manpower.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dao.NoticeDao;
import com.kimbyungman.spring.manpower.dto.NoticeDto;
import com.kimbyungman.spring.manpower.dto.Pagination;

@Service
public class NoticeServiceImpl extends RootService implements NoticeService {
	
	@Autowired
	private NoticeDao dao;
	
	@Override
	public String listPage(NoticeDto searchDto, HttpServletRequest request, Model model) {
		Pagination pagination = new Pagination();
		pagination.setCurrentPageNo(searchDto.getPageIndex());
		pagination.setRecordCountPerPage(8);
		pagination.setPageSize(searchDto.getPageSize());
		
		searchDto.setFirstIndex(pagination.getFirstRecordIndex());
		searchDto.setRecordCountPerPage(8);
		
		List<NoticeDto> result = new ArrayList<>();
		int totalCnt = 0;
		
		result = dao.selectListData();
		totalCnt = dao.selectTotalCnt();
		
		pagination.setTotalRecordCount(totalCnt);

		searchDto.setEndDate(pagination.getLastPageNoOnPageList());
		searchDto.setStartDate(pagination.getFirstPageNoOnPageList());
		searchDto.setPrev(pagination.getXprev());
		searchDto.setNext(pagination.getXnext());
		searchDto.setRealEnd(pagination.getRealEnd());

		model.addAttribute("resultList", result);
		model.addAttribute("totCnt",totalCnt);
		model.addAttribute("totalPageCnt",(int)Math.ceil(totalCnt / (double)searchDto.getPageUnit()));
		model.addAttribute("pagination",pagination);
		
		try {
			searchDto.setQustr();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "client/notice/list";
	};
}
