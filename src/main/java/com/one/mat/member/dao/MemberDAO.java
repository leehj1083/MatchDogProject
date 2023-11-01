package com.one.mat.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.ProfileDTO;

public interface MemberDAO {

	MemberDTO login(String member_id, String member_pw);

	int overlayId(String member_id);

	int overlayNick(String member_nickName);

	int join(MemberDTO dto);
	
	void setSubsType_code(int member_idx, int subsType_code);

	HashMap<String, Object> idMailChk(String member_id, String member_email);

	HashMap<String, Object> nameMailChk(String member_name, String member_email);

	ArrayList<ProfileDTO> loginProf(String member_id, String member_pw);

}
