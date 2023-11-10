package com.one.mat.matchList.dao;

import java.util.ArrayList;
import java.util.List;

import com.one.mat.alarm.dto.AlarmDTO;
import com.one.mat.matchList.dto.MatchListDTO;
import com.one.mat.member.dto.ProfileDTO;

public interface MatchListDAO {

	ArrayList<ProfileDTO> proIdx(int memberIdx);

	ArrayList<MatchListDTO> proSendIdx(int pro_idx);

	MatchListDTO proInfo(int pro_sendIdx);

	ArrayList<MatchListDTO> timeInfo(int pro_sendIdx);

	ArrayList<String> charInfo(int pro_sendIdx);

	String myDogName(int pro_recvIdx);

	String photoInfo(int pro_sendIdx);

	int sendOpen(int match_id);

	int chatOpen(int match_id);

	int chatMove(int match_idx);

	List<AlarmDTO> selectSendRecvIdx(int match_idx);

	void newChattingRoomAlarm(int pro_sendIdx, int pro_redvIdx);

}
