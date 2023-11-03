package com.one.mat.chatting.dao;

import java.util.ArrayList;

import com.one.mat.chatting.dto.ChattingDTO;
import com.one.mat.member.dto.ProfileDTO;

public interface ChattingDAO {
	
	ArrayList<ChattingDTO> chattingListDo(int ppn, int offset, int memberIdx);

	ChattingDTO chatProInfo(int pro_idx);
	
	ChattingDTO chatMsgInfo(int chat_idx);
	
	ChattingDTO chatPhotoInfo(int chat_idx);
	
	String myDogName(int pro_me);
	
	ArrayList<ProfileDTO> proIdx(int memberIdx);

	ArrayList<ChattingDTO> chatIdx(int pro_idx);

	ChattingDTO chattingRoomGo(int chat_id);
	
	int chatSaveDo();

	ArrayList<ChattingDTO> chatRoomListDo(int chat_id);

	ChattingDTO toFrom(int pro_idx, int chat_id);




	


}
