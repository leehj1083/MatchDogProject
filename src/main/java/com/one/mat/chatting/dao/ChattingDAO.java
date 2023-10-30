package com.one.mat.chatting.dao;

import java.util.ArrayList;


import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.ProfileDTO;

public interface ChattingDAO {

	MemberDTO login(String id, String pw);

	ArrayList<ProfileDTO> chattingListDo(int ppn, int offset);

	int totalPage(int p);

}
