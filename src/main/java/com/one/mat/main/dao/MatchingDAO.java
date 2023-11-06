package com.one.mat.main.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.one.mat.member.dto.ProfileDTO;

public interface MatchingDAO {

	List<Map<String, Object>> matchingList(int member_idx, int pro_idx);

	ArrayList<ProfileDTO> MyProfileListDo(int member_idx);

	ArrayList<String> matchingCharType(int pro_idx);

	ArrayList<String> photo_fileName(int pro_idx);

	int homeSend(Map<String, String> map);



	


}
