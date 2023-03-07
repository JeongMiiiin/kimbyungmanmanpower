package com.kimbyungman.spring.manpower.service;


import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

public interface FileService {
	int fileUpload(MultipartFile mf); //파일 업로드 (공통)
	int fileUploadBase64(String base64); //base64파일 업로드 (공통)
	String[] getFileName(int fileSeq); //파일 이름 데이터 조회 (공통)
	void download(int fileSeq, HttpServletResponse response); //파일 다운로드 (공통)
	ResponseEntity<byte[]> display(int fileSeq); //파일 보여주기 (공통)
	void delete(int fileSeq); //파일 삭제 (공통)
	int createChatTxt(); //채팅 파일 생성 (공통)
	String readChatTxt(int fileSeq); //채팅 파일 읽기 (공통)
	void saveChatText(int fileSeq, int userSn, String name, String sendDate, String message); //채팅 내용 저장 (공통)
	
}
