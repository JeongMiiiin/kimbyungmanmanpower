package com.kimbyungman.spring.manpower.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kimbyungman.spring.manpower.dto.MemberDto;


@Repository // 현재 클래스를 dao bean으로 등록
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int idCheck(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".idCheck",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	@Override
	public MemberDto loginCheck(HashMap<String, Object> params) {
		MemberDto result = new MemberDto();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".loginCheck",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	@Override
	public int checkPhoneNum(String phoneNum) {
		int result = 0;
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".checkPhoneNum",phoneNum);
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public int checkFindPassword(HashMap<String, Object> params) {
		int result = 0;
		try {
			result = sqlSession.selectOne(SERVICE_ID+".checkFindPassword",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	};
	
	@Transactional
	@Override
	public void updateCertificationCode(HashMap<String, Object> params) {
		try {

			sqlSession.insert(SERVICE_ID+".updateCertificationCode",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Transactional
	@Override
	public int updateTempPassword(HashMap<String, Object> params) {
		int result = 0;
		
		try {

			result = sqlSession.update(SERVICE_ID+".updateTempPassword",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public String checkCertificationCode(HashMap<String, Object> params) {
		String result = "";
		try {

			result = sqlSession.selectOne(SERVICE_ID+".checkCertificationCode",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Transactional
	@Override
	public int insertData(MemberDto params) {
		int result = 0;
		
		try {
			sqlSession.insert(SERVICE_ID+".insertData",params);
			result = params.getSn();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public int loginAdmCheck(HashMap<String, Object> params) {
		int result = 0;
		
		try {

			result = sqlSession.selectOne(SERVICE_ID+".loginAdmCheck",params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	@Override
	public List<MemberDto> selectAdmListData(MemberDto searchDto){
		List<MemberDto> result = new ArrayList<>();
		
		try {
			result = sqlSession.selectList(SERVICE_ID+".selectAdmListData",searchDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public int selectAdmTotalCnt(MemberDto searchDto) {
		int result = 0;
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectAdmTotalCnt",searchDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public MemberDto selectAdmViewData(int memberSn) {
		MemberDto result = new MemberDto();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".selectAdmViewData",memberSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Transactional
	@Override
	public int insertAdmData(MemberDto params) {
		int result = 0;
		
		try {
			result = sqlSession.insert(SERVICE_ID+".insertAdmData",params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Transactional
	@Override
	public int updateAdmData(MemberDto params) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".updateAdmData",params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Transactional
	@Override
	public int deleteAdmData(int memberSn) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".deleteAdmData",memberSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public MemberDto getMyInfo(int memberSn) {
		MemberDto result = new MemberDto();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".getMyInfo",memberSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Transactional
	@Override
	public int updateMyInfo(MemberDto updateDto) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".updateMyInfo",updateDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Transactional
	@Override
	public int updateDeclaration(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			sqlSession.update(SERVICE_ID+".updateDeclaration",params);
			result = Integer.parseInt(String.valueOf(params.get("declaration_cnt")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Transactional
	@Override
	public int updateApprove(HashMap<String, Object> params) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".updateApprove",params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Transactional
	@Override
	public void bannedMember(HashMap<String, Object> params) {
		try {
			sqlSession.update(SERVICE_ID+".bannedMember",params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public MemberDto checkToken(String tokenValue) {
		MemberDto result = new MemberDto();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".checkToken",tokenValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public HashMap<String, Object> getTokenValue(int memberSn) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".getTokenValue",memberSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	};
	
	@Transactional
	@Override
	public void updateToken(MemberDto params) {
		try {
			sqlSession.update(SERVICE_ID+".updateToken",params);
		} catch (Exception e) {
			e.printStackTrace();
		}
	};
	
	@Override
	public MemberDto signUpLogin(int userSn) {
		MemberDto result = new MemberDto();
		
		try {
			result = sqlSession.selectOne(SERVICE_ID+".signUpLogin",userSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	};
	
	@Override
	public int updateSignUpNoticeAgree(int userSn) {
		int result = 0;
		
		try {
			result = sqlSession.update(SERVICE_ID+".updateSignUpNoticeAgree",userSn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
 