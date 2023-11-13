package com.one.mat.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.one.mat.admin.dto.CompDTO;
import com.one.mat.board.dto.BoardDTO;
import com.one.mat.member.dto.MemberDTO;
import com.one.mat.myPage.DTO.SubsDTO;

public interface MemberListDAO {

	MemberDTO memberDetail(String member_idx);

	ArrayList<MemberDTO> memberList(String searchType, String searchKeyword, int pagePerNum, int offset, String subsType);

	int totalPage(int pagePerNum, String searchType, String searchKeyword, String subsType);

	void memberAuthMod(int subsType_code, int member_idx);

	ArrayList<SubsDTO> subsHistory(int member_idx);

	int countUser(String searchType, String searchKeyword, String subsType);

	ArrayList<CompDTO> sancHistoryList(int member_idx);

	MemberDTO getMemberId(int member_idx);


}

