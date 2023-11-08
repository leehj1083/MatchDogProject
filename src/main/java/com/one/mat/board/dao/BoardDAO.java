package com.one.mat.board.dao;

import java.util.ArrayList;
import java.util.Map;

import com.one.mat.board.dto.BoardDTO;
import com.one.mat.board.dto.PhotoDTO;

public interface BoardDAO {

	ArrayList<BoardDTO> list(int pagePerNum, int offset);

	int totalPage(int ppn);
	
	ArrayList<BoardDTO> search(int pagePerNum, int offset, String searchType, String searchKeyword);
	
	int totalPageSearch(int ppn, String searchType, String searchKeyword);
	/////////////////////////////////////////////////////////////////////////
	void writeBoard(BoardDTO dto);

	void bHit(String board_id);

	/////////////////////////////게시글상세보기///////////////////////////////////
	BoardDTO detail(String board_id);
	
	ArrayList<PhotoDTO> getPhoto(String member_idx);
	
	ArrayList<PhotoDTO> getboardPro(String member_idx);
	
	/////////////////////////////////////////////////////////////////////////
	int del(String board_id);

	void update(Map<String, String> params);

	void writePhoto(int board_id, String photo_fileName);

	void delphoto(String photo_id);

	void upbHit(String board_id);

	void like(int boardId, int memberIdx);
	
	void hate(int boardId, int memberIdx);

	int recommendLike(int boardId);

	int recommendHate(int boardId);
	
	int checkRec(int boardId, int memberIdx);

	int deleteRec(int boardId, int memberIdx);

	int recType(String board_id, String member_idx);


}
