package com.kimbyungman.spring.manpower.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FavoriteDaoImpl implements FavoriteDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertFavorite(HashMap<String, Object> params) {
		int result = 0;
		try {

			result = sqlSession.insert(SERVICE_ID+".insertFavorite", params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int deleteFavorite(HashMap<String, Object> params) {
		int result = 0;
		try {

			result = sqlSession.update(SERVICE_ID+".deleteFavorite", params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public List<HashMap<String, Object>> getFavoriteList(int memberSn){
		List<HashMap<String, Object>> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".getFavoriteList", memberSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
