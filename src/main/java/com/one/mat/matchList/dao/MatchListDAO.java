package com.one.mat.matchList.dao;

import java.util.ArrayList;

import com.one.mat.matchList.dto.MatchListDTO;
import com.one.mat.member.dto.ProfileDTO;

public interface MatchListDAO {

	ArrayList<ProfileDTO> proIdx(int memberIdx);

	ArrayList<MatchListDTO> proSendIdx(int pro_idx);

	MatchListDTO proInfo(int pro_sendIdx);

}
