package com.one.mat.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.one.mat.member.dto.MemberDTO;

public interface MemberListDAO {

	ArrayList<MemberDTO> memberList(int pagePerNum, int offset);

	MemberDTO memberDetail(String member_idx);

	int totalPage(int pagePerNum);

	ArrayList<MemberDTO> memberSearch(String searchType, String searchKeyword, int pagePerNum, int offset);

	int totalPageWithSearch(int pagePerNum, String searchType, String searchKeyword);


}

