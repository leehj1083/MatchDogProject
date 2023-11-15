package com.one.mat.member.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.one.mat.admin.dto.CompDTO;
import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.PhotoDTO;
import com.one.mat.member.dto.ProfileDTO;

public interface RegProfileDAO {

	ArrayList<CompDTO> compList();

	void chattingcompSave(CompDTO dto);

	void compPhoto(String photo);

	void boardcompSave(CompDTO dto);

	void commentcompSave(CompDTO dto);

	ArrayList<ProfileDTO> charlist();

	MemberDTO memberDetail();

	ProfileDTO proDetail();

	ArrayList<PhotoDTO> memberDetailListPhoto();

	void historySave(int memberIdx);
	
	// ------------------------------------

	ArrayList<ProfileDTO> list();

	ArrayList<ProfileDTO> list2();

	void profileSaveDo(ProfileDTO dto);

	void proOpenAge(int pro_idx);

	void proOpenGender(int pro_idx);

	void breed(int pro_idx, int breedType_code);

	void charTypeSave(int pro_idx, int charType1, int charType2, int charType3, int charType4);

	void photoInsert(int pro_idx, String fileName);
	

	
	



	



	



	








	

	

}
