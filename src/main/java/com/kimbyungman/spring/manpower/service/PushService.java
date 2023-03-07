package com.kimbyungman.spring.manpower.service;

import java.util.HashMap;

public interface PushService {
	void sendPush(HashMap<String, String> params);
}
