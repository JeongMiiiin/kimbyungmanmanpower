package com.kimbyungman.spring.manpower.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.SocketException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kimbyungman.spring.manpower.dao.MemberDao;
import com.kimbyungman.spring.manpower.dto.MemberDto;

import niceid.comp.CACheck;

@Service
public class MemberServiceImpl extends RootService implements MemberService {

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private FileService FileService;

	@Autowired
	private AligoMsgService aligoMsgService;
	
	//개인 로그인 페이지 이동 (사용자)
	@Override
	public String personalLogin(HttpServletRequest request) {
		String result = "redirect:/personal/main";
		HttpSession session = request.getSession();
		MemberDto loginCheck = (MemberDto) session.getAttribute("memberInfo");
		
		if( loginCheck == null ) {result = "client/personal/login/page";}
		
		return result;
	}
	
	//개인 로그인 체크 (사용자)
	@Override
	public void personalLoginAction(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String phoneNum = request.getParameter("phoneNum");
		
		String msg = "로그인에 실패했습니다. 잠시 후 다시 시도해주세요.";
		String targetLink = "/personal/login";
		
		HashMap<String, Object> params = new HashMap<String, Object>();
        
        params.put("phoneNum", phoneNum);
		
		int idCheck = dao.idCheck(params);
		
		if(idCheck > 0) {
			msg = "비밀번호가 다릅니다. 다시 한번 확인해주세요.";
		} else {
			msg = "가입하지 않은 전화번호입니다. 다시 한번 확인해주세요.";
		}
		
        String pw = request.getParameter("userPw"); 
        
        try {
			pw = SHA256.encrypt(pw);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        params.put("userPw", pw);
        
        MemberDto loginCheck = dao.loginCheck(params);
		
		if( loginCheck != null ) {
			
			if(loginCheck.getIsApproved() == 1) {
				msg = "로그인에 성공했습니다.";
				targetLink = "/personal/main";
				
				boolean updateToken = checkUpdateToken(session, loginCheck);
				
				if(updateToken) {
					loginCheck.setTokenId((String) session.getAttribute("tokenValue"));
				}
				
				session.setAttribute("memberInfo", loginCheck);
			} else if(loginCheck.getIsApproved() == -1) {
				msg = "승인이 거절되었습니다. 관리자에게 문의해주세요.";
			} else {
				msg = "승인대기 상태입니다. 관리자에게 문의해주세요.";
			}
			
		}
			
		makeSubmitAlertMsg(response, msg, targetLink);
		
	};
	
	//개인 비밀번호 찾기 페이지 이동 (사용자)
	@Override
	public String personalFindPassword(HttpServletRequest request) {
		String result = "redirect:/personal/main";
		HttpSession session = request.getSession();
		String loginCheck = (String) session.getAttribute("phoneNum");
		
		if( loginCheck == null ) {result = "client/personal/findPassword/page";}
		
		return result;
	}
	
	//개인 회원가입 페이지 이동 (사용자)
	@Override
	public String personalSignUp(int stepIdx, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String result = "";
		
		switch(stepIdx) {
			case 3 :
				String phoneNum = (String) session.getAttribute("phoneNum");
				
				if(phoneNum != null) {
					result = "client/personal/signUp/page" + stepIdx;
				} else {
					result = "redirect:/personal/signUp?stepIdx=2";
				}
				break;
			case 4 :
				String category = request.getParameter("category");
				
				if(category.equals("1")) {
					result = "client/personal/signUp/page4";
				} else {
					result = "client/personal/signUp/page4category2";
				}
				
				String phoneNum2 = (String) session.getAttribute("phoneNum");
				
				if(phoneNum2 == null) {
					result = "redirect:/personal/signUp?stepIdx=2";
				}
				
				break;
			default : result = "client/personal/signUp/page" + stepIdx; break; 
		}
		
		return result;
	};
	
	//계좌번호 인증 시도 (사용자)
	@Override
	public HashMap<String,Object> certificateBankNum(HttpServletRequest request, HashMap<String, Object> params){
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		String niceUid = "NID206585";				// NICE에서 발급받은 사이트코드
		String svcPwd  = "08445201";				// NICE에서 발급받은 사이트 패스워드
		
		String service = "2"; // 서비스구분
		String svcGbn = "2"; // 업무구분
		String strGbn = "1"; // 계좌구분 (1:개인계좌, 2:법인계좌)
		String strBankCode = String.valueOf(params.get("bankName"));
		String strAccountNo = String.valueOf(params.get("bankNum"));
		
		String strNm = "";
		if(params.get("accountHolder") != null) {
			strNm = String.valueOf(params.get("accountHolder"));
		}
		
		// 생년월일 초기화 및 취득 (개인-생년월일 6자리, 법인-사업자번호 10자리)
		String strResId = "";
		
		// 주문번호 설정 (중복값 설정 불가, 소스 수정 불필요)	
		String strOrderNo = new SimpleDateFormat("yyyyMMdd").format(new Date()) + (Math.round(Math.random() * 10000000000L) + "");  	

		// 조회사유 설정 (10:회원가입 20:기존회원인증 30:성인인증 40:비회원확인 90:기타)	
		String inq_rsn = "90";
		
		// 결과값 초기화
		String resultValue = "";
		
		// NICE 계좌인증 호스트
		String host = "secure.nuguya.com";
		
		// NICE 계좌인증 URL(EUC-KR)																													
		String target = "https://secure.nuguya.com/nuguya2/service/realname/sprealnameactconfirm.do";
		
		// 계좌인증 파라미터 설정
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
				
				// URL 및 파라미터 확인
				System.out.println("URL:\n" + target);
				System.out.println("POST:\n" + postValues);
				
				// 소켓 포트 설정 (HTTP:80, HTTPS:443)
				int port = 443;
				
				// 소켓 타임아웃 (10초)
				int timeout = 10;
				
				// 스트림 객체 초기화
		    	BufferedReader in = null;
		      	PrintWriter out = null;

		      	try{
		            // 결과 버퍼 생성
		            StringBuffer sbResult = new StringBuffer();
		      		
		      		// 소켓통신 오픈
		        	SSLSocketFactory factory = (SSLSocketFactory)SSLSocketFactory.getDefault();
		          	SSLSocket soc = (SSLSocket)factory.createSocket(host, port);

		            // 소켓통신 설정 
		            soc.setSoTimeout(timeout * 1000);
		        	soc.setSoLinger(true, 10);	
		            soc.setKeepAlive(true);		           
		      		
		            // 스트림 객체 생성
		            out = new PrintWriter(soc.getOutputStream());
		            in  = new BufferedReader(new InputStreamReader(soc.getInputStream()), 8 * 1024);
		            
			        // 요청 헤더 생성
		            out.println("POST " + target + " HTTP/1.1");
		            out.println("Host: " + host);
		            out.println("Connection: Keep-Alive");
		            out.println("Content-Type: application/x-www-form-urlencoded");
		            out.println("Content-Length: " + postValues.length());
		            out.println();
		            out.println(postValues);
		            out.flush();            
		            
		            // 응답헤더 초기화
		            String line = null;

			        // 소켓통신 처리
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
		             	
		                // 9번째 라인 추출
		                if(i==9) {
		                	sbResult.append(line);
		                }
		            }
		            
		            // 소켓통신 종료
		            out.close();
		            in.close();
		            soc.close();

		            // 결과값 설정
		            resultValue = sbResult.toString();
		            
		        }
		      	// 소켓오류 처리
		      	catch(SocketException e){
		        	System.out.println("[계좌확인 소켓오류] " + e.getMessage());
		        	resultValue = strOrderNo + "|E999|소켓연결에 실패하였습니다.";
		        }
		      	// 기타 시스템 오류 처리
		      	catch (Exception e){
		        	System.out.println("[계좌확인 기타오류] " + e.getMessage());
		        	e.printStackTrace();
		        }
		      	
		      	// 오류 메세지 설정
		      	if(result.equals("")){
		        	resultValue = strOrderNo + "|E999|소켓통신 중 오류가 발생했습니다.";
		      	}
		
		result.put("result", true);
		result.put("data", resultValue);
		
		return result;
	}
	
