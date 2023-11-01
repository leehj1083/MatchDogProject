package com.one.mat.member.dao;

import java.util.HashMap;

import com.one.mat.member.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO login(String member_id, String member_pw);

	int overlayId(String member_id);

	int overlayNick(String member_nickName);

	int join(HashMap<String, String> params);

	int setSubsType_code(int i);

}
