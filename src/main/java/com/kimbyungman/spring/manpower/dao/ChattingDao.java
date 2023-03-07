package com.kimbyungman.spring.manpower.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kimbyungman.spring.manpower.dto.ChattingDto;

@Repository
public interface ChattingDao {
	
	String SERVICE_ID = "chatting";
	
	int insertData(ChattingDto Data);
	List<ChattingDto> selectListData(int memberSn);
	ChattingDto viewData(int ChatSn);
	int checkData(ChattingDto Data);
	void updateRecentMsg(HashMap<String, Object> params);
	int checkUserSn(HashMap<String, Object> params);
	int exitChat(HashMap<String, Object> params);
	HashMap<String, Integer> getUserSn(int ChatSn);
}
