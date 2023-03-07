package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;

public interface AligoMsgService {
	int sendKakaoTalk(HashMap<String, Object> params);	//카카오톡 알림톡 API 호출
	int sendMsg(HashMap<String, Object> params); //문자메세지 API 호출
}
