package com.kimbyungman.spring.manpower.chat.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kimbyungman.spring.manpower.service.ChattingService;

@Component
public class SocketHandler extends TextWebSocketHandler {
	
	@Autowired
	ChattingService ChattingService;
	
	//HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
	List<HashMap<String, Object>> rls = new ArrayList<>(); //웹소켓 세션을 담아둘 리스트 ---roomListSession
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		//메시지 발송
		String msg = message.getPayload();
		JSONObject obj = jsonToObjectParser(msg);
		
		String sn = (String) obj.get("chatSn");
		HashMap<String, Object> temp = new HashMap<String, Object>();
		if(rls.size() > 0) {
			for(int i=0; i<rls.size(); i++) {
				String roomNumber = (String) rls.get(i).get("chatSn"); //세션리스트의 저장된 방번호를 가져와서
				if(roomNumber.equals(sn)) { //같은값의 방이 존재한다면
					temp = rls.get(i); //해당 방번호의 세션리스트의 존재하는 모든 object값을 가져온다.
					break;
				}
			}
			
			//해당 방의 세션들만 찾아서 메시지를 발송해준다.
			for(String k : temp.keySet()) { 
				if(k.equals("chatSn")) { //다만 방번호일 경우에는 건너뛴다.
					continue;
				}
				
				WebSocketSession wss = (WebSocketSession) temp.get(k);
				if(wss != null) {
					try {
						int ChatSn = Integer.parseInt(sn);
						
						boolean receiveStatus = obj.get("receiveStatus") != null ? true : false;
						
						if( !receiveStatus ) {
							ChattingService.saveChat(ChatSn, obj);
							obj.put("receiveStatus", true);
						}
						
						wss.sendMessage(new TextMessage(obj.toJSONString()));
						
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//소켓 연결
		super.afterConnectionEstablished(session);
		boolean flag = false;
		String url = session.getUri().toString();
		System.out.println(url);
		String chatSn = url.split("/chating/")[1];
		int idx = rls.size(); //방의 사이즈를 조사한다.
		if(rls.size() > 0) {
			for(int i=0; i<rls.size(); i++) {
				String rN = (String) rls.get(i).get("chatSn");
				if(rN.equals(chatSn)) {
					flag = true;
					idx = i;
					break;
				}
			}
		}
		
		if(flag) { //존재하는 방이라면 세션만 추가한다.
			HashMap<String, Object> map = rls.get(idx);
			map.put(session.getId(), session);
		}else { //최초 생성하는 방이라면 방번호와 세션을 추가한다.
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("chatSn", chatSn);
			map.put(session.getId(), session);
			rls.add(map);
		}
		
		//세션등록이 끝나면 발급받은 세션ID값의 메시지를 발송한다.
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		session.sendMessage(new TextMessage(obj.toJSONString()));
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//소켓 종료
		if(rls.size() > 0) { //소켓이 종료되면 해당 세션값들을 찾아서 지운다.
			for(int i=0; i<rls.size(); i++) {
				rls.get(i).remove(session.getId());
			}
		}
		super.afterConnectionClosed(session, status);
	}
	
	private static JSONObject jsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
}
