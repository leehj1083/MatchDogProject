package com.one.mat.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.board.dao.ReplyDAO;
import com.one.mat.board.dto.ReplyDTO;

@Service
public class ReplyService {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired ReplyDAO dao;
	/*
	public Map<String, Object> replyWrite(String member_idx, String reply_content, String board_id) {
		int memberIdx = Integer.parseInt(member_idx);
		String replyContent = reply_content;
		logger.info("memberIdx: "+member_idx,"replyContent: "+replyContent);
		return dao.replyWrite(memberIdx, replyContent);
	}
	*/

	public Map<String, Object> replyList(String boardId) {
		Map<String, Object> map = new HashMap<String, Object>();
		int board_id = Integer.parseInt(boardId);
		logger.info("board_id: "+board_id);
		ArrayList<ReplyDTO> replyList = dao.replyList(board_id);
		map.put("replyList", replyList);
		return map;
	}

	
}
