package com.one.mat.admin.dao;

import java.util.ArrayList;

import com.one.mat.admin.dto.CompDTO;
import com.one.mat.board.dto.BoardDTO;
import com.one.mat.member.dto.ProfileDTO;

public interface CompDAO {

	ArrayList<CompDTO> list(int ppn, int offset);

	int totalPage(int ppn);

	void changeCheck(int id);

	ArrayList<CompDTO> list3(int ppn, int offset);

	ArrayList<CompDTO> list4(int ppn, int offset);

	ArrayList<CompDTO> list5(int ppn, int offset);

	ArrayList<CompDTO> list6(int ppn, int offset);

	ArrayList<CompDTO> list7(int ppn, int offset);

	ArrayList<CompDTO> list8(int ppn, int offset);

	ArrayList<BoardDTO> search(int ppn, int offset, String searchType, String searchKeyword);

	

	CompDTO detailList(CompDTO compDTO);

	String getMemberIdByCompId(int comp_idx);

	String reMemerIdByCompId(int comp_idx);

	void loginLock(CompDTO dto);
	void proRegistUpdate(CompDTO dto);

	CompDTO compHistoryrec(CompDTO compDTO);

	ArrayList<CompDTO> CompList(int compIdx);

	void memberUpdate(CompDTO dto);



	



	



	
	

}
