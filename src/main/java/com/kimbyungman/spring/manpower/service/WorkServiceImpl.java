package com.kimbyungman.spring.manpower.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kimbyungman.spring.manpower.dao.WorkDao;
import com.kimbyungman.spring.manpower.dto.MemberDto;
import com.kimbyungman.spring.manpower.dto.WorkDto;

@Service
public class WorkServiceImpl extends RootService implements WorkService {
	
	@Autowired
	private WorkDao dao;
	
	@Autowired
	private ApplyService ApplyService;
	
	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private AligoMsgService AligoMsgService;
	
	@Autowired
	private DealService DealService;
	
	@Autowired
	private FileService FileService;
	
	@Override
	public List<WorkDto> selectListData(WorkDto params){
		return dao.selectListData(params);
	}
	
	@Override
	public HashMap<String, Object> insertData(HttpServletRequest request, HashMap<String, Object> params){
		
		HttpSession session = request.getSession();
		
		MemberDto memberInfo = (MemberDto) session.getAttribute("memberInfo");
		
		int memberSn = memberInfo.getSn();
		
		int memberMemCategory = memberInfo.getCategory();
		
		if(memberMemCategory == 1) {
			
			String memName = memberInfo.getManagerName();
			String phone0 = memberInfo.getPhone0();
			String phone1 = memberInfo.getPhone1();
			String phone2 = memberInfo.getPhone2();
			
			params.put("memName", memName);
			params.put("phone0", phone0);
			params.put("phone1", phone1);
			params.put("phone2", phone2);
			
			/*
			 * HashMap<String, Object> msgParams = new HashMap<String, Object>();
			 * 
			 * msgParams.put("targetName", "관리자"); msgParams.put("targetHp", "");
			 * 
			 * String targetMsg = "안녕하세요. 김병만 인력관리입니다.\n" + "기업/단체 구인게시판에 새로운 글이 등록되었습니다.";
			 * 
			 * msgParams.put("targetMsg", targetMsg);
			 * 
			 * AligoMsgService.sendMsg(msgParams);
			 */
		} else {
			String memName = memberInfo.getName();
			params.put("memName", memName);
		}
		
		params.put("memberSn", memberSn);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int cnt = dao.insertData(params);
		if( cnt > 0) {
			result.put("result", true);
			result.put("data", cnt);
		} else {
			result.put("result", false);
		}
		
		
		return result;
	};
	
	@Override
	public HashMap<String, Object> updateData(HttpServletRequest request, HashMap<String, Object> params){
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int cnt = dao.updateData(params);
		if( cnt > 0) {
			result.put("result", true);
			result.put("data", cnt);
		} else {
			result.put("result", false);
		}
		
		
		return result;
	}
	
	@Override
	public HashMap<String, Object> deleteData(HttpServletRequest request, HashMap<String, Object> params){
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int cnt = dao.deleteData(params);
		if( cnt > 0) {
			result.put("result", true);
			result.put("data", cnt);
		} else {
			result.put("result", false);
		}
		
		
		return result;
	}
	
	@Override
	public HashMap<String, Object> searchData(HashMap<String, Object> params){
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		List<Integer> filterClassList = new ArrayList<Integer>();
		if(params.get("filterClass") != null && String.valueOf(params.get("filterClass")) != "") {
			
			String[] tempFilterClass = String.valueOf(params.get("filterClass")).split(",");
			for(int i=0; i < tempFilterClass.length; i++) {
				filterClassList.add(Integer.parseInt(tempFilterClass[i]));
			}
		}
		params.put("filterClass", filterClassList);
		
		List<Integer> filterSexList = new ArrayList<Integer>();
		if(params.get("filterSex") != null && String.valueOf(params.get("filterSex")) != "") {
			String[] tempFilterSex = String.valueOf(params.get("filterSex")).split(",");
			for(int i=0; i < tempFilterSex.length; i++) {
				filterSexList.add(Integer.parseInt(tempFilterSex[i]));
			}
		}
		params.put("filterSex", filterSexList);
		
		List<String> filterRegionList = new ArrayList<String>();
		if(params.get("filterRegion") != null && String.valueOf(params.get("filterRegion")) != "[]") {
			String[] tempFilterRegion = String.valueOf(params.get("filterRegion")).split(",");
			for(int i=0; i < tempFilterRegion.length; i++) {
				filterRegionList.add(tempFilterRegion[i]);
			}
		}
		
		params.put("filterRegion", filterRegionList);
		
		List<String> filterCategoryList = new ArrayList<String>();
		if(params.get("filterCategory") != null && String.valueOf(params.get("filterCategory")) != "[]") {
			String[] tempFilterCategory = String.valueOf(params.get("filterCategory")).split(",");
			for(int i=0; i < tempFilterCategory.length; i++) {
				filterCategoryList.add(tempFilterCategory[i]);
			}
		}
		
		params.put("filterCategory", filterCategoryList);
		
		
		List<HashMap<String, Object>> resultList = dao.searchData(params);
		
		result.put("result", true);
		result.put("data", resultList);
		
		return result;
	};
	
	@Override
	public HashMap<String, Object> viewPopupData(HashMap<String, Object> params){
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		HashMap<String, Object> resultData = dao.viewPopupData(params);
		
		result.put("result", true);
		result.put("data", resultData);
		
		return result;
	};
	
