package com.kimbyungman.spring.manpower.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kimbyungman.spring.manpower.service.FileService;

@Controller
@RequestMapping("/file*")
public class FileController {
	
	@Autowired
	private FileService service;
	
	//파일 다운로드 (공통)
	@RequestMapping("/download")
	public void download(@RequestParam("fileSeq") int fileSeq, HttpServletResponse response) {service.download(fileSeq, response);}
	
	//파일 보여주기 (공통)
	@RequestMapping("/display")
	public ResponseEntity<byte[]> display(@RequestParam("fileSeq") int fileSeq) {return service.display(fileSeq);}
	
}
