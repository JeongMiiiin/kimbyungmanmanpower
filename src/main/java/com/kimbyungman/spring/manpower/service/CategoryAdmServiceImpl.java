package com.kimbyungman.spring.manpower.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dao.CategoryDao;
import com.kimbyungman.spring.manpower.dto.CategoryDto;
import com.kimbyungman.spring.manpower.dto.Pagination;

@Service
public class CategoryAdmServiceImpl extends RootService implements CategoryAdmService {
	
	@Autowired
	private CategoryDao dao;
	
	//리스트 페이지 이동 (관리자)
	@Override
	public String listPage(CategoryDto searchDto, HttpServletRequest request , Model model) {

		Pagination pagination = new Pagination();
		pagination.setCurrentPageNo(searchDto.getPageIndex());
		pagination.setRecordCountPerPage(100);
		pagination.setPageSize(searchDto.getPageSize());
		
		searchDto.setFirstIndex(pagination.getFirstRecordIndex());
		searchDto.setRecordCountPerPage(100);
		
		List<CategoryDto> result = new ArrayList<>();
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
		
		return "admin/category/list";
		
	};
	
	//등록 페이지 이동 (관리자)
	@Override
	public String insertPage(CategoryDto searchDto, HttpServletRequest request, Model model) {return "admin/category/insert";};
	
	//등록 (관리자)
	@Override
	public void insertData(CategoryDto searchDto, HttpServletResponse response) {
		String msg = "등록이 완료되었습니다.";
		String targetLink = "/adm/category/list";
		
		dao.insertAdmData(searchDto);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};
	
	//변경 페이지 이동 (관리자)
	@Override
	public String updatePage(CategoryDto searchDto, int categorySn, HttpServletRequest request, Model model) {
		CategoryDto viewData = dao.selectAdmViewData(categorySn);
		model.addAttribute("updateData", viewData);
		
		try {
			searchDto.setQustr();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "admin/category/update";
	};
	
	//변경 (관리자)
	@Override
	public void updateData(CategoryDto searchDto, HttpServletResponse response) {
		String msg = "변경이 완료되었습니다.";
		String targetLink = "/adm/category/list";
		
		dao.updateAdmData(searchDto);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};
	
	//삭제 (관리자)
	@Override
	public void deleteData(int categorySn, HttpServletResponse response) {
		
		String msg = "삭제가 완료되었습니다.";
		String targetLink = "/adm/category/list";
		
		dao.deleteAdmData(categorySn);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};
	
	//상태변경 (관리자)
	@Override
	public HashMap<String, Object> updateStatus(HashMap<String, Object> params){
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("result", false);
		
		int data = dao.updateAdmStatus(params);
		
		if (data > 0) {result.put("result", true);}
		
		return result;
		
	};
	
}
