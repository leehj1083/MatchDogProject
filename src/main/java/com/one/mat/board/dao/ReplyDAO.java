package com.one.mat.board.dao;

import java.util.ArrayList;
import java.util.Map;

import com.one.mat.board.dto.PhotoReplyProDTO;
import com.one.mat.board.dto.ReplyDTO;

public interface ReplyDAO {

	Map<String, Object> replyList();

	ArrayList<ReplyDTO> replyList(int board_id);

	void replyWrite(ReplyDTO dto);

	void replyUpdate(ReplyDTO dto);

	void replyDel(String reply_id);

	// ArrayList<PhotoReplyProDTO> replyPro(String member_idx);

	ArrayList<PhotoReplyProDTO> getReplyPro(String reply_id);


}
