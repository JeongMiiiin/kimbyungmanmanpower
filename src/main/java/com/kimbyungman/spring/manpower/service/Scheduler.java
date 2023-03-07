package com.kimbyungman.spring.manpower.service;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


@Component
public class Scheduler {

	@Autowired
	private AligoMsgService AligoMsgService;
	

	/*
	 * 1. 매일 17시에 다음날 예약자들에게 다시한번 문자 보내는 스케줄러
	 */
	@Scheduled(cron = "0 0 17 * * *")
	public void sendConfirmMsg() {

		
	}

}
