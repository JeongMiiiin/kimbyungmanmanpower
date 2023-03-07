package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.kimbyungman.spring.manpower.dto.ChattingDto;

public interface ChattingService {
	HashMap<String, Object> insertChat(HttpSession session, HashMap<String, Object> params); //채팅 등록 (사용자)
	ModelAndView liveChatPage(int ChatSn, Model model); //채팅 페이지 이동 (사용자)
	void saveChat(int ChatSn, JSONObject obj); //채팅 내용 저장 (사용자)
	List<ChattingDto> selectListData(int memberSn); //채팅 리스트 데이터 조회 (사용자)
	HashMap<String,Object> exitChat(HashMap<String, Object> params); //채팅 나가기 (사용자)
}
