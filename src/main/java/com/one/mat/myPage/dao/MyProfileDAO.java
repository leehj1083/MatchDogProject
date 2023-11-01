package com.one.mat.myPage.dao;

import java.util.Map;

import com.one.mat.member.dto.MemberDTO;


public interface MyProfileDAO {

	MemberDTO MyProfileListDo(int idx);

	int myProfileModUpdateDo(Map<String, String> params);








}
