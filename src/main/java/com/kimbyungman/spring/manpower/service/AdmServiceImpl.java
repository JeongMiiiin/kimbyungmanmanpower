package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdmServiceImpl extends RootService implements AdmService {
	
	@Autowired
	private MemberAdmService MemberAdmService;
	
	//로그인 페이지 이동 (관리자)
	public String loginPage(HttpServletRequest request) {
		String result = "admin/common/login";
		HttpSession session = request.getSession();
		String loginCheck = (String) session.getAttribute("userId");

		if(loginCheck != null) {result = "admin/member/list";}
		
		return result;
	}
	
	//로그인 시도 (관리자)
	public void loginAction(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("userId");
        String pw = request.getParameter("userPw"); 
		
        HashMap<String, Object> params = new HashMap<String, Object>();
        
        params.put("userId", id);
        params.put("userPw", pw);
        
		boolean loginCheck = MemberAdmService.loginCheck(params);
		
		String msg = "로그인에 실패했습니다. 잠시 후 다시 시도해주세요.";
		String targetLink = "/adm/login";
		
		if( loginCheck ) {
			msg = "로그인에 성공했습니다.";
			targetLink = "/adm/member/list";
			session.setAttribute("userId", id);
		}
			
		makeSubmitAlertMsg(response, msg, targetLink);
		
	};
	
	//로그아웃 (관리자)
	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		request.getSession(true);
		String msg = "로그아웃되었습니다.";
		String targetLink = "/adm/login";
			
		makeSubmitAlertMsg(response, msg, targetLink);
	};
}
