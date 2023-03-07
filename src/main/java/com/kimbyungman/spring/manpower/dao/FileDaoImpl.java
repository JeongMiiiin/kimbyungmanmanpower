package com.kimbyungman.spring.manpower.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository // 현재 클래스를 dao bean으로 등록
public class FileDaoImpl implements FileDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Transactional
	@Override
	public int insertFile(HashMap<String,Object> fileInfo) {
		
		int result = -1;
		
		try {

			sqlSession.insert(SERVICE_ID+".insertFile", fileInfo);
			
			result = Integer.parseInt(String.valueOf(fileInfo.get("sn")));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	};
	
	public String[] getFileName(int fileSeq) {
		String[] result = new String[3];
		
		try {
			result[0] = sqlSession.selectOne(SERVICE_ID+".getFileName", fileSeq);
			result[1] = sqlSession.selectOne(SERVICE_ID+".getFileOriginName", fileSeq);
			result[2] = sqlSession.selectOne(SERVICE_ID+".getFileExt", fileSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	};
	
	@Transactional
	@Override
	public void delete(int fileSeq) {
		try {
			sqlSession.delete(SERVICE_ID+".deleteFile", fileSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 
	
}
