package com.one.mat.board.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.board.service.ReplyService;

@Controller
public class ReplyController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ReplyService service;
	
	@RequestMapping(value = "/replyList")
    @ResponseBody
    public Map<String, Object> replyList(HttpSession session,@RequestParam String boardId) {
		logger.info("컨트롤러boardId: " + boardId);
        return service.replyList(boardId);
    }
	
	@RequestMapping(value = "/replyWrite")
	@ResponseBody
	public Map<String, Object> replyWrite(HttpSession session, @RequestParam Map <String, String> params){
		logger.info("댓글작성parmas: "+params);
	    return service.replyWrite(params);
	}
	
	@RequestMapping(value = "/compReply")
	public String compReply(HttpSession session, @RequestParam String reply_id) {
		return "compReply";
	}
	
	@RequestMapping(value = "/replyUpdate")
	@ResponseBody
	public Map<String, Object> replyUpdate(HttpSession session, @RequestParam Map <String, String> params) {
	    logger.info("수정할댓글params: " + params);
	    return service.replyUpdate(params);
	}
	
	@RequestMapping(value = "/replyDel")
	@ResponseBody
	public Map<String, Object> replyDel(HttpSession session, @RequestParam String reply_id){
		logger.info("수정삭제id: "+ reply_id);
		return service.replyDel(reply_id);
	}
	
}
