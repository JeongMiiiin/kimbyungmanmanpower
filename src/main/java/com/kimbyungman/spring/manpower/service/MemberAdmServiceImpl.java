package com.kimbyungman.spring.manpower.service;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dao.MemberDao;
import com.kimbyungman.spring.manpower.dto.MemberDto;
import com.kimbyungman.spring.manpower.dto.Pagination;

@Service
public class MemberAdmServiceImpl extends RootService implements MemberAdmService {

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private FileService FileService; 

	//로그인 체크 (관리자)
	@Override
	public boolean loginCheck(HashMap<String, Object> params) {
		boolean result = false;
		String password = String.valueOf(params.get("userPw"));
		
		try {
			password = SHA256.encrypt(password);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		params.put("userPw", password);
		
		int checkCnt = dao.loginAdmCheck(params);
		if(checkCnt > 0) result = true;
		return result;
	};
	
	//리스트 페이지 이동 (관리자)
	@Override
	public String listPage(MemberDto searchDto, HttpServletRequest request , Model model) {

		Pagination pagination = new Pagination();
		pagination.setCurrentPageNo(searchDto.getPageIndex());
		pagination.setRecordCountPerPage(100);
		pagination.setPageSize(searchDto.getPageSize());
		
		searchDto.setFirstIndex(pagination.getFirstRecordIndex());
		searchDto.setRecordCountPerPage(100);
		
		List<MemberDto> result = new ArrayList<>();
		int totalCnt = 0;
		
		result = dao.selectAdmListData(searchDto);
		totalCnt = dao.selectAdmTotalCnt(searchDto);
		
		pagination.setTotalRecordCount(totalCnt);

		searchDto.setEndDate(pagination.getLastPageNoOnPageList());
		searchDto.setStartDate(pagination.getFirstPageNoOnPageList());
		searchDto.setPrev(pagination.getXprev());
		searchDto.setNext(pagination.getXnext());
		searchDto.setRealEnd(pagination.getRealEnd());

		model.addAttribute("resultList", result);
		model.addAttribute("totCnt",totalCnt);
		model.addAttribute("totalPageCnt",(int)Math.ceil(totalCnt / (double)searchDto.getPageUnit()));
		model.addAttribute("pagination",pagination);
		
		try {
			searchDto.setQustr();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "admin/member/list";
		
	};
	
	//등록 페이지 이동 (관리자)
	@Override
	public String insertPage(MemberDto searchDto, HttpServletRequest request, Model model) {return "admin/member/insert";};
	
	//등록 (관리자)
	@Override
	public void insertData(MemberDto searchDto, HttpServletResponse response) {
		String msg = "등록이 완료되었습니다.";
		String targetLink = "/adm/member/list";
		
		dao.insertAdmData(searchDto);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};

	//변경 페이지 이동 (관리자)
	@Override
	public String updatePage(MemberDto searchDto, int MemberSn, HttpServletRequest request, Model model) {
		MemberDto viewData = dao.selectAdmViewData(MemberSn);
		
		if(viewData != null) {
			String permissionFileSeq = viewData.getPermissionFileSeq();
			if( permissionFileSeq != null && !permissionFileSeq.equals("") ) {

				String[] permissionFileSeqListVal = permissionFileSeq.split(",");
				List<HashMap<String,Object>> permissionFileSeqList = new ArrayList<HashMap<String,Object>>();
				
				
				for(int i=0; i < permissionFileSeqListVal.length; i++) {
					HashMap<String, Object> targetVal = new HashMap<String, Object>(); 
					
					int targetSeq = Integer.parseInt(permissionFileSeqListVal[i]);
					
					String permissionFileName = FileService.getFileName(targetSeq)[1] + '.' + FileService.getFileName(targetSeq)[2];
					
					targetVal.put("seq", targetSeq);
					targetVal.put("name", permissionFileName);
					
					permissionFileSeqList.add(targetVal);
					
				}
				
				viewData.setPermissionFileNameList(permissionFileSeqList);
			}
			
			String healthCertificateFileSeq = viewData.getHealthCertificateFileSeq();
			if( healthCertificateFileSeq != null && !healthCertificateFileSeq.equals("") ) {
				String[] healthCertificateFileSeqListVal = healthCertificateFileSeq.split(",");
				List<HashMap<String,Object>> healthCertificateFileSeqList = new ArrayList<HashMap<String,Object>>();
				
				
				for(int i=0; i < healthCertificateFileSeqListVal.length; i++) {
					HashMap<String, Object> targetVal = new HashMap<String, Object>(); 
					
					int targetSeq = Integer.parseInt(healthCertificateFileSeqListVal[i]);
					
					String healthCertificateFileName = FileService.getFileName(targetSeq)[1] + '.' + FileService.getFileName(targetSeq)[2];
					
					targetVal.put("seq", targetSeq);
					targetVal.put("name", healthCertificateFileName);
					
					healthCertificateFileSeqList.add(targetVal);
					
				}
				
				viewData.setHealthCertificateFileNameList(healthCertificateFileSeqList);
			}
			
			String etcFileSeq = viewData.getEtcFileSeq();
			if( etcFileSeq != null && !etcFileSeq.equals("") ) {
				String[] etcFileSeqListVal = etcFileSeq.split(",");
				List<HashMap<String,Object>> etcFileSeqList = new ArrayList<HashMap<String,Object>>();
				
				
				for(int i=0; i < etcFileSeqListVal.length; i++) {
					HashMap<String, Object> targetVal = new HashMap<String, Object>(); 
					
					int targetSeq = Integer.parseInt(etcFileSeqListVal[i]);
					
					String etcFileName = FileService.getFileName(targetSeq)[1] + '.' + FileService.getFileName(targetSeq)[2];
					
					targetVal.put("seq", targetSeq);
					targetVal.put("name", etcFileName);
					
					etcFileSeqList.add(targetVal);
					
				}
				
				viewData.setEtcFileNameList(etcFileSeqList);
			}
			
			String completeFileSeq = viewData.getCompleteFileSeq();
			if( completeFileSeq != null && !completeFileSeq.equals("") ) {
				String[] completeFileSeqListVal = completeFileSeq.split(",");
				List<HashMap<String,Object>> completeFileSeqList = new ArrayList<HashMap<String,Object>>();
				
				
				for(int i=0; i < completeFileSeqListVal.length; i++) {
					HashMap<String, Object> targetVal = new HashMap<String, Object>(); 
					
					int targetSeq = Integer.parseInt(completeFileSeqListVal[i]);
					
					String completeFileName = FileService.getFileName(targetSeq)[1] + '.' + FileService.getFileName(targetSeq)[2];
					
					targetVal.put("seq", targetSeq);
					targetVal.put("name", completeFileName);
					
					completeFileSeqList.add(targetVal);
					
				}
				
				viewData.setEtcFileNameList(completeFileSeqList);
			}
			
		}
		
		model.addAttribute("updateData", viewData);
		
		try {
			searchDto.setQustr();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "admin/member/update";
	};

	//변경 (관리자)
	@Override
	public void updateData(MemberDto searchDto, HttpServletRequest request, HttpServletResponse response) {
		String msg = "변경이 완료되었습니다.";
		String targetLink = "/adm/member/list";
		
		String birth0 = request.getParameter("birth0");
		String birth1 = request.getParameter("birth1");
		String birth2 = request.getParameter("birth2");
		String birth = birth0 + '-' + birth1 + '-' + birth2;
		searchDto.setBirthStr(birth);
		
		dao.updateAdmData(searchDto);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};
	
	//삭제 (관리자)
	@Override
	public void deleteData(int MemberSn, HttpServletResponse response) {
		
		String msg = "삭제가 완료되었습니다.";
		String targetLink = "/adm/member/list";
		
		dao.deleteAdmData(MemberSn);
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};
	
	
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
	
	//신고된 회원 상태 변경 (관리자)
	@Override
	public void updateDeclaration(HashMap<String, Object> params) {
		int updateCnt = dao.updateDeclaration(params);
		
		if(updateCnt > 1) {
			dao.bannedMember(params);
		}
	}
	
	 //승인상태 변경 (관리자)
	@Override
	public HashMap<String,Object> updateApprove(HashMap<String, Object> params){
		HashMap<String,Object> result = new HashMap<String,Object>();
		result.put("result", false);
		
		int updateCnt = dao.updateApprove(params);
		
		if(updateCnt > 0) {
			result.put("result", true);
		}
		
		return result;
	}

}
