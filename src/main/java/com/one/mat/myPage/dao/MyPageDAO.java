package com.one.mat.myPage.dao;

import com.one.mat.member.dto.MemberDTO;


public interface MyPageDAO {

	String login(String id, String pw);

	MemberDTO MyPageListDo(String id);

}
