package com.kimbyungman.spring.manpower.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kimbyungman.spring.manpower.dao.BannerDao;
import com.kimbyungman.spring.manpower.dao.WorkDao;
import com.kimbyungman.spring.manpower.dto.BannerDto;
import com.kimbyungman.spring.manpower.dto.MemberDto;
import com.kimbyungman.spring.manpower.dto.Pagination;
import com.kimbyungman.spring.manpower.dto.WorkDto;

@Service
public class WorkAdmServiceImpl extends RootService implements WorkAdmService {
	
	@Autowired
	private WorkDao dao;
	
	@Autowired
	private FileService FileService;
	
	@Override
	public String listPage(WorkDto searchDto, HttpServletRequest request , Model model) {

		Pagination pagination = new Pagination();
		pagination.setCurrentPageNo(searchDto.getPageIndex());
		pagination.setRecordCountPerPage(100);
		pagination.setPageSize(searchDto.getPageSize());
		
		searchDto.setFirstIndex(pagination.getFirstRecordIndex());
		searchDto.setRecordCountPerPage(100);
		
		List<WorkDto> result = new ArrayList<>();
		int totalCnt = 0;
		
		result = dao.selectAdmListData(searchDto);
		totalCnt = dao.selectAdmTotalCnt(searchDto);
		
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
		
		return "admin/work/list";
		
	};
	
	@Override
	public String viewPage(int WorkSn, HttpServletRequest request, Model model) {
		
		WorkDto viewData = dao.selectAdmViewData(WorkSn);
		
		model.addAttribute("viewData", viewData);
		
		return "admin/work/view";
	};
	
	@Override
	public void deleteData(int WorkSn, HttpServletResponse response) {
		
		String msg = "삭제가 완료되었습니다.";
		String targetLink = "/adm/work/list";
		
		dao.deleteAdmData(WorkSn);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};
}
