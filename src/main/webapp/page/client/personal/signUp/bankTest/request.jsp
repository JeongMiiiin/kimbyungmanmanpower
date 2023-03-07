<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="javax.net.ssl.SSLSocketFactory" %>
<%@ page import="javax.net.ssl.SSLSocket" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.SocketException" %>
<%@ page import="java.net.URLEncoder" %>
<%

// ������ ���� �����ص帮�� ������������ ���� ���� �� �������� ������ �ֽñ� �ٶ��ϴ�. 

	/************************************************************************************************
		NICE������ Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
		
		���񽺸� : ����Ȯ�� ���� 
		�������� : ����Ȯ�� ������û ������

		��ȭ�� �̿� �� �Ʒ� IP�� Port�� �������ּž� �մϴ�
		IP : 121.162.155.160 / Port : 80, 443
	*************************************************************************************************/

	String niceUid = "";				// NICE���� �߱޹��� ����Ʈ�ڵ�
	String svcPwd  = "";				// NICE���� �߱޹��� ����Ʈ �н�����
	String strCharset = "EUC-KR";		// ���������� �ѱ� ���ڵ� (EUC-KR, UTF-8)
	
	// �ѱ� ���ڵ� ����
	// request.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("euc-kr");
	
	// �Է� ���������� ���޵� �Է°� ���
	String service		= request.getParameter("service");		// ���񽺱���
	String svcGbn		= request.getParameter("svcGbn");		// ��������
	String strGbn		= request.getParameter("strGbn");		// ���±��� (1:���ΰ���, 2:���ΰ���)
	String strBankCode	= request.getParameter("strBankCode");	// �����ڵ�
	String strAccountNo	= request.getParameter("strAccountNo");	// ���¹�ȣ

	
    // �����ָ� �ʱ�ȭ �� ���
	String strNm = "";
	if(request.getParameter("name") != null){
		strNm = request.getParameter("name");
		
		// �ѱ��� ������ ������ ��� �ѱ� ���ڵ��� ���� ��ȯ
		// strNm = new String(request.getParameter("name").getBytes(strCharset));	

		// URL ���ڵ� ó��	
		strNm = URLEncoder.encode(strNm, strCharset);
	}

	// ������� �ʱ�ȭ �� ��� (����-������� 6�ڸ�, ����-����ڹ�ȣ 10�ڸ�)
	String strResId = "";
	if(request.getParameter("birth") != null){
		strResId = request.getParameter("birth");
	}
	
	// �ֹ���ȣ ���� (�ߺ��� ���� �Ұ�, �ҽ� ���� ���ʿ�)	
	String strOrderNo = new SimpleDateFormat("yyyyMMdd").format(new Date()) + (Math.round(Math.random() * 10000000000L) + "");  	

	// ��ȸ���� ���� (10:ȸ������ 20:����ȸ������ 30:�������� 40:��ȸ��Ȯ�� 90:��Ÿ)	
	String inq_rsn = "10";			

	// �������� ó��
	String bcResult = bankCheck(strCharset, niceUid, svcPwd, service, svcGbn, strGbn, strBankCode, strAccountNo, strNm, strResId, inq_rsn, strOrderNo); 

	// ����� ����
	String[] bcResults = bcResult.split("\\|");
	
	// ����� ����
	String resultOrderNo = bcResults[0];	// �ֹ���ȣ
	String resultCode    = bcResults[1];	// ����ڵ�
	String resultMsg     = bcResults[2];	// ����޼���
	
	// ����� ���
	out.println("�ֹ���ȣ  : "  + resultOrderNo + "<br>");
	out.println("����ڵ�  : "  + resultCode + "<br>");
	out.println("����޽��� : " + resultMsg + "<br>");
