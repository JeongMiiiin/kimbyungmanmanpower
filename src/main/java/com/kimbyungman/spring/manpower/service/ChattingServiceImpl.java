package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.kimbyungman.spring.manpower.dao.ChattingDao;
import com.kimbyungman.spring.manpower.dto.ChattingDto;
import com.kimbyungman.spring.manpower.dto.MemberDto;

@Service
public class ChattingServiceImpl extends RootService implements ChattingService {
	
	@Autowired
	private FileService FileService;
	
	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private PushService PushService;
	
	@Autowired
	private ChattingDao dao;
	
	//채팅 등록 (사용자)
	@Override
	public HashMap<String, Object> insertChat(HttpSession session, HashMap<String, Object> params){
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		ChattingDto data = new ChattingDto(); 
		
		MemberDto memberInfo = (MemberDto) session.getAttribute("memberInfo");
		
		int user1Sn = memberInfo.getSn();
		String user1Name = memberInfo.getName();
		int user2Sn = (int) params.get("receiverSn");
		String user2Name = (String) params.get("receiverName");
		
		data.setUser1Sn(user1Sn);
		data.setUser1Name(user1Name);
		data.setUser2Sn(user2Sn);
		data.setUser2Name(user2Name);
		
		int checkCnt = dao.checkData(data);
		
		if(checkCnt > 0) {
			result.put("result", 0);
			result.put("data", checkCnt);
		} else {
			
			int txtFileSeq = FileService.createChatTxt();
			
			data.setFileSeq(txtFileSeq);
			
			int cnt = dao.insertData(data);
			
			if(cnt > 0) {
				result.put("result", 1);
				result.put("data", cnt);
				} else {
					result.put("result",2);
			}
		}
		
		return result;
	};

	//채팅 페이지 이동 (사용자)
	@Override
	public ModelAndView liveChatPage(int ChatSn, Model model) {
		ModelAndView mv = new ModelAndView();
		
		ChattingDto viewData = dao.viewData(ChatSn);
		
		String pastHistory = FileService.readChatTxt(viewData.getFileSeq());
		
		String[] pastHistoryList = pastHistory.split("\n");

		model.addAttribute("historyList", pastHistoryList);
		
		model.addAttribute("viewData",viewData);
		
		mv.setViewName("client/personal/chatting/page");
		return mv;
	};
	
	//채팅 내용 저장 (사용자)
	@Override
	public void saveChat(int ChatSn, JSONObject obj) {
		
		ChattingDto viewData = dao.viewData(ChatSn);
		int fileSeq = viewData.getFileSeq();
		
		int userSn = Integer.parseInt((String) obj.get("userSn"));
		
		String name = (String) obj.get("userName");
		String sendDate = ((String) obj.get("msg")).split(" time, ")[0];
		String msg = ((String) obj.get("msg")).split(" time, ")[1];
		
		FileService.saveChatText(fileSeq, userSn, name, sendDate, msg);
		
		HashMap<String, Object> recentParams = new HashMap<String, Object>();
		recentParams.put("sn", ChatSn);
		recentParams.put("userSn", userSn);
		recentParams.put("msg", msg);
		
		dao.updateRecentMsg(recentParams);
		
		HashMap<String, Integer> chatParams = dao.getUserSn(ChatSn);
		
		//--- 상대방에게 Push
		int user1Sn = (int) chatParams.get("user1_sn");
		int user2Sn = (int) chatParams.get("user2_sn");
		
		HashMap<String, Object> tokenValue = new HashMap<String, Object>();
		if(userSn == user1Sn) {
			tokenValue = MemberService.getTokenValue(user2Sn);
		} else {
			tokenValue = MemberService.getTokenValue(user1Sn);
		}
		
		if( tokenValue != null && tokenValue.get("token_id") != null && !((String) tokenValue.get("token_id")).equals("") && Integer.parseInt(String.valueOf(tokenValue.get("notice_agree")))  == 0) {
			HashMap<String, String> pushParams = new HashMap<String, String>();
			pushParams.put("tokenList", (String) tokenValue.get("token_id"));
			pushParams.put("title", "알림");
			pushParams.put("message", "새로운 채팅이 있습니다");
			pushParams.put("intent", "/personal/liveChat?chatSn=" + ChatSn);
			
			PushService.sendPush(pushParams);
		}
		//--- 상대방에게 Push		
		
	}
	
	@Override
	public List<ChattingDto> selectListData(int memberSn){
		return dao.selectListData(memberSn);
	};
	
	@Override
	public HashMap<String,Object> exitChat(HashMap<String, Object> params){
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		int userSn = Integer.parseInt(String.valueOf(params.get("userSn")));
		
		if(dao.checkUserSn(params) > 0) {
			params.put("user1Sn", userSn);
		} else {
			params.put("user2Sn", userSn);
		}
		
		int cnt = dao.exitChat(params);
		
		if(cnt > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	};
	
}
