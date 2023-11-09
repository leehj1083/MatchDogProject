package com.one.mat.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.board.dao.ReplyDAO;
import com.one.mat.board.dto.PhotoDTO;
import com.one.mat.board.dto.PhotoReplyProDTO;
import com.one.mat.board.dto.ReplyDTO;

@Service
public class ReplyService {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired ReplyDAO dao;

	public Map<String, Object> replyList(String boardId) {
		Map<String, Object> map = new HashMap<String, Object>();
		int board_id = Integer.parseInt(boardId);
		logger.info("board_id: "+board_id);
		ArrayList<ReplyDTO> replyList = dao.replyList(board_id);
		int member_idx = 0;
		for (ReplyDTO reply : replyList) {
			member_idx = reply.getMember_idx();
		}
		ArrayList<PhotoReplyProDTO> photoReply = dao.replyPro(String.valueOf(member_idx));
		map.put("photoReply", photoReply);
		map.put("replyList", replyList);
		logger.info("replyList: "+replyList);
		logger.info("photoReply: "+photoReply);
		return map;
	}
	
	public Map<String, Object> replyWrite(Map<String, String> params) {
		ReplyDTO dto = new ReplyDTO();
		dto.setReply_content(params.get("reply_content"));
		String memberIdx = params.get("member_idx");
		String boardId = params.get("board_id");
		int member_idx = Integer.parseInt(memberIdx);
		int board_id = Integer.parseInt(boardId);
		dto.setMember_idx(member_idx);
		dto.setBoard_id(board_id);
		dao.replyWrite(dto);
		
		int reply_id = dto.getReply_id();
		logger.info("reply_id: " + reply_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_id", board_id);

		return map;
	}

	public Map<String, Object> replyUpdate(Map<String, String> params) {
		ReplyDTO dto = new ReplyDTO();
		dto.setReply_content(params.get("editedContent"));
		String replyId = params.get("reply_id");
		int reply_id = Integer.parseInt(replyId);
		dto.setReply_id(reply_id);
		dao.replyUpdate(dto);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reply_id", reply_id);
		
		return map;
	}

	public Map<String, Object> replyDel(String reply_id) {
		
		dao.replyDel(reply_id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reply_id", reply_id);
		return map;
	}

}
