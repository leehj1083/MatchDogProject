package com.one.mat.myPage.dao;

import java.util.ArrayList;
import java.util.Map;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.ProfileDTO;


public interface MyProfileDAO {

	ArrayList<ProfileDTO> MyProfileListDo(int idx);
	
	ArrayList<String> charType(int pro_idx);

	ArrayList<String> photo_fileName(int pro_idx);
	

	int myProfileModUpdateDo(Map<String, String> params);

	void myProfileDelDo(String pro_idx);








}
