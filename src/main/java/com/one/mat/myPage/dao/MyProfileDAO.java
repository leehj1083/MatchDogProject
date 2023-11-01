package com.one.mat.myPage.dao;

import java.util.ArrayList;
import java.util.Map;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.ProfileDTO;


public interface MyProfileDAO {

	ArrayList<ProfileDTO> MyProfileListDo(int idx);

	int myProfileModUpdateDo(Map<String, String> params);

	void myProfileDelDo(String pro_idx);

	ArrayList<ProfileDTO> charType(int idx);








}
