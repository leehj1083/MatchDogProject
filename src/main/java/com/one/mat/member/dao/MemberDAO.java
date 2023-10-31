package com.one.mat.member.dao;

import java.util.HashMap;

import com.one.mat.member.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO login(String id, String pw);

	int overlayId(String id);

	int overlayNick(String nickName);

	int join(HashMap<String, String> params);

}
