package com.one.mat.main.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.one.mat.member.dto.PhotoDTO;
import com.one.mat.member.dto.ProfileDTO;

public interface MatchingDAO {

	List<Map<String, Object>> unloginedMatchingList();
	
	List<Map<String, Object>> matchingList(int member_idx, int pro_idx);

	ArrayList<ProfileDTO> MyProfileListDo(int member_idx);

	int homeSend(Map<String, String> map);

	Map<String, Object> memberDetailListGO(int pro_idx);

	ArrayList<ProfileDTO> charType(int pro_Idx);

	ArrayList<PhotoDTO> photoList(int pro_Idx);

	String pro_dogAgeOpen(int pro_Idx);

	String pro_dogGenderOpen(int pro_Idx);




	


}
