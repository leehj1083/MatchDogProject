package com.one.mat.chatting.dao;

import java.util.ArrayList;

import com.one.mat.chatting.dto.MemberDTO;
import com.one.mat.chatting.dto.ProfileDTO;

public interface ChattingDAO {

	MemberDTO login(String id, String pw);

	ArrayList<ProfileDTO> chattingListDo(int ppn, int offset);

	int totalPage(int p);

}
