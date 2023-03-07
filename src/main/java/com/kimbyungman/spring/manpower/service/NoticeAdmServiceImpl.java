package com.kimbyungman.spring.manpower.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kimbyungman.spring.manpower.dao.NoticeDao;
import com.kimbyungman.spring.manpower.dto.NoticeDto;
import com.kimbyungman.spring.manpower.dto.Pagination;

@Service
public class NoticeAdmServiceImpl extends RootService implements NoticeAdmService {
	
	@Autowired
	private NoticeDao dao;
	
	@Autowired
	private FileService FileService;
	
	@Override
	public String listPage(NoticeDto searchDto, HttpServletRequest request, Model model) {
		Pagination pagination = new Pagination();
		pagination.setCurrentPageNo(searchDto.getPageIndex());
		pagination.setRecordCountPerPage(100);
		pagination.setPageSize(searchDto.getPageSize());
		
		searchDto.setFirstIndex(pagination.getFirstRecordIndex());
		searchDto.setRecordCountPerPage(100);
		
		List<NoticeDto> result = new ArrayList<>();
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
		
		return "admin/notice/list";
	};
	
	@Override
	public String insertPage(NoticeDto searchDto, HttpServletRequest request, Model model) {
		return "admin/notice/insert";
	};
	
	@Override
	public void insertData(NoticeDto searchDto, HttpServletRequest request, HttpServletResponse response) {
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile imageFile = multipartRequest.getFile("imageFile");
		
		int fileSeq = FileService.fileUpload(imageFile);
		
		searchDto.setImgFileSeq(fileSeq);
		
		String msg = "등록이 완료되었습니다.";
		String targetLink = "/adm/notice/list";
		
		dao.insertAdmData(searchDto);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};
	
	@Override
	public String updatePage(NoticeDto searchDto, int categorySn, HttpServletRequest request, Model model) {
		NoticeDto viewData = dao.selectAdmViewData(categorySn);
		model.addAttribute("updateData", viewData);
		
		try {
			searchDto.setQustr();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "admin/notice/update";
	};
	
	@Override
	public void updateData(NoticeDto searchDto, HttpServletRequest request, HttpServletResponse response) {
		
String imageFileSeq = String.valueOf(searchDto.getImgFileSeq());
		
		String deleteFileSeqList = request.getParameter("deleteFileSeqList");
		
		if(deleteFileSeqList.contains(imageFileSeq)) {
			
			FileService.delete(searchDto.getImgFileSeq());
			
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile imageFile = multipartRequest.getFile("imageFile");
			
			int fileSeq = FileService.fileUpload(imageFile);
			searchDto.setImgFileSeq(fileSeq);
		}
		
		String msg = "변경이 완료되었습니다.";
		String targetLink = "/adm/notice/list";
		
		dao.updateAdmData(searchDto);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};
	
	@Override
	public void deleteData(int noticeSn, HttpServletResponse response) {
		
		String msg = "삭제가 완료되었습니다.";
		String targetLink = "/adm/notice/list";
		
		dao.deleteAdmData(noticeSn);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};
}
