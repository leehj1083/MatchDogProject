package com.one.mat.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.one.mat.board.service.BoardService;

@Controller
public class BoardController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BoardService service;
	
	@RequestMapping(value="/board")
	public String board() {
		return "list";
	}

	@RequestMapping(value="/list")
	@ResponseBody
	public Map<String, Object> list(HttpSession session,@RequestParam String pagePerNum,
			@RequestParam String page) {
		logger.info("페이지당 보여줄 게시글 수 : "+pagePerNum);
		logger.info("보여줄 페이지 : "+page);
		
		return service.list(pagePerNum, page);
	}
	////////////////////////////////////////////////////
	@RequestMapping(value ="/search")
	@ResponseBody
	public Map<String, Object> search(HttpSession session, @RequestParam String pagePerNum,
	        @RequestParam String page, @RequestParam String searchType, @RequestParam String searchKeyword) {
	    logger.info("페이지당 보여줄 게시글 수: " + pagePerNum);
	    logger.info("보여줄 페이지: " + page);
	    logger.info("검색타입: " + searchType);
	    logger.info("검색내용: " + searchKeyword);
	    return service.search(pagePerNum,page,searchType,searchKeyword);
	}
	
	@RequestMapping(value="/BoardWrite")
	public String BoardWrite() {
		return "BoardWrite";
	}
	////////////////////////////////////////////////////
	@RequestMapping(value="/write")
	public String write(MultipartFile[] photos, @RequestParam Map<String, String> params) {
		logger.info("file 갯수 : "+photos.length);
		logger.info("params : "+params);
		return service.write(params, photos);
	}
	
	@RequestMapping(value="/detail")
	public String detail(HttpSession session, Model model, @RequestParam String board_id) {
		service.detail(board_id,model);
		return "detail";
	}
	
	@RequestMapping(value="/del")
	public String del(@RequestParam String board_id) {
		logger.info("board_id="+board_id);
		service.del(board_id);
		return "redirect:/board";
	}
	
	@RequestMapping(value="/updateForm")
	public String updateForm(Model model, @RequestParam String board_id) {
		logger.info(board_id);
		service.updateForm(board_id,model);
		return "updateForm";
	}
	
	// 수정은 사진 추가만 가능하도록
	@RequestMapping(value="/update")
	public String update(MultipartFile[] photos, @RequestParam Map<String, String> params) {
		logger.info("params : "+params);
		return service.update(params, photos);
	}
	
	@ResponseBody
	@RequestMapping(value = "/delphoto")
	public Map<String, Object> delPhoto(@RequestParam("photo_id") int photo_id) {
	    Map<String, Object> resultMap = new HashMap<>();
	    try {
	        // 사진 삭제 로직 추가 (서비스와 DAO 작성 필요)
	        service.delphoto(photo_id);
	        resultMap.put("success", true);
	    } catch (Exception e) {
	        resultMap.put("success", false);
	    }
	    return resultMap;
	}
	
	@RequestMapping(value = "/compBoard")
	public String comp(HttpSession session, @RequestParam String board_id) {
		return "compBoard";
	}

}
