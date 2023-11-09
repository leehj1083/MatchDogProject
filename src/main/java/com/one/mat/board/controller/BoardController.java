package com.one.mat.board.controller;

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
	////////////////////////////////////////////////////
	
	@RequestMapping(value="/BoardWrite")
	public String BoardWrite() {
		return "BoardWrite";
	}

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
	
	@RequestMapping(value="/compSaveBoard.do")
	public String compSaveBoard(HttpSession session, Model model, @RequestParam String board_id) {
		logger.info(board_id);
		return "compSaveBoard.do";
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
	
	@RequestMapping(value="/update")
	public String update(MultipartFile[] photos, @RequestParam Map<String, String> params) {
		logger.info("params : "+params);
		return service.update(params, photos);
	}
	
	////////////////////////////// 신고창으로 이동 /////////////////////////////////////////
	@RequestMapping(value = "/compBoard")
	public String comp(HttpSession session, @RequestParam String board_id) {
		return "compBoard";
	}
	////////////////////////////// 추천 버튼 요청 /////////////////////////////////////////
	// 좋아요 갯수 보여주기
	@RequestMapping(value="/recommendLike")
	@ResponseBody
	public Map<String, Object> recommendLike(HttpSession session, @RequestParam String board_id){
		// logger.info("컨트롤러 좋아요갯수 boar_id: " + board_id);
		return service.recommendLike(board_id);
	}
	// 싫어요 갯수 보여주기
	@RequestMapping(value="/recommendHate")
	@ResponseBody
	public Map<String, Object> recommendHate(HttpSession session, @RequestParam String board_id){
		// logger.info("컨트롤러 싫어요갯수 boar_id: " + board_id);
		return service.recommendHate(board_id);
	}
	
	// 이미 좋아요, 싫어요 버튼을 누른적이 있는지 Count
	@RequestMapping(value = "/checkRec")
	@ResponseBody
	public Map<String, Object> checkRec(HttpSession session, @RequestParam String board_id, @RequestParam String member_idx){
		return service.checkRec(board_id, member_idx);
	}
	
	// 추천 삭제
	@RequestMapping(value = "/deleteRec")
	@ResponseBody
	public Map<String, Object> deleteRec(
			HttpSession session, @RequestParam String board_id, @RequestParam String member_idx, @RequestParam String rec_type){
		return service.deleteRec(board_id, member_idx, rec_type);
	}
	
	// 좋아요 insert 요청
	@RequestMapping(value="/like")
	@ResponseBody
	public Map<String, Object> like(HttpSession session, @RequestParam String board_id, @RequestParam String member_idx){
		logger.info("좋아요버튼board_id: "+board_id);
		logger.info("좋아요버튼member_idx: "+member_idx);
		return service.like(board_id, member_idx);
	}
	
	// 싫어요 insert 요청
	@RequestMapping(value="/hate")
	@ResponseBody
	public Map<String, Object> hate(HttpSession session, @RequestParam String board_id, @RequestParam String member_idx){
		logger.info("싫어요버튼board_id: "+board_id);
		logger.info("싫어요버튼member_idx: "+member_idx);
		return service.hate(board_id, member_idx);
	}
	
	

}
