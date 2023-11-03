package com.one.mat.board.dao;

import java.util.ArrayList;
import java.util.Map;

import com.one.mat.board.dto.ReplyDTO;

public interface ReplyDAO {

	Map<String, Object> replyList();

	ArrayList<ReplyDTO> replyList(int board_id);


}
