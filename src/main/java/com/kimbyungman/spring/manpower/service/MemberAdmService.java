package com.kimbyungman.spring.manpower.service;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.kimbyungman.spring.manpower.dto.MemberDto;

public interface MemberAdmService {
		boolean loginCheck(HashMap<String, Object> params); //로그인 체크 (관리자)
		String listPage(MemberDto searchDto, HttpServletRequest request, Model model); //리스트 페이지 이동 (관리자)
		String insertPage(MemberDto searchDto, HttpServletRequest request, Model model); //등록 페이지 이동 (관리자)
		void insertData(MemberDto searchDto, HttpServletResponse response); //등록 (관리자)
		String updatePage(MemberDto searchDto, int memberSn, HttpServletRequest request, Model model); //변경 페이지 이동 (관리자)
		void updateData(MemberDto searchDto, HttpServletRequest request, HttpServletResponse response); //변경 (관리자)
		void deleteData(int categorySn, HttpServletResponse response); //삭제 (관리자)
		void updateDeclaration(HashMap<String, Object> params); //신고된 회원 상태 변경 (관리자)
		HashMap<String,Object> updateApprove(HashMap<String, Object> params); //승인상태 변경 (관리자)
}
