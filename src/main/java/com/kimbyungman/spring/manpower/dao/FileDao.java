package com.kimbyungman.spring.manpower.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface FileDao {
	
	String SERVICE_ID = "file";
	
	int insertFile(HashMap<String,Object> fileInfo);
	String[] getFileName(int fileSeq);
	void delete(int fileSeq);
}
