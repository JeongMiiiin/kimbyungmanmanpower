package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kimbyungman.spring.manpower.dao.DeclarationDao;
import com.kimbyungman.spring.manpower.dto.MemberDto;

@Service
public class DeclarationServiceImpl extends RootService implements DeclarationService {
	@Autowired
	private DeclarationDao dao;
	
	@Autowired
	private ApplyService ApplyService;
	
	@Autowired
	private WorkService WorkService;
	
	@Autowired
	private DealService DealService;
	
	//등록 (사용자)
	@Override
	public HashMap<String, Object> insertData(HttpServletRequest request, HashMap<String, Object> params) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("result", false);
		
		HttpSession session = request.getSession();
		
		int memberSn = ((MemberDto) session.getAttribute("memberInfo")).getSn();
		
		params.put("memberSn", memberSn);
		
		int cnt = dao.insertData(params);
		
		//등록시
		if(cnt > 0) {
			params.put("status", 3);
			WorkService.changeWorkStatus(params);
			ApplyService.changeApplyStatus(params);
			
			result.put("result", true);
		}
		
		return result;
	};

	//취소 (사용자)
	@Override
	public HashMap<String, Object> cancelData(HashMap<String, Object> params) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int sn = dao.selectData(params);
		
		params.put("sn", sn);
		
		int cnt = dao.cancelData(params);
		
		if(cnt > 0) {
			params.put("status", 1);
			WorkService.changeWorkStatus(params);
			ApplyService.changeApplyStatus(params);
			
			
			HashMap<String, Object> dealParams = new HashMap<String, Object>();
			dealParams.put("status", 0);
			dealParams.put("workSn", Integer.parseInt(String.valueOf(params.get("workSn"))) );
			dealParams.put("recipientSn", Integer.parseInt(String.valueOf(params.get("memberSn"))) );
			
			DealService.updateData(dealParams);
			//------ 다시 결제가 되야함
			
			//------ 다시 결제가 되야함
			
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	};
}
