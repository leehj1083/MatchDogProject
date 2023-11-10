package com.one.mat.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.ProfileDTO;

public interface MemberDAO {

	MemberDTO login(String member_id, String member_pw);

	int overlayId(String member_id);

	int overlayNick(String member_nickName);

	int join(MemberDTO dto);
	
	void setSubsType_code(int member_idx, int subsType_code);

	ArrayList<ProfileDTO> loginProf(String member_id, String member_pw);

	int nameMailChk(MemberDTO dto);

	int userMailChk(MemberDTO dto);

	String informId(MemberDTO dto);

	void updatePw(String member_pw, String member_id, String member_email);


}
