package com.kimbyungman.spring.manpower.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kimbyungman.spring.manpower.service.ChattingService;

@Controller
public class ChattingController {
	
	@Autowired
	ChattingService service;
	
	//채팅 생성 (사용자)
	@RequestMapping("/personal/insertChat")
	public @ResponseBody HashMap<String, Object> insertChat(HttpSession session, @RequestBody HashMap<String, Object> params){return service.insertChat(session, params);}
	
	//채팅 페이지 이동 (사용자)
	@RequestMapping("/personal/liveChat")
	public ModelAndView liveChatPage(@RequestParam("chatSn") int ChatSn, Model model) {return service.liveChatPage(ChatSn, model);}
	
	//채팅방 나가기 (사용자)
	@RequestMapping("/personal/exitChat")
	public @ResponseBody HashMap<String, Object> exitChat(@RequestBody HashMap<String,Object> params){return service.exitChat(params);}
}
