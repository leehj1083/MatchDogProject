package com.one.mat.board.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.one.mat.board.dao.BoardDAO;
import com.one.mat.board.dto.BoardDTO;
import com.one.mat.board.dto.PhotoDTO;


@Service
public class BoardService {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired BoardDAO dao;
	
	private String root = "C:/upload/";
	
	public Map<String, Object> list(String pagePerNum, String page) {
		
		int ppn = Integer.parseInt(pagePerNum);
		int p = Integer.parseInt(page);		
		int offset = (p-1)*ppn;		
		ArrayList<BoardDTO> list = dao.list(ppn,offset);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : "+pages);
		
		if(p>pages) {
			p = pages;
		}		
		map.put("currPage", p);
		
		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", list);		
		return map;
	}

	//////////////////////////////////////////////////
	public String write(Map<String, String> params, MultipartFile[] photos) {
		BoardDTO dto = new BoardDTO();
	    dto.setBoard_subject(params.get("board_subject"));
	    String memberidxstr = params.get("member_idx");
	    int memberidx = Integer.parseInt(memberidxstr);
	    dto.setMember_idx(memberidx);
	    dto.setBoard_content(params.get("board_content"));
	    //logger.info("board_subject: " + dto.getBoard_subject());
	    //logger.info("member_idx: " + dto.getMember_idx());
	    //logger.info("board_content: " + dto.getBoard_content());
	    dao.writeBoard(dto);
	    //logger.info("dto: " + dto);
	    int board_id = dto.getBoard_id();
	    logger.info("board_id="+board_id);
	    String page = "redirect:/board";
	    
	    if(board_id>0) {
	        try {
	            saveFile(board_id, photos);
	            page = "redirect:/board";
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return page;
	}
	
	private void saveFile(int board_id, MultipartFile[] photos) throws Exception {
	    for (MultipartFile photo : photos) {
	        String photo_fileName = photo.getOriginalFilename();
	        logger.info("photo_fileName : " + photo_fileName);
	        if (!photo_fileName.equals("")) {                
	            byte[] arr = photo.getBytes();
	            Path path = Paths.get(root + photo_fileName);
	            Files.write(path, arr);
	            dao.writePhoto(board_id, photo_fileName);
	        }
	    }
	}

	public void detail(String board_id, Model model) {
		dao.bHit(board_id);
		BoardDTO board = dao.detail(board_id);
		logger.info("DTO형식의 board 값: "+board);
		ArrayList<PhotoDTO> photos = dao.getPhoto(String.valueOf(board.getBoard_id())); // 사진
		logger.info("사진board_id=photos: "+photos);
		model.addAttribute("board",board);
		model.addAttribute("photos",photos);
	}

	public void del(String board_id) {
		logger.info("board_id="+board_id);
		// ArrayList<PhotoDTO> photos = dao.getPhoto(board_id);
		// logger.info("지워야할 파일 : "+photos);
		int row = dao.del(board_id);
		/*
		if(row>0) {
			for(PhotoDTO dto : photos) {
				File file = new File(root+dto.getNewFileName());
				if(file.exists()) {
					logger.info(dto.getNewFileName()+" 삭제 결과 : "+file.delete());
				}
			}
		}
		*/
	}

	public void updateForm(String board_id, Model model) {
		BoardDTO board = dao.detail(board_id);
		ArrayList<PhotoDTO> photos = dao.getPhoto(String.valueOf(board.getBoard_id()));
		model.addAttribute("board",board);
		model.addAttribute("photos",photos);
	}

	public String update(Map<String, String> params, MultipartFile[] photos) {
		dao.upbHit(params.get("board_id"));
		logger.info("params : "+params);
		logger.info("board_id="+params.get("board_id"));
		String page = "redirect:/board";
		dao.update(params);
		int board_id = Integer.parseInt(params.get("board_id"));
		
		if(board_id>0) {
			try {
				saveFile(board_id,photos);
				page = "redirect:/detail?board_id="+board_id;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return page;
	}
	public void delphoto(int photo_id) {
		dao.delphoto(photo_id);
	}
	
	public Map<String, Object> search(String pagePerNum, String page, String searchType, String searchKeyword) {
		
        int ppn = Integer.parseInt(pagePerNum);
        int p = Integer.parseInt(page);
        int offset = (p - 1) * ppn;
        ArrayList<BoardDTO> list = dao.search(ppn,offset,searchKeyword);
        logger.info("search의 list: "+list.toString());
        Map<String, Object> map = new HashMap<String, Object>();
        int pages = dao.totalPage(ppn);
        logger.info("만들수 있는 총 페이지 갯수: " + pages);
        if (p > pages) {
            p = pages;
        }
        map.put("currPage", p);
        map.put("pages", pages);
        map.put("list", list);
        return map;
	}
	
}
