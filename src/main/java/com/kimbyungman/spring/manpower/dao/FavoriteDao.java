package com.kimbyungman.spring.manpower.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface FavoriteDao {
	
	String SERVICE_ID = "favorite";
	
	int insertFavorite(HashMap<String, Object> params);
	int deleteFavorite(HashMap<String, Object> params);
	List<HashMap<String, Object>> getFavoriteList(int memberSn);
}
