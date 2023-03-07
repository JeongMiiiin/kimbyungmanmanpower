package com.kimbyungman.spring.manpower.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dao.NoticeDao;
import com.kimbyungman.spring.manpower.dto.NoticeDto;
import com.kimbyungman.spring.manpower.dto.Pagination;

@Service
public class ServiceCenterServiceImpl extends RootService implements ServiceCenterService {
	
	@Autowired
	private NoticeDao NoticeDao;
	
	public String settingPage(HttpServletRequest request, int tabIdx, Model model){
		
		String result = "";
		
		switch(tabIdx) {
			case 1 : 
				result = "client/personal/serviceCenter/notice";
				NoticeDto searchDto = new NoticeDto();
				
				int pageIndex = request.getParameter("pageIndex") != null ? Integer.parseInt(request.getParameter("pageIndex")) : 1; 
				searchDto.setPageIndex(pageIndex);
				
				Pagination pagination = new Pagination();
				pagination.setCurrentPageNo(searchDto.getPageIndex());
				pagination.setRecordCountPerPage(8);
				pagination.setPageSize(searchDto.getPageSize());
				
				searchDto.setFirstIndex(pagination.getFirstRecordIndex());
				searchDto.setRecordCountPerPage(8);
			
				List<NoticeDto> noticeList = NoticeDao.selectListData(searchDto);
				int totalCnt = NoticeDao.selectTotalCnt(searchDto);
				
				pagination.setTotalRecordCount(totalCnt);
				
				searchDto.setEndDate(pagination.getLastPageNoOnPageList());
				searchDto.setStartDate(pagination.getFirstPageNoOnPageList());
				searchDto.setPrev(pagination.getXprev());
				searchDto.setNext(pagination.getXnext());
				searchDto.setRealEnd(pagination.getRealEnd());

				model.addAttribute("noticeList", noticeList);
				model.addAttribute("searchDto", searchDto);
				model.addAttribute("totCnt",totalCnt);
				model.addAttribute("totalPageCnt",(int)Math.ceil(totalCnt / (double)searchDto.getPageUnit()));
				model.addAttribute("pagination",pagination);
				break;
			case 2 :  result = "client/personal/serviceCenter/appGuide"; break;
			case 3 :  result = "client/personal/serviceCenter/companyInfo"; break;
			case 4 :  result = "client/personal/serviceCenter/termsandPolicy"; break;
			case 5 :  result = "client/personal/serviceCenter/help"; break;
			default : result = "client/personal/serviceCenter/intro"; break;
		}
		return result;
	};
}
