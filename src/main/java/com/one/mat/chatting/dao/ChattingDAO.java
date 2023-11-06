package com.one.mat.chatting.dao;

import java.util.ArrayList;

import com.one.mat.board.dto.PhotoDTO;
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

	ArrayList<ChattingDTO> chatRoomListDo(int chat_id);

	ChattingDTO toFrom(int pro_idx, int chat_id);

	int savePhoto(int chatMsg_idx, String fileName);

	ArrayList<ChattingDTO> totalMsg(int chat_me);

	void savePhotoMsg(int chat_id, int chat_me, int chat_you);
	ArrayList<ChattingDTO> getChatMsgIdx(int chat_id, int uploadPhotoSize);

	void chatSaveDo(int chat_id, int chat_me, int chat_you, String content);




	


}
