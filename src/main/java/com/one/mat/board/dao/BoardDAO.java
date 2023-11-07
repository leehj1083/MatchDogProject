package com.one.mat.board.dao;

import java.util.ArrayList;
import java.util.Map;

import com.one.mat.board.dto.BoardDTO;
import com.one.mat.board.dto.PhotoDTO;
import com.one.mat.board.dto.RecommendDTO;

public interface BoardDAO {

	ArrayList<BoardDTO> list(int pagePerNum, int offset);

	int totalPage(int ppn);

	void writeBoard(BoardDTO dto);

	void bHit(String board_id);

	BoardDTO detail(String board_id);

	int del(String board_id);

	void update(Map<String, String> params);

	ArrayList<PhotoDTO> getPhoto(String board_id);

	void writePhoto(int board_id, String photo_fileName);

	void delphoto(int photo_id);

	void upbHit(String board_id);

	ArrayList<BoardDTO> search(int pagePerNum, int offset, String searchKeyword);

	void like(int boardId, int memberIdx);
	
	void hate(int boardId, int memberIdx);

	int recommendLike(int boardId);

	int recommendHate(int boardId);
	
	int checkRec(int boardId, int memberIdx);

	int deleteRec(int boardId, int memberIdx);

	int recType(String board_id, String member_idx);



}
