package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dto.BannerDto;
import com.kimbyungman.spring.manpower.dto.MemberDto;

@Service
public class MainServiceImpl extends RootService implements MainService {
	
	@Autowired
	private BannerService BannerService;
	
	@Autowired
	private WorkService WorkService;
	
	@Autowired
	private FavoriteService FavoriteService;
	
	@Autowired
	private MemberService MemberService;
	
	//인트로 페이지 이동 (사용자)
	@Override
	public String goIntro(HttpServletRequest request) {
		String result = "client/common/intro";
		
		String tokenValue = request.getParameter("app_token") != null ? (String) request.getParameter("app_token") : "";
		
		//token값이 있을 때
		if( !tokenValue.equals("") ) {
			MemberDto memberInfo = MemberService.checkToken(tokenValue);
			
			HttpSession session = request.getSession();
			
			session.setAttribute("tokenValue", tokenValue);
			
			//회원정보가 있을 시
			if(memberInfo != null) {
				result = "redirect:/personal/main";
				
				session.setAttribute("memberInfo", memberInfo);
				int memberCategory = memberInfo.getCategory();
				if(memberCategory == 1) {result = "redirect:/business/main";}
			}

		}
		
		return result;
	};
	
	//모바일용 인트로 페이지 이동 (사용자)
	@Override
	public String goIntroFirst(HttpServletRequest request) {
			return "client/common/introFirst";
	}
	
	//개인 메인 페이지 이동 (사용자)
	@Override
	public String personalMain(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		List<BannerDto> MainBannerList = BannerService.getList(0);
		model.addAttribute("MainBannerList", MainBannerList);
		
		List<BannerDto> EventBannerList = BannerService.getList(1);
		model.addAttribute("EventBannerList", EventBannerList);
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("filterMemCategory", "0");
		HashMap<String, Object> workList = WorkService.searchData(params);
		List<HashMap<String, Object>> workData = (List<HashMap<String, Object>>) workList.get("data");
		model.addAttribute("workList", workData);
		
		int memberSn =  session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getSn() : -1; 
		
		List<HashMap<String, Object>> favoriteList = FavoriteService.getFavoriteList(memberSn);
		
		session.setAttribute("favoriteList", favoriteList);
		
		return "client/personal/main/main";
	}
	
	//기업/단체 메인 페이지 이동 (사용자)
	@Override
	public String businessMain(HttpServletRequest request, Model model) {
		
		List<BannerDto> MainBannerList = BannerService.getList(2);
		model.addAttribute("MainBannerList", MainBannerList);
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("filterMemCategory", "1");
		HashMap<String, Object> workList = WorkService.searchData(params);
		List<HashMap<String, Object>> workData = (List<HashMap<String, Object>>) workList.get("data");
		model.addAttribute("workList", workData);
		
		return "client/business/main/main";
	}
}
