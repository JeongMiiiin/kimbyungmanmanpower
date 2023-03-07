package com.kimbyungman.spring.manpower.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kimbyungman.spring.manpower.dto.AppealDto;
import com.kimbyungman.spring.manpower.dto.ApplyDto;
import com.kimbyungman.spring.manpower.dto.ChattingDto;
import com.kimbyungman.spring.manpower.dto.DealDto;
import com.kimbyungman.spring.manpower.dto.MemberDto;
import com.kimbyungman.spring.manpower.dto.WorkDto;

@Service
public class MyInfoServiceImpl extends RootService implements MyInfoService {
	
	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private WorkService WorkService;
	
	@Autowired
	private AppealService AppealService;
	
	@Autowired
	private ApplyService ApplyService;
	
	@Autowired
	private ChattingService ChattingService;
	
	@Autowired
	private DealService DealService;
	
	@Autowired
	private FileService FileService;
	
	//개인 마이페이지 이동 (사용자)
	@Override
	public String personalSettingPage(HttpServletRequest request, int tabIdx, Model model) {
		String result = "";
		
		HttpSession session = request.getSession();
		
		int memberSn = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getSn() : -1;
		int memberCategory = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getCategory() : -1;
		
		switch(tabIdx) {
			case 1 : result = "client/personal/myInfo/recentDeal";
				if(memberCategory > 2) {
					ApplyDto params = new ApplyDto();
					params.setMemberSn(memberSn);
					
					List<ApplyDto> applyList = ApplyService.selectListData(params);
					
					for(int i=0; i < applyList.size(); i++) {
						int targetSn = applyList.get(i).getWorkSn();
						WorkDto completeData = WorkService.completeMyInfoData(targetSn);
						applyList.get(i).setSn(completeData.getSn());
						applyList.get(i).setTitle(completeData.getTitle());
						applyList.get(i).setPayment(completeData.getPayment());
					}
					
					session.setAttribute("resultList", applyList);

				} else {
					DealDto params = new DealDto();
					params.setMemberSn(memberSn);
					
					List<DealDto> dealList = DealService.selectListData(params);
					
					for(int i=0; i < dealList.size(); i++) {
						int targetSn = dealList.get(i).getWorkSn();
						WorkDto completeData = WorkService.completeMyInfoData(targetSn);
						dealList.get(i).setSn(completeData.getSn());
						dealList.get(i).setTitle(completeData.getTitle());
						dealList.get(i).setPayment(completeData.getPayment());
					}
					
					session.setAttribute("resultList", dealList);
				}
				
				break;
				
			case 2 : result = "client/personal/myInfo/myInfo";
			
			MemberDto myInfo = MemberService.getMyInfo(memberSn);
			
			if(myInfo != null) {
				String permissionFileSeq = myInfo.getPermissionFileSeq();
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
					
					myInfo.setPermissionFileNameList(permissionFileSeqList);
				}
				
				String healthCertificateFileSeq = myInfo.getHealthCertificateFileSeq();
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
					
					myInfo.setHealthCertificateFileNameList(healthCertificateFileSeqList);
				}
				
				String etcFileSeq = myInfo.getEtcFileSeq();
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
					
					myInfo.setEtcFileNameList(etcFileSeqList);
				}
				
				String completeFileSeq = myInfo.getCompleteFileSeq();
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
					
