package com.one.mat.member.dao;

import com.one.mat.member.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO login(String id, String pw);

	int overlayId(String id);

	int overlayNick(String nickName);

}