%>
<%!	
	//�������� ����-POST �Լ�
	public String bankCheck(String strCharset, String niceUid, String svcPwd, String service, String svcGbn, String strGbn, String strBankCode, String strAccountNo, String strNm, String strResId, String inq_rsn, String strOrderNo)
	{
		// ����� �ʱ�ȭ
		String result = "";
		
		// NICE �������� ȣ��Ʈ
		String host = "secure.nuguya.com";

		// NICE �������� URL(EUC-KR)																													
		String target = "https://secure.nuguya.com/nuguya/service/realname/sprealnameactconfirm.do";
		if (strCharset.equals("UTF-8")){
			// NICE �������� URL(UTF-8)
			target = "https://secure.nuguya.com/nuguya2/service/realname/sprealnameactconfirm.do";
		}	
		
		// �������� �Ķ���� ����
		String postValues = "niceUid" 				+ "=" + niceUid	
							+ "&" + "svcPwd"		+ "=" + svcPwd	
							+ "&" + "service"		+ "=" + service	
							+ "&" + "svcGbn"		+ "=" + svcGbn	
							+ "&" + "strGbn"		+ "=" + strGbn	
							+ "&" + "strBankCode"	+ "=" + strBankCode	
							+ "&" + "strAccountNo"	+ "=" + strAccountNo	
							+ "&" + "strNm"			+ "=" + strNm	
							+ "&" + "strResId"		+ "=" + strResId	
							+ "&" + "inq_rsn"		+ "=" + inq_rsn	
							+ "&" + "strOrderNo"	+ "=" + strOrderNo;
		
		// URL �� �Ķ���� Ȯ��
		System.out.println("URL:\n" + target);
		System.out.println("POST:\n" + postValues);
		
		// ���� ��Ʈ ���� (HTTP:80, HTTPS:443)
		int port = 443;
		
		// ���� Ÿ�Ӿƿ� (10��)
		int timeout = 10;
		
		// ��Ʈ�� ��ü �ʱ�ȭ
    	BufferedReader in = null;
      	PrintWriter out = null;

      	try{
            // ��� ���� ����
            StringBuffer sbResult = new StringBuffer();
      		
      		// ������� ����
        	SSLSocketFactory factory = (SSLSocketFactory)SSLSocketFactory.getDefault();
          	SSLSocket soc = (SSLSocket)factory.createSocket(host, port);

            // ������� ���� 
            soc.setSoTimeout(timeout * 1000);
        	soc.setSoLinger(true, 10);	
            soc.setKeepAlive(true);		           
      		
            // ��Ʈ�� ��ü ����
            out = new PrintWriter(soc.getOutputStream());
            in  = new BufferedReader(new InputStreamReader(soc.getInputStream()), 8 * 1024);
            
	        // ��û ��� ����
            out.println("POST " + target + " HTTP/1.1");
            out.println("Host: " + host);
            out.println("Connection: Keep-Alive");
            out.println("Content-Type: application/x-www-form-urlencoded");
            out.println("Content-Length: " + postValues.length());
            out.println();
            out.println(postValues);
            out.flush();            
            
            // ������� �ʱ�ȭ
            String line = null;

	        // ������� ó��
			int i=0;
            boolean notYet = true;
            while((line = in.readLine())!= null){
                i++;
                if (notYet && line.indexOf("HTTP/1.") == -1 ){
                	continue;
                }
                if (notYet && line.indexOf("HTTP/1.") > -1 ){
                	notYet = false;
                }
                
                if (line.indexOf("HTTP/1.") > -1 ){
                	notYet = false;
                }
                if (line.startsWith("0") || line == null){
                    break;
                }
             	
                // 9��° ���� ����
                if(i==9) {
                	sbResult.append(line);
                }
            }
            
            // ������� ����
            out.close();
            in.close();
            soc.close();

            // ����� ����
            result = sbResult.toString();
            
        }
      	// ���Ͽ��� ó��
      	catch(SocketException e){
        	System.out.println("[����Ȯ�� ���Ͽ���] " + e.getMessage());
        	result = strOrderNo + "|E999|���Ͽ��ῡ �����Ͽ����ϴ�.";
        }
      	// ��Ÿ �ý��� ���� ó��
      	catch (Exception e){
        	System.out.println("[����Ȯ�� ��Ÿ����] " + e.getMessage());
        	e.printStackTrace();
        }
      	
      	// ���� �޼��� ����
      	if(result.equals("")){
        	result = strOrderNo + "|E999|������� �� ������ �߻��߽��ϴ�.";
      	}
      	
		return result;
	}
%>