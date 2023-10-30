package com.one.mat.chatting.dao;

import java.util.ArrayList;

import com.one.mat.chatting.dto.ChattingDTO;

public interface ChattingDAO {
	ArrayList<ChattingDTO> chattingListDo(int ppn, int offset, int memberIdx);

	int totalPage(int p);

	ArrayList<Integer> proIdx(int memberIdx);



}
