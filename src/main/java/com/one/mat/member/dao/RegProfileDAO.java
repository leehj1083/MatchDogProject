package com.one.mat.member.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.one.mat.admin.dto.CompDTO;
import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.PhotoDTO;
import com.one.mat.member.dto.ProfileDTO;

public interface RegProfileDAO {

	void writemyProfile(ProfileDTO dto);

	ArrayList<ProfileDTO> list2();

	void breedTypeSave(int bt_code);

	void charSave(Map<String, Integer> charTypeMap);

	ArrayList<ProfileDTO> list();

	void photos1(String ph_1);

	void photos2(String ph_2);

	void photos3(String ph_3);

	void photos4(String ph_4);

	void photos5(String ph_5);

	void photos6(String ph_6);

	void photos7(String ph_7);

	void photos8(String ph_8);

	void photos9(String ph_9);

	void home3();

	void proReq(MemberDTO memberDTO);

	ArrayList<CompDTO> compList();

	void chattingcompSave(CompDTO dto);

	void compPhoto(CompDTO dto);

	void boardcompSave(CompDTO dto);

	void commentcompSave(CompDTO dto);

	ArrayList<ProfileDTO> charlist();

	MemberDTO memberDetail();

	ProfileDTO proDetail();

	ArrayList<PhotoDTO> memberDetailListPhoto();

	void proopen1();

	void proopen2();

	void historySave(int memberIdx);

	

	
	



	



	



	








	

	

}
