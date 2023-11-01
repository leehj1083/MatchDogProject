package com.one.mat.chatting.dao;

import java.util.ArrayList;

import com.one.mat.chatting.dto.ChattingDTO;
import com.one.mat.main.dto.MatchingDTO;
import com.one.mat.member.dto.ProfileDTO;

public interface ChattingDAO {
	ArrayList<ChattingDTO> chattingListDo(int ppn, int offset, int memberIdx);

	int totalPage(int p);

	ArrayList<MatchingDTO> proIdx(int memberIdx);

	ArrayList<MatchingDTO> matIdx(int pro_idx);

}
