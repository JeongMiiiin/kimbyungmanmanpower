package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kimbyungman.spring.manpower.dao.ApplyDao;
import com.kimbyungman.spring.manpower.dto.ApplyDto;

@Service
public class ApplyServiceImpl extends RootService implements ApplyService {
	@Autowired
	private ApplyDao dao;
	
	@Autowired
	private WorkService WorkService;
	
	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private PushService PushService;
	
	//지원내역 추가 (사용자)
	@Override
	public int insertData(HashMap<String, Object> params) {
		//---작성자에게 Push---
		int workSn = (int) params.get("workSn");
		int workWriterSn = WorkService.getMemberSn(workSn);
		HashMap<String, Object> tokenValue = MemberService.getTokenValue(workWriterSn);
		if(tokenValue != null && tokenValue.get("token_id") != null && !((String) tokenValue.get("token_id")).equals("") && Integer.parseInt(String.valueOf(tokenValue.get("notice_agree")))  == 0) {
			HashMap<String, String> pushParams = new HashMap<String, String>();
			pushParams.put("tokenList", (String) tokenValue.get("token_id"));
			pushParams.put("title", "알림");
			pushParams.put("message", "지원내역이 있습니다");
			pushParams.put("intent", "/personal/myInfo/workView?sn=" + workSn + "&pageCategory=recentPost");
			PushService.sendPush(pushParams);
		}
		//---작성자에게 Push---
		
		return dao.insertData(params);
	};
	
	//지원내역 중복체크 (사용자)
	@Override
	public boolean checkDuplicate(HashMap<String, Object> params) {
		boolean result = false;
		
		int checkCnt = dao.checkDuplicate(params);
		if(checkCnt > 0) {result = true;}
		return result;
	}
	
	//지원내역 리스트 조회 (사용자)
	@Override
	public List<ApplyDto> selectListData(ApplyDto params){return dao.selectListData(params);};
	
	//지원상태 변경 (사용자)
	@Override
	public int changeApplyStatus(HashMap<String, Object> params) {return dao.changeApplyStatus(params);};
	
}
