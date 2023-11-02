package com.one.mat.member.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.one.mat.member.dto.ProfileDTO;

public interface RegProfileDAO {

	void writemyProfile(ProfileDTO dto);

	

	ArrayList<ProfileDTO> list2();

	void breedTypeSave(int bt_code);

	void charSave(Map<String, Integer> charTypeMap);

	ArrayList<ProfileDTO> list();



	



	








	

	

}
