package com.kimbyungman.spring.manpower.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kimbyungman.spring.manpower.dto.WorkDto;

@Service
public class WorkDaoImpl implements WorkDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<WorkDto> selectAdmListData(WorkDto searchDto){
		List<WorkDto> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".selectAdmListData",searchDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public int selectAdmTotalCnt(WorkDto searchDto) {
		int result = 0;
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectAdmTotalCnt",searchDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public WorkDto selectAdmViewData(int WorkSn) {
		WorkDto result = new WorkDto();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectAdmViewData",WorkSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Transactional
	@Override
	public int deleteAdmData(int WorkSn) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".deleteAdmData",WorkSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public List<WorkDto> selectListData(WorkDto params){
		List<WorkDto> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".selectListData",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Transactional
	@Override
	public int insertData(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.insert(SERVICE_ID+".insertData",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Transactional
	@Override
	public int updateData(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".updateData",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Transactional
	@Override
	public int deleteData(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".deleteData",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public List<HashMap<String, Object>> searchData(HashMap<String, Object> params) {
		List<HashMap<String, Object>> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".searchData",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public HashMap<String, Object> viewPopupData(HashMap<String, Object> params) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".viewPopupData",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public WorkDto viewData(int sn) {
		WorkDto result = new WorkDto();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".viewData",sn);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public List<HashMap<String, Object>> favoriteData(List<Integer> favoriteSnList){
		List<HashMap<String, Object>> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".favoriteData",favoriteSnList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public WorkDto completeMyInfoData(int workSn) {
		WorkDto result = new WorkDto();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".completeMyInfoData",workSn);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Transactional
	@Override
	public void changeWorkStatus(HashMap<String, Object> params) {
		try {
			sqlSession.update(SERVICE_ID+".changeWorkStatus",params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int getMemberSn(int workSn) {
		int result = 0;
		try {
			HashMap<String, Object> tempResult = sqlSession.selectOne(SERVICE_ID+".getMemberSn",workSn);
			result = (int) tempResult.get("member_sn");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	@Override
	public WorkDto getDataForApp(String merchantUid) {
		WorkDto result = new WorkDto();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".getDataForApp",merchantUid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return result;
	}
	
	@Override
	public int updateTempMerchant(HashMap<String,Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".updateTempMerchant",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