	//개인 회원가입 (사용자)
	@Override
	public void personalSignUpAction(MemberDto signUpDto, HttpServletRequest request, HttpServletResponse response) {
		String msg = "회원가입에 성공하셨습니다.";
		String targetLink = "/personal/signUp?stepIdx=5";
		
		String password = signUpDto.getPassword();
		
		try {
			password = SHA256.encrypt(password);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		signUpDto.setPassword(password);
		
		String phoneNum = request.getParameter("phoneNum");
		String phone0 = phoneNum.substring(0,3);
		String phone1 = phoneNum.substring(3,7);
		String phone2 = phoneNum.substring(7);
		
		signUpDto.setPhone0(phone0);
		signUpDto.setPhone1(phone1);
		signUpDto.setPhone2(phone2);
		
		String birth0 = request.getParameter("birth0");
		String birth1 = request.getParameter("birth1");
		String birth2 = request.getParameter("birth2");
		String birth = birth0 + '-' + birth1 + '-' + birth2;
		signUpDto.setBirthStr(birth);
		
		String signData = request.getParameter("signData");
		if(signData != null && signData.getBytes().length > 0) {
			int signFileSeq = FileService.fileUploadBase64(signData);
			signUpDto.setSignFileSeq(signFileSeq);
		}
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		String permissionFileListVal = request.getParameter("permissionFileList") != null ? request.getParameter("permissionFileList") : "";
		if(permissionFileListVal != "") {
			String[] permissionFileListArray = permissionFileListVal.split(",");
			
			if(permissionFileListArray.length > 0 && !permissionFileListVal.equals("")) {
				String permissionFileSeq = "";
				
				for(int i=0; i < permissionFileListArray.length; i++) {
					MultipartFile permissionFile = multipartRequest.getFile(permissionFileListArray[i]);
					if(permissionFile != null && permissionFile.getSize() > 0) {
						int permissionFileSeqVal = FileService.fileUpload(permissionFile);
						
						permissionFileSeq += "," + String.valueOf(permissionFileSeqVal); 
						
					}
				}
				
				permissionFileSeq = permissionFileSeq.substring(1, permissionFileSeq.length());
				
				signUpDto.setPermissionFileSeq(permissionFileSeq);
			}
		}
		
		
		String healthCertificateFileListVal = request.getParameter("healthCertificateFileList") != null ? request.getParameter("healthCertificateFileList") : "";
		if(healthCertificateFileListVal != "") {
			String[] healthCertificateFileListArray = healthCertificateFileListVal.split(",");
			
			if(healthCertificateFileListArray.length > 0 && !healthCertificateFileListVal.equals("")) {
				String healthCertificateFileSeq = "";
				
				for(int i=0; i < healthCertificateFileListArray.length; i++) {
					MultipartFile healthCertificateFile = multipartRequest.getFile(healthCertificateFileListArray[i]);
					if(healthCertificateFile != null && healthCertificateFile.getSize() > 0) {
						int healthCertificateFileSeqVal = FileService.fileUpload(healthCertificateFile);
						
						healthCertificateFileSeq += "," + String.valueOf(healthCertificateFileSeqVal); 
						
					}
				}
				
				healthCertificateFileSeq = healthCertificateFileSeq.substring(1, healthCertificateFileSeq.length());
				
				signUpDto.setHealthCertificateFileSeq(healthCertificateFileSeq);
			}
		}
		
		
		
		String etcFileListVal = request.getParameter("etcFileList") != null ? request.getParameter("etcFileList") : "";
		if(etcFileListVal != "") {
			String[] etcFileListArray = etcFileListVal.split(",");
			
			if(etcFileListArray.length > 0 && !etcFileListVal.equals("")) {
				String etcFileSeq = "";
				
				for(int i=0; i < etcFileListArray.length; i++) {
					MultipartFile etcFile = multipartRequest.getFile(etcFileListArray[i]);
					if(etcFile != null && etcFile.getSize() > 0) {
						int etcFileSeqVal = FileService.fileUpload(etcFile);
						
						etcFileSeq += "," + String.valueOf(etcFileSeqVal); 
						
					}
				}
				
				etcFileSeq = etcFileSeq.substring(1, etcFileSeq.length());
				
				signUpDto.setEtcFileSeq(etcFileSeq);
			}
		}
		
		HttpSession session = request.getSession(); 
		String tokenValue = session.getAttribute("tokenValue") != null ? (String) session.getAttribute("tokenValue") : "";
		signUpDto.setTokenId(tokenValue);
		
		int userSn = dao.insertData(signUpDto);
		
		session.invalidate();
		request.getSession(true);
		
		HttpSession session2 = request.getSession();
		session2.setAttribute("tokenValue", tokenValue);
		session2.setAttribute("sn", userSn);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};
	
	//회원가입 완료 (사용자)
	@Override
	public void signUpComplete(int siteCategory, HttpServletRequest request, HttpServletResponse response) {
		
			HttpSession session = request.getSession();
		
			int userSn = (int) session.getAttribute("sn");
			String tokenValue = session.getAttribute("tokenValue") != null ? (String) session.getAttribute("tokenValue") : "";
			
			request.getSession().invalidate();
			request.getSession(true);
			
			MemberDto MemberInfo = dao.signUpLogin(userSn);
			
			HttpSession session2 = request.getSession();
			
			session2.setAttribute("tokenValue", tokenValue);
			session2.setAttribute("memberInfo", MemberInfo);
			
			String msg = "회원가입에 성공하셨습니다. 환영합니다.";
			String targetLink = "/personal/main";
			if(siteCategory == 1) {targetLink = "/business/main";};
			
			makeSubmitAlertMsg(response, msg, targetLink);
		};
	
	//기업/단체 로그인 페이지 이동 (사용자)
	@Override
	public String businessLogin(HttpServletRequest request) {
		String result = "redirect:/business/main";
		HttpSession session = request.getSession();
		MemberDto loginCheck = (MemberDto) session.getAttribute("memberInfo");
		
		if( loginCheck == null ) {result = "client/business/login/page";};
		
		return result;
	};
	
	//기업/단체 로그인 체크 (사용자)
	@Override
	public void businessLoginAction(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String phoneNum = request.getParameter("phoneNum");
        String pw = request.getParameter("userPw"); 
		
        HashMap<String, Object> params = new HashMap<String, Object>();
        
        params.put("phoneNum", phoneNum);

        try {
			pw = SHA256.encrypt(pw);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        params.put("userPw", pw);
        params.put("category", 1);
        
        MemberDto loginCheck = dao.loginCheck(params);
		
		String msg = "로그인에 실패했습니다. 잠시 후 다시 시도해주세요.";
		String targetLink = "/business/login";
		
		if( loginCheck != null ) {
			
			if(loginCheck.getIsApproved() == 1) {
				msg = "로그인에 성공했습니다.";
				targetLink = "/business/main";
				
				boolean updateToken = checkUpdateToken(session, loginCheck);
				
				if(updateToken) {
					loginCheck.setTokenId((String) session.getAttribute("tokenValue"));
				}
				
				session.setAttribute("memberInfo", loginCheck);
			} else if(loginCheck.getIsApproved() == -1) {
				msg = "승인이 거절되었습니다. 관리자에게 문의해주세요.";
			} else {
				msg = "승인대기 상태입니다. 관리자에게 문의해주세요.";
			}
		}
			
		makeSubmitAlertMsg(response, msg, targetLink);
		
	};
	
	//기업 회원가입 페이지 이동 (사용자)
	@Override
	public String businessSignUp(int stepIdx, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String result = "";
		
		switch(stepIdx) {
			case 3 :
				String phoneNum = (String) session.getAttribute("phoneNum");
				
				if(phoneNum != null) {
					result = "client/business/signUp/page" + stepIdx;
				} else {
					result = "redirect:/business/signUp?stepIdx=2";
				}
				break;
			case 4 :
				
				result = "client/business/signUp/page4";
				
				String phoneNum2 = (String) session.getAttribute("phoneNum");
				
				if(phoneNum2 == null) {
					result = "redirect:/business/signUp?stepIdx=2";
					break;
				}
				
				String businessName = (String) session.getAttribute("businessName");
				String businessNum = (String) session.getAttribute("businessNum");
				String representativeName = (String) session.getAttribute("representativeName");
				
				
				/*
				 * session.setAttribute("businessName", "테스트");
				 * session.setAttribute("businessNum", "1111111111");
				 * session.setAttribute("representativeName", "테스트계정");
				 */
				 
				
				if(businessName == null || businessNum == null || representativeName == null) {
					result = "redirect:/business/signUp?stepIdx=3";
				}
				break;
			default : result = "client/business/signUp/page" + stepIdx; break; 
		}
		
		
		return result;
	};
	
	//사업자 등록번호 인증 시도 (사용자)
	@Override
	public HashMap<String,Object> certificateBusinessNum(HttpServletRequest request, HashMap<String, Object> params){
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		CACheck caComp = new CACheck();
	    int iReturn = -1;
		
	    String businessNumVal = "";
	    if(params.get("businessNum") != null) {
	    	businessNumVal = String.valueOf(params.get("businessNum"));
	    }
	    
	    String corporationNumVal = "0000000000000"; //해당API는 법인등록번호는 불필요함
	    
	    String businessNameVal = "";
	    if(params.get("businessName") != null) {
	    	businessNameVal = String.valueOf(params.get("businessName"));
	    }
	    
	    String representativeNameVal = "";
	    if(params.get("representativeName") != null) {
	    	representativeNameVal = String.valueOf(params.get("representativeName"));
	    }
	    
	    iReturn = caComp.fnRequest("FZ66", "ir0Age0p", "1", businessNumVal, corporationNumVal, businessNameVal, representativeNameVal);
	    
	    if( iReturn == 0 ) {
	    	
	    	result.put("result", true);
	    	
	    	if(caComp.getReturnCode().equals("01")) {
	    		HttpSession session = request.getSession();
	    		
	    		session.setAttribute("businessName", businessNameVal);
	    		session.setAttribute("businessNum", businessNumVal);
	    		session.setAttribute("representativeName", representativeNameVal);
	    	}
	    	
	    	result.put("data", caComp.getReturnCode());
	    } else {
	    	result.put("result", false);
	        System.out.println("AUTH_ERROR=" + iReturn);
	    }
		
		return result;
	}
	
	//기업/단체 회원가입 (사용자)
	@Override
	public void businessSignUpAction(MemberDto signUpDto, HttpServletRequest request, HttpServletResponse response) {
		String msg = "회원가입에 성공하셨습니다.";
		String targetLink = "/business/login";
		
		String password = signUpDto.getPassword();
		
		try {
			password = SHA256.encrypt(password);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		signUpDto.setPassword(password);
		
		String phoneNum = request.getParameter("phoneNum");
		String phone0 = phoneNum.substring(0,3);
		String phone1 = phoneNum.substring(3,7);
		String phone2 = phoneNum.substring(7);
		
		signUpDto.setPhone0(phone0);
		signUpDto.setPhone1(phone1);
		signUpDto.setPhone2(phone2);
		
		String birth0 = request.getParameter("birth0");
		String birth1 = request.getParameter("birth1");
		String birth2 = request.getParameter("birth2");
		String birth = birth0 + '-' + birth1 + '-' + birth2;
		signUpDto.setBirthStr(birth);
		
		HttpSession session = request.getSession();
		
		String tokenValue = session.getAttribute("tokenValue") != null ? (String) session.getAttribute("tokenValue") : "";
		signUpDto.setTokenId(tokenValue);
		
		int userSn = dao.insertData(signUpDto);
		
		request.getSession().invalidate();
		request.getSession(true);
		
		HttpSession session2 = request.getSession();
		
		session2.setAttribute("tokenValue", tokenValue);
		session2.setAttribute("sn", userSn);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};
	
	//기업/단체 비밀번호 찾기 페이지 이동 (사용자)
	@Override
	public String businessFindPassword(HttpServletRequest request) {
		String result = "";
		HttpSession session = request.getSession();
		MemberDto loginCheck = (MemberDto) session.getAttribute("memberInfo");
		
		if( loginCheck == null ) {
			result = "client/business/findPassword/page";
		} else {
			result = "redirect:/business/main";
		}
		return result;
	}
	
	//비밀번호 찾기 인증번호 메세지 전송 (사용자)
	@Override
	public HashMap<String,Object> passwordCertificationCodeSend(HashMap<String, Object> params) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("result", false);
		
		String userName = String.valueOf(params.get("userName"));
		String phoneNum = String.valueOf(params.get("phoneNum"));
		
		int checkCnt = dao.checkFindPassword(params);
		
		if(checkCnt > 0) {
			HashMap<String, Object> msgParams = new HashMap<String, Object>();

			String certificationCode = numberGen(6, 1);

			msgParams.put("targetName", userName);
			msgParams.put("targetHp", phoneNum);
			  
			String targetMsg = "안녕하세요. 김병만 인력관리입니다.\n"
			+ "인증번호는 [" + certificationCode + "] 입니다.";

			msgParams.put("targetMsg", targetMsg);
			 
			aligoMsgService.sendMsg(msgParams);

			HashMap<String, Object> certificationParams = new HashMap<String, Object>();

			certificationParams.put("phoneNum", phoneNum);
			certificationParams.put("certificationCode", certificationCode);

			dao.updateCertificationCode(certificationParams);

			result.put("result", true);
		}
		
		return result;
	}
	
	//비밀번호 찾기 인증번호 체크 (사용자)
	@Override
	public HashMap<String,Object> passwordSubmitCertificationCode(HashMap<String,Object> params){
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		String recentCode = dao.checkCertificationCode(params);
		
		if(recentCode.equals((String) params.get("submitCode"))) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}
	
	//회원가입 인증번호 메세지 전송 (사용자)
	@Override
	public HashMap<String,Object> certificationCodeSend(HashMap<String, Object> params) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String userName = String.valueOf(params.get("userName"));
		String phoneNum = String.valueOf(params.get("phoneNum"));
		
		if(dao.checkPhoneNum(phoneNum) > 0) {
			result.put("result", 2);
			return result;
		}
		
		HashMap<String, Object> msgParams = new HashMap<String, Object>();

		String certificationCode = numberGen(6, 1);

		msgParams.put("targetName", userName);
		msgParams.put("targetHp", phoneNum);
		  
		String targetMsg = "안녕하세요. 김병만 인력관리입니다.\n"
		+ "인증번호는 [" + certificationCode + "] 입니다.";

		msgParams.put("targetMsg", targetMsg);
		 
		aligoMsgService.sendMsg(msgParams);

		HashMap<String, Object> certificationParams = new HashMap<String, Object>();

		certificationParams.put("phoneNum", phoneNum);
		certificationParams.put("certificationCode", certificationCode);

		dao.updateCertificationCode(certificationParams);

		result.put("result", 1);		
		
		return result;
	}
	
	//회원가입 인증번호 체크 (사용자)
	@Override
	public HashMap<String,Object> submitCertificationCode(HttpServletRequest request, HashMap<String,Object> params){
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		HttpSession session = request.getSession();
		
		String recentCode = dao.checkCertificationCode(params);
		
		
		if(recentCode.equals((String) params.get("submitCode"))) {
			session.setAttribute(("phoneNum"), (String) params.get("phoneNum"));
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}
	
	//임시 비밀번호로 설정 (사용자)
	@Override
	public HashMap<String,Object> settingTempPassword(HashMap<String, Object> params){
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String userName = String.valueOf(params.get("userName"));
		String phoneNum = String.valueOf(params.get("phoneNum"));
		
		HashMap<String, Object> msgParams = new HashMap<String, Object>();
		
		msgParams.put("targetHp", phoneNum);
		 
		String tempPw = tempPassword(10);
		
		String targetMsg = userName + "님 안녕하세요. 김병만 인력관리입니다.\n"
		+ "임시 비밀번호는 [" + tempPw + "] 입니다.";

		msgParams.put("targetMsg", targetMsg);
		 
		aligoMsgService.sendMsg(msgParams);

		HashMap<String, Object> certificationParams = new HashMap<String, Object>();
		
		try {
			tempPw = SHA256.encrypt(tempPw);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		certificationParams.put("userName", userName);
		certificationParams.put("phoneNum", phoneNum);
		certificationParams.put("tempPw", tempPw);

		int updateCnt = dao.updateTempPassword(certificationParams);

		if(updateCnt > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}
	
	//로그아웃 (사용자)
	@Override
	public void logout(int siteCategory, HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String tokenValue = session.getAttribute("tokenValue") != null ? (String) session.getAttribute("tokenValue") : "";
		
		session.invalidate();
		request.getSession(true);
		String msg = "로그아웃되었습니다.";
		String targetLink = "/personal/main";
		
		HttpSession session2 = request.getSession();
		session2.setAttribute("tokenValue", tokenValue);
		
		if(siteCategory == 1) {
			targetLink = "/business/main";
		}
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};

	//인증번호 확인 (사용자)
	@Override
	public HashMap<String, Object> certificationCodeCheck(HashMap<String, Object> params) {

		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String submitCode = String.valueOf(params.get("submitCode"));
		
		String certificationCode = dao.checkCertificationCode(params);
		
		if(submitCode.equals(certificationCode)) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}

		return result;

	}

	//암호 SHA256으로 변환
	private static class SHA256 {

		public static String encrypt(String text) throws NoSuchAlgorithmException {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(text.getBytes());

			return bytesToHex(md.digest());
		}

		public static String bytesToHex(byte[] bytes) {
			StringBuilder builder = new StringBuilder();
			for (byte b : bytes) {
				builder.append(String.format("%02x", b));
			}
			return builder.toString();
		}

	}
	
	//인증번호 메세지 재전송 (사용자)
	@Override
	public HashMap<String, Object> checkMsgResend(HashMap<String, Object> params) {
		HashMap<String, Object> result = new HashMap<String, Object>();

		String userName = String.valueOf(params.get("userName"));
		String phoneNum = String.valueOf(params.get("phoneNum"));

		HashMap<String, Object> msgParams = new HashMap<String, Object>();

		String certificationCode = numberGen(6, 1);

		msgParams.put("targetName", userName);
		msgParams.put("targetHp", phoneNum);
		  
		String targetMsg = "안녕하세요. 김병만 인력관리입니다.\n"
		+ "인증번호는 [" + certificationCode + "] 입니다.";

		msgParams.put("targetMsg", targetMsg);
		 
		aligoMsgService.sendMsg(msgParams);

		HashMap<String, Object> certificationParams = new HashMap<String, Object>();

		certificationParams.put("phoneNum", phoneNum);
		certificationParams.put("certificationCode", certificationCode);

		dao.updateCertificationCode(certificationParams);

		result.put("result", true);
		
		return result;
	}
	
	//회원정보 데이터 조회 (사용자)
	@Override
	public MemberDto getMyInfo(int memberSn) {return dao.getMyInfo(memberSn);}
	
	//정보 수정 (사용자)
	@Override
	public int updateMyInfo(MemberDto updateDto) {return dao.updateMyInfo(updateDto);}
	
	//토큰 기반 로그인 시도 (사용자)
	@Override
	public MemberDto checkToken(String tokenValue) {return dao.checkToken(tokenValue);}
	
	//토큰값 조회 (사용자)
	@Override
	public HashMap<String, Object> getTokenValue(int memberSn) {return dao.getTokenValue(memberSn);};
	
	//토큰값이 변경되었는지 확인 후 변경되었으면 변경까지 (사용자)
	boolean checkUpdateToken(HttpSession session, MemberDto params) {
		boolean result = false;
		
		String tokenValue = session.getAttribute("tokenValue") != null ? (String) session.getAttribute("tokenValue") : "";
		if( !tokenValue.equals("") && !tokenValue.equals(params.getTokenId())) {
			params.setTokenId(tokenValue);
			dao.updateToken(params);
			result = true;
		}
		
		return result;
	}
	
	//알림 상태 변경 (사용자)
	@Override
	public HashMap<String, Object> updateNoticeAgree(HttpServletRequest request, HashMap<String, Object> params){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("result", false);
		
		HttpSession session = request.getSession();
		int userSn = (int) session.getAttribute("sn");
		
		int cnt = dao.updateSignUpNoticeAgree(userSn);
		
		if(cnt > 0) {result.put("result", true);};
		
		return result;
	}
	
	
	//임시 비밀번호 생성
    private static String tempPassword(int len) {
    	int idx = 0;
    	char[] charSet = new char[] {
    			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
    			'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
    			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    			'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
    			'!', '@', '#', '$', '%' 
    	};
    	StringBuffer password = new StringBuffer();
    	Random random = new Random();

    	for (int i = 0; i < len ; i++) {
    		double rd = random.nextDouble();
    		idx = (int) (charSet.length * rd);
    		
    		password.append(charSet[idx]);

    	}
    	
    	return password.toString();
    }
	
}
