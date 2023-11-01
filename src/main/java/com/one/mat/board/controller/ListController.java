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

import com.one.mat.board.service.ListService;

@Controller
public class ListController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ListService service;
	
	@RequestMapping(value="/board")
	public String board() {
		return "list";
	}
	
	@RequestMapping(value="/list")
	@ResponseBody
	public Map<String, Object> list(@RequestParam String pagePerNum,
			@RequestParam String page) {
		logger.info("페이지당 보여줄 게시글 수 : "+pagePerNum);
		logger.info("보여줄 페이지 : "+page);
		
		return service.list(pagePerNum, page);
	}

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
	public String detail(Model model, @RequestParam String board_id) {
		// model - bbs 의 내용 & photo 내용
		service.detail(board_id,model); // model 에 서비스에서 호출한 내용을 넣도록 한다.
		return "detail";
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
	
	/*
	@RequestMapping(value="/del")
	public String del(@RequestParam String idx) {
		logger.info("idx="+idx);
		service.del(idx);
		return "redirect:/list";
	}
	*/

}