	@Override
	public WorkDto viewData(int sn) {
		return dao.viewData(sn);
	};
	
	@Override
	public List<HashMap<String, Object>> favoriteData(List<Integer> favoriteSnList){
		List<HashMap<String, Object>> result = dao.favoriteData(favoriteSnList);
		return result;
	}
	
	@Override
	public HashMap<String, Object> insertApply(HttpServletRequest request, HashMap<String, Object> params){
		

		HttpSession session = request.getSession();
		
		int memberSn = ((MemberDto) session.getAttribute("memberInfo")).getSn();
		
		params.put("memberSn", memberSn);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		boolean checkDuplicate = ApplyService.checkDuplicate(params);
		
		if(checkDuplicate) {
			result.put("result", true);
			result.put("status", 1);
		} else {
			int cnt = ApplyService.insertData(params);
			if( cnt > 0) {
				result.put("result", true);
				result.put("status", 0);
			} else {
				result.put("result", false);
			}
		}
		
		return result;
	};
	
	@Override
	public HashMap<String, Object> changeApplyStatus(HashMap<String, Object> params){
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int status = (int) params.get("status"); 
		
		int statusCnt = ApplyService.changeApplyStatus(params);

		//승인할 시
		if(status == 1) {
			dao.changeWorkStatus(params);
			DealService.insertData(params);
		}
		
		if(statusCnt > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	};
	
	@Override
	public HashMap<String,Object> updateTempMerchant(HashMap<String,Object> params){
		HashMap<String,Object> result = new HashMap<String,Object>();
		result.put("result", false);
		
		int cnt = dao.updateTempMerchant(params);
		
		if(cnt > 0) {
			result.put("result", true);
		}
		
		return result;
	}
	
	@Override
	public void changeApplyStatusForApp(HttpServletRequest request, HttpServletResponse response){

		
		boolean impSuccess = false;
		if(request.getParameter("imp_success") != null) {
			impSuccess = Boolean.parseBoolean(request.getParameter("imp_success"));
		}
		
		String merchantUid = "";
		if(request.getParameter("merchant_uid") != null) {
			merchantUid = request.getParameter("merchant_uid");
		}
		
		String impUid = "";
		if(request.getParameter("imp_uid") != null) {
			impUid = request.getParameter("imp_uid");
		}
		
		String msg = "결제에 실패했습니다. 잠시 후 다시 시도해주세요.";
		String targetLink = "/personal/myInfo/page?tabIdx=0";
		if(impSuccess && !merchantUid.equals("") && !impUid.equals("")) {
			WorkDto resultData = dao.getDataForApp(merchantUid);
			
			int applySn = resultData.getTempApplySn();
			
			int workSn = resultData.getSn();
			
			int status = 1;
			
			int memberSn = resultData.getMemberSn();
			
			int recipientSn = resultData.getTempRecipientSn();
			
			int payment = resultData.getPayment();
			
			HashMap<String,Object> params = new HashMap<String,Object>(); 
			params.put("applySn", applySn);
			params.put("workSn", workSn);
			params.put("status", status);
			params.put("memberSn", memberSn);
			params.put("recipientSn", recipientSn);
			params.put("payment", payment);
			params.put("impUid", impUid);
			params.put("merchantUid", merchantUid);
			
			ApplyService.changeApplyStatus(params);

			dao.changeWorkStatus(params);
			DealService.insertData(params);
			
			msg = "결제되었습니다.";
			targetLink = "/personal/myInfo/workView?sn=" + workSn + "&pageCategory=recentPost";
			
		} else {
			
		}
		
		makeSubmitAlertMsg(response, msg, targetLink);
	};
	
	@Override
	public MemberDto viewApplyMember(HashMap<String, Object> params){
		MemberDto result = new MemberDto();
		
		int sn = (int) params.get("sn");
		
		result = MemberService.getMyInfo(sn);
		
		if(result != null) {
			String permissionFileSeq = result.getPermissionFileSeq();
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
				
				result.setPermissionFileNameList(permissionFileSeqList);
			}
			
			String healthCertificateFileSeq = result.getHealthCertificateFileSeq();
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
				
				result.setHealthCertificateFileNameList(healthCertificateFileSeqList);
			}
			
			String etcFileSeq = result.getEtcFileSeq();
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
				
				result.setEtcFileNameList(etcFileSeqList);
			}
		}
		
		return result;
	};
	
	@Override
	public WorkDto completeMyInfoData(int workSn) {
		return dao.completeMyInfoData(workSn);
	}
	
	@Override
	public void changeWorkStatus(HashMap<String, Object> params) {
		dao.changeWorkStatus(params);
	}
	
	@Override
	public HashMap<String, Object> updateDeal(HttpServletRequest request, HashMap<String, Object> params){
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		int cnt = DealService.updateData(params);
		
		if(cnt > 0) {
			
			params.put("status", 2);
			dao.changeWorkStatus(params);
			
			params.put("status", 4);
			ApplyService.changeApplyStatus(params);
			
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		//지급을 해야 함
		
		return result;
	}
	
	@Override
	public int getMemberSn(int workSn) {
		return dao.getMemberSn(workSn);
	};
	
}
