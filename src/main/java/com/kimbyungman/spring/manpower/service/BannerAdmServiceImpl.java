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

import com.kimbyungman.spring.manpower.dao.BannerDao;
import com.kimbyungman.spring.manpower.dto.BannerDto;
import com.kimbyungman.spring.manpower.dto.Pagination;

@Service
public class BannerAdmServiceImpl extends RootService implements BannerAdmService {
	
	@Autowired
	private BannerDao dao;
	
	@Autowired
	private FileService FileService;
	
	//리스트 페이지 이동 (관리자)
	@Override
	public String listPage(BannerDto searchDto, HttpServletRequest request , Model model) {

		Pagination pagination = new Pagination();
		pagination.setCurrentPageNo(searchDto.getPageIndex());
		pagination.setRecordCountPerPage(100);
		pagination.setPageSize(searchDto.getPageSize());
		
		searchDto.setFirstIndex(pagination.getFirstRecordIndex());
		searchDto.setRecordCountPerPage(100);
		
		List<BannerDto> result = new ArrayList<>();
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
		
		return "admin/banner/list";
		
	};
	
	//등록 페이지 이동 (관리자)
	@Override
	public String insertPage(BannerDto searchDto, HttpServletRequest request, Model model) {return "admin/banner/insert";};

	//등록 (관리자)
	@Override
	public void insertData(BannerDto searchDto, HttpServletRequest request, HttpServletResponse response) {
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile imageFile = multipartRequest.getFile("imageFile");
		
		int fileSeq = FileService.fileUpload(imageFile);
		
		searchDto.setImgFileSeq(fileSeq);
		
		String msg = "등록이 완료되었습니다.";
		String targetLink = "/adm/banner/list";
		
		dao.insertAdmData(searchDto);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};

	//변경 페이지 이동 (관리자)
	@Override
	public String updatePage(BannerDto searchDto, int BannerSn, HttpServletRequest request, Model model) {
		BannerDto viewData = dao.selectAdmViewData(BannerSn);
		
		int fileSeq = viewData.getImgFileSeq();
		
		String[] fileNameList = FileService.getFileName(fileSeq);
		
		viewData.setFileName(fileNameList[0]);
		viewData.setFileOriginName(fileNameList[1]);
		viewData.setFileExt(fileNameList[2]);
		
		model.addAttribute("updateData", viewData);
		
		try {
			searchDto.setQustr();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "admin/banner/update";
	};
	
	//변경 (관리자)
	@Override
	public void updateData(BannerDto searchDto, HttpServletRequest request, HttpServletResponse response) {
		
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
		String targetLink = "/adm/banner/list";
		
		dao.updateAdmData(searchDto);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};
	
	//삭제 (관리자)
	@Override
	public void deleteData(int BannerSn, HttpServletResponse response) {
		
		String msg = "삭제가 완료되었습니다.";
		String targetLink = "/adm/banner/list";
		
		dao.deleteAdmData(BannerSn);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};
	
}