					myInfo.setEtcFileNameList(completeFileSeqList);
				}
			}
			
			model.addAttribute("myInfo", myInfo);
			break;
			
			case 3 :
				
				model.addAttribute("memberSn",memberSn);
				
				List<ChattingDto> resultList = ChattingService.selectListData(memberSn);
				
				model.addAttribute("resultList", resultList);
				
				result = "client/personal/myInfo/recentChat";
				break;
				
			case 4 : result = "client/personal/myInfo/appealManage";
			
			List<AppealDto> appealList = AppealService.selectListData(memberSn);
			
			model.addAttribute("resultList", appealList);
			
			break;
			
			default : result = "client/personal/myInfo/recentPost";
				
				WorkDto recentParams = new WorkDto();
				recentParams.setMemberSn(memberSn);
			
				List<WorkDto> myRecentList = WorkService.selectListData(recentParams);
				
				model.addAttribute("resultList", myRecentList);
				
			break;
		}
		
		return result;
	}
	
	//개인 내정보 수정 (사용자)
	@Override
	public void updatePersonalMyInfo(MemberDto updateDto, HttpServletRequest request, HttpServletResponse response) {
		String msg = "변경이 완료되었습니다.";
		String targetLink = "/personal/myInfo/page?tabIdx=2";
		
		String phoneNum = request.getParameter("phoneNum");
		String phone0 = phoneNum.substring(0,3);
		String phone1 = phoneNum.substring(3,7);
		String phone2 = phoneNum.substring(7);
		
		updateDto.setPhone0(phone0);
		updateDto.setPhone1(phone1);
		updateDto.setPhone2(phone2);
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		String permissionFileListVal = request.getParameter("permissionFileList");
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
			
			updateDto.setPermissionFileSeq(permissionFileSeq);
		}
		
		String healthCertificateFileListVal = request.getParameter("healthCertificateFileList");
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
			
			updateDto.setHealthCertificateFileSeq(healthCertificateFileSeq);
		}
		
		String etcFileListVal = request.getParameter("etcFileList");
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
			
			updateDto.setEtcFileSeq(etcFileSeq);
		}
		
		String completeFileListVal = request.getParameter("completeFileList");
		String[] completeFileListArray = completeFileListVal.split(",");
		
		if(completeFileListArray.length > 0 && !completeFileListVal.equals("")) {
			String completeFileSeq = "";
			
			for(int i=0; i < completeFileListArray.length; i++) {
				MultipartFile completeFile = multipartRequest.getFile(completeFileListArray[i]);
				if(completeFile != null && completeFile.getSize() > 0) {
					int completeFileSeqVal = FileService.fileUpload(completeFile);
					
					completeFileSeq += "," + String.valueOf(completeFileSeqVal); 
					
				}
			}
			
			completeFileSeq = completeFileSeq.substring(1, completeFileSeq.length());
			
			updateDto.setCompleteFileSeq(completeFileSeq);
		}
		
		int result = MemberService.updateMyInfo(updateDto);
		
		if(result == 0) {
			msg = "변경에 실패했습니다. 잠시 후 다시 시도해주세요.";
		}
		
		makeSubmitAlertMsg(response, msg, targetLink);
	}
	
	//개인 구인/구직내역 상세 페이지 이동 (사용자)
	@Override
	public String workViewPage(HttpServletRequest request, int workSn, String pageCategory, int category, Model model) {
		String result = "client/personal/myInfo/workView";
		
		if (category == 1) {
			result = "client/business/myInfo/workView";
		}
		
		WorkDto viewData = WorkService.viewData(workSn);
		
		if(viewData.getClassType() == 0) {
			ApplyDto applyParams = new ApplyDto();
			applyParams.setWorkSn(viewData.getSn());
			
			List<ApplyDto> applyList = ApplyService.selectListData(applyParams);
			
			viewData.setApplyList(applyList);
			
		}
		
		model.addAttribute("viewData",viewData);
		
		return result;
		
	}
	
	@Override
	public String workUpdatePage(HttpServletRequest request, int workSn, String pageCategory, int category, Model model) {
		String result = "client/personal/myInfo/workUpdate";
		
		if (category == 1) {
			result = "client/business/myInfo/workUpdate";
		}
		
		WorkDto updateData = WorkService.viewData(workSn);
		
		model.addAttribute("updateData",updateData);
		
		return result;
	}
	
	//기업/단체 마이페이지 이동 (사용자)
	@Override
	public String businessSettingPage(HttpServletRequest request, int tabIdx, Model model) {
		String result = "";
		
		HttpSession session = request.getSession();
		
		int memberSn = session.getAttribute("memberInfo") != null ? ((MemberDto) session.getAttribute("memberInfo")).getSn() : -1;
		
		switch(tabIdx) {
			case 1 : result = "client/business/myInfo/myInfo";
			
			MemberDto myInfo = MemberService.getMyInfo(memberSn);
			
			model.addAttribute("myInfo", myInfo);
			break;
			default : result = "client/business/myInfo/recentPost";
				
				WorkDto recentParams = new WorkDto();
				recentParams.setMemberSn(memberSn);
			
				List<WorkDto> myRecentList = WorkService.selectListData(recentParams);
				
				model.addAttribute("resultList", myRecentList);
				
			break;
		}
		
		return result;
	}
	
	//기업/단체 내정보 수정 (사용자)
	@Override
	public void updateBusinessMyInfo(MemberDto updateDto, HttpServletRequest request, HttpServletResponse response) {
		String msg = "변경이 완료되었습니다.";
		String targetLink = "/business/myInfo/page?tabIdx=1";
		
		String phoneNum = request.getParameter("phoneNum");
		String phone0 = phoneNum.substring(0,3);
		String phone1 = phoneNum.substring(3,7);
		String phone2 = phoneNum.substring(7);
		
		updateDto.setPhone0(phone0);
		updateDto.setPhone1(phone1);
		updateDto.setPhone2(phone2);
		
		int result = MemberService.updateMyInfo(updateDto);
		
		if(result == 0) {
			msg = "변경에 실패했습니다. 잠시 후 다시 시도해주세요.";
		}
		
		makeSubmitAlertMsg(response, msg, targetLink);
	}
	
}
