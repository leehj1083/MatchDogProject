package com.one.mat.myPage.dao;

import java.util.ArrayList;
import java.util.Map;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.PhotoDTO;
import com.one.mat.member.dto.ProfileDTO;


public interface MyProfileDAO {

	// 전체 프로필 리스트 불러오는 로직
	ArrayList<ProfileDTO> MyProfileListDo(int idx);
	
	ArrayList<ProfileDTO> charType(int pro_idx);
	
	String pro_dogAgeOpen(int pro_idx);
	String pro_dogGenderOpen(int pro_idx);

	ArrayList<PhotoDTO> photoList(int pro_idx);
	
	
	// 개별 프로필 수정 페이지에 저장된 정보 가져오는 로직
	ProfileDTO MyProfileModList(int pro_idx);
	ArrayList<ProfileDTO> charTypeList();	
	ArrayList<ProfileDTO> breedTypeList();
	
	// 프로필 삭제 메서드
	void myProfileDelDo(String pro_idx);

	// 나이, 성별 on/off
	void myProfileOpenDo(int pro_idx, int openType_code, String toggleValue);

	// 대표프로필 지정
	void myProfileRepDel(int pro_idx, int idx);
	void myProfileRepDo(int pro_idx, int idx);

	//프로필 삭제(숨김 처리)
	void myProfileDelDo(int pro_idx);

	// 프로필 수정 업데이트 로직
	void charTypeDel(int pro_idx);
	void myProfileModUpdateDo(Map<String, String> params);
	void charTypeSave(int pro_idx, int charType1, int charType2, int charType3, int charType4);

	//대표프로필 사진 가져오기
	String repPhotoName(int member_idx);
	
	// 세연 추가
	String photoName(int pro_idx);

	int photoDel(int pro_idx);
	void photoInsert(int pro_idx, String fileName);

	ArrayList<String> photoUploadDo(int pro_idx);

	ArrayList<String> getPhoto(int pro_idx);

	void delPhotoName(String delExistPhoto);
	


	




	










}
