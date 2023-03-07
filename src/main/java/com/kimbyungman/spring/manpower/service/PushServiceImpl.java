package com.kimbyungman.spring.manpower.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class PushServiceImpl implements PushService {
	
	private final String sendUrlVal = "https://fcm.googleapis.com/fcm/send";
	private final String apiKeyValue = "AAAAkvQg3jM:APA91bFOWTcRcWthLikPV28XDpHz_TwIMoTcxEsbbmH79e_DyT3fLmI8Sv_sO5eaBENic2Ag2nnzqJ27diRhggHV7Yo5odlb_1C_QsiuMAOFk8FviA_Wuj5D0GnuJrT_IQT58BNj6AlH";
	private final String urlVal = "https://yusinsolution.com";
	
	@SuppressWarnings("unchecked")
	@Override
	public void sendPush(HashMap<String, String> params) {
		StringBuilder urlBuilder = new StringBuilder(sendUrlVal);
		try {
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setRequestProperty("Authorization", "key=" + apiKeyValue);
			conn.setRequestProperty("Content-type", "application/json"); 
			
			JSONObject apiParams = new JSONObject();
			JSONObject dataParams = new JSONObject();
			JSONObject notificationParams = new JSONObject();
			
			String tokenList = params.get("tokenList");
			
			apiParams.put("to", tokenList);
			
			String title = params.get("title");
			
			dataParams.put("title", title);
			notificationParams.put("title", title);
			
			String message = params.get("message");

			dataParams.put("message", message);
			notificationParams.put("body", message);
			
			String intent = params.get("intent");
			
			dataParams.put("intent", urlVal + intent);
			
			notificationParams.put("badge", 1);
			
			apiParams.put("data", dataParams);
			apiParams.put("notification", notificationParams);
			
			
			System.out.println(apiParams.toString());
			
			OutputStreamWriter wr= new OutputStreamWriter(conn.getOutputStream());
			wr.write( apiParams.toString());
			wr.close();
			
			conn.connect();
			
			BufferedReader rd;
			StringBuilder sb = new StringBuilder();
			
			
			 if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			        rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			    } else {
			        rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			    }
			    sb = new StringBuilder();
			    String line;
			    while ((line = rd.readLine()) != null) {
			        sb.append(line);
			    }
			    rd.close();
			    conn.disconnect();
			    
			    System.out.println("응답값 : " + sb.toString());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
