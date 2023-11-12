package com.one.mat.main.dao;

import java.util.ArrayList;
import java.util.Map;

import com.one.mat.main.dto.ProOpenDTO;
import com.one.mat.member.dto.MatchAllDTO;
import com.one.mat.member.dto.PhotoDTO;
import com.one.mat.member.dto.ProfileDTO;

public interface MatchingDAO {
	
	ArrayList<ProfileDTO> MyProfileListDo(int member_idx);
	
	ArrayList<MatchAllDTO> matchingList(int member_idx, int pro_idx, int count);
	
	ArrayList<MatchAllDTO> unloginedMatchingList();

	int homeSend(Map<String, String> map);
	
	Map<String, Object> memberDetailListGO(int pro_idx);

	void matchingSendAlarm(int pro_sendIdx, int pro_recvIdx);

	ArrayList<PhotoDTO> memberDetailPhotoDo(int pro_idx);

	ArrayList<ProOpenDTO> MatchingProOpenDo(int pro_idx);



}
