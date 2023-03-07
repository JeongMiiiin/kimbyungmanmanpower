package com.kimbyungman.spring.manpower.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dao.DeclarationDao;
import com.kimbyungman.spring.manpower.dto.DeclarationDto;
import com.kimbyungman.spring.manpower.dto.Pagination;

@Service
public class DeclarationAdmServiceImpl extends RootService implements DeclarationAdmService {
	@Autowired
	private DeclarationDao dao;
	
	@Autowired
	private ApplyService ApplyService;
	
	@Autowired
	private MemberAdmService MemberAdmService;
	
	@Autowired
	private WorkService WorkService; 
	
	@Autowired
	private DealService DealService;
	
	//리스트 페이지 이동 (관리자)
	@Override
	public String listPage(DeclarationDto searchDto, HttpServletRequest request, Model model) {
		Pagination pagination = new Pagination();
		pagination.setCurrentPageNo(searchDto.getPageIndex());
		pagination.setRecordCountPerPage(100);
		pagination.setPageSize(searchDto.getPageSize());
		
		searchDto.setFirstIndex(pagination.getFirstRecordIndex());
		searchDto.setRecordCountPerPage(100);
		
		List<DeclarationDto> result = new ArrayList<>();
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
		
		return "admin/declaration/list";
	};
	
	//상태 변경 (관리자)
	@Override
	public boolean updateStatus(HashMap<String, Object> params) {
		boolean result = false;
		
		int declarationCnt = dao.updateStatus(params);
		
		//변경 시
		if(declarationCnt > 0) {
			int status = (int) params.get("status");
			
			if(status == 1) {
				//승인 시
				
				params.put("status", 4);
				WorkService.changeWorkStatus(params);
				MemberAdmService.updateDeclaration(params);
				
				//지급취소가 됨
				params.put("status", 2);
				DealService.updateData(params);
				
			} else {
				//거절 시
				params.put("status", 1);
				WorkService.changeWorkStatus(params);
				ApplyService.changeApplyStatus(params);
			}
			
			result = true;
		}

		return result;
	};
}
