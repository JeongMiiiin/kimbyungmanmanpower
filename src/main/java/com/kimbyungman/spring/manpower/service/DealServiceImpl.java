package com.kimbyungman.spring.manpower.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.google.gson.Gson;

import com.kimbyungman.spring.manpower.dao.DealDao;
import com.kimbyungman.spring.manpower.dto.DealDto;

@Service
public class DealServiceImpl extends RootService implements DealService {
	@Autowired
	private DealDao dao;
	
	@Value("5740969445955017")
	private String impKey;

	@Value("5503014da2fe9a0913c495735d7c63797c717770155fd5002dfccc77eabc985861e52bc2842f3219")
	private String impSecret;
	
	//등록 (사용자)
	@Override
	public int insertData(HashMap<String, Object> params) {return dao.insertData(params);};

	//변경 (사용자)
	@Override
	public int updateData(HashMap<String, Object> params) {
		
		
		int status = (int) params.get("status");
		
		if(status == 2) {
			try {
				paymentCancel(params);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return dao.updateData(params);
	};

	//중복체크 (사용자)
	@Override
	public boolean checkDuplicate(HashMap<String, Object> params) {
		boolean result = false;
		
		int checkCnt = dao.checkDuplicate(params);
		
		if(checkCnt > 0) {result = true;};
		
		return result;
	}
	
	//리스트 조회 (사용자)
	@Override
	public List<DealDto> selectListData(DealDto params){return dao.selectListData(params);};
	
	public String getToken() throws IOException {

		HttpsURLConnection conn = null;

		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JSONObject json = new JSONObject();

		json.put("imp_key", impKey);
		json.put("imp_secret", impSecret);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		
		System.out.println(response);

		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;
	}
	
	public void paymentCancel(HashMap<String, Object> params) throws IOException {
		DealDto cancelData = dao.selectDealData(params);
		
		HttpsURLConnection conn2 = null;
		URL url = new URL("https://api.iamport.kr/payments/cancel");
 
		conn2 = (HttpsURLConnection) url.openConnection();
 
		conn2.setRequestMethod("POST");
 
		conn2.setRequestProperty("Content-type", "application/json");
		conn2.setRequestProperty("Accept", "application/json");
		conn2.setRequestProperty("Authorization", getToken());
 
		conn2.setDoOutput(true);
		
		JSONObject json = new JSONObject();
 
		json.put("reason", "결제취소");
		json.put("imp_uid", cancelData.getImpUid());
		json.put("amount", cancelData.getPayment());
		json.put("checksum", cancelData.getPayment());
 
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn2.getOutputStream()));
 
		bw.write(json.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn2.getInputStream(), "utf-8"));

		BufferedReader rd;
		if(conn2.getResponseCode() >= 200 && conn2.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn2.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		
		br.close();
		conn2.disconnect();
	}
}
