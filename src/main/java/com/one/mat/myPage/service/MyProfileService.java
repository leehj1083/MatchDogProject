package com.one.mat.myPage.service;

import java.io.IOException;
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

import com.one.mat.member.dto.PhotoDTO;
import com.one.mat.member.dto.ProfileDTO;
import com.one.mat.myPage.dao.MyProfileDAO;

@Service
public class MyProfileService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	MyProfileDAO dao;

	private String root = "C:/upload/";
	private String temp = "C:/upload/temp";

	public void MyProfileListDo(int idx, Model model) {

		ArrayList<ProfileDTO> myProfileList = new ArrayList<ProfileDTO>();

		ArrayList<ProfileDTO> myProfile = dao.MyProfileListDo(idx);

		for (ProfileDTO profileDTO : myProfile) {
			int pro_idx = profileDTO.getPro_idx();

			// 성향 정보를 가져옴
			ArrayList<ProfileDTO> charTypeList = dao.charType(pro_idx);

			// 해당 프로필의 성향 정보를 프로필에 추가
			profileDTO.setCharTypeList(charTypeList);

			// 사진 정보를 가져와야 함
			ArrayList<PhotoDTO> photoList = dao.photoList(pro_idx);
			// 해당 프로필의 사진 정보를 프로필에 추가해야 함
			profileDTO.setPhotoList(photoList);

			// 나이 오픈 정보 가져오기
			String pro_dogAgeOpen = dao.pro_dogAgeOpen(pro_idx);
			profileDTO.setPro_dogAgeOpen(pro_dogAgeOpen);

			// 성별 오픈 정보 가져오기
			String pro_dogGenderOpen = dao.pro_dogGenderOpen(pro_idx);
			profileDTO.setPro_dogGenderOpen(pro_dogGenderOpen);

			// 수정된 프로필을 myProfileList에 추가
			myProfileList.add(profileDTO);

			logger.info("성향들:" + charTypeList);
			logger.info("사진이름들:" + photoList);
			logger.info("나이 오픈:" + pro_dogAgeOpen);
			logger.info("성별 오픈:" + pro_dogGenderOpen);
			logger.info("br");
		}

		model.addAttribute("myProfile", myProfileList);
		/* model.addAttribute("charType", charTypeList); */

	}

	public void MyProfileModList(int pro_idx, Model model) {

		// 1차적으로 가져온 정보들 담기
		ProfileDTO MyProfileModList = dao.MyProfileModList(pro_idx);
		ArrayList<ProfileDTO> charTypeList = dao.charType(pro_idx);
		ArrayList<PhotoDTO> photoList = dao.photoList(pro_idx);
		// 세연 추가
		String photoName = dao.photoName(pro_idx);

		// MyProfileModList 에 다른 정보도 담아서 한 뭉테기로 만들기
		MyProfileModList.setCharTypeList(charTypeList);
		MyProfileModList.setPhotoList(photoList);

		logger.info("가져올 정보:" + MyProfileModList);
		logger.info("성향들:" + charTypeList);
		logger.info("사진이름들:" + photoList);

		model.addAttribute("MyProfileMod", MyProfileModList);
		// 세연 추가
		model.addAttribute("photoName", photoName);

	}

	public ArrayList<ProfileDTO> charTypeList() {
		return dao.charTypeList();
	}

	public ArrayList<ProfileDTO> breedTypeList() {
		return dao.breedTypeList();
	}

	public void myProfileOpenDo(int pro_idx, int openType_code, String toggleValue) {
		dao.myProfileOpenDo(pro_idx, openType_code, toggleValue);

	}

	public void myProfileRepDo(int pro_idx, int idx) {
		dao.myProfileRepDel(pro_idx, idx);
		dao.myProfileRepDo(pro_idx, idx);

	}

	public void myProfileDelDo(int pro_idx) {
		dao.myProfileDelDo(pro_idx);

	}

	public void myProfileModUpdateDo(Map<String, String> params) {

		dao.myProfileModUpdateDo(params);

	}

	public void charTypeSave(int pro_idx, int charType1, int charType2, int charType3, int charType4) {
		dao.charTypeDel(pro_idx);
		dao.charTypeSave(pro_idx, charType1, charType2, charType3, charType4);

	}

	
	
	// 세연 코드 추가
	public void photoInsert(MultipartFile[] uploadFiles, int pro_idx, String[] dataIndex) {
		
		
		// 기존 사진 데이터는 지워주기
		int row = dao.photoDel(pro_idx);

		if (row != 0) {

			for (int i = 0; i < dataIndex.length; i++) {
				MultipartFile photo = uploadFiles[i];
				String oriFileName = uploadFiles[i].getOriginalFilename();
				String idx = dataIndex[i];

				if (!oriFileName.equals("")) {
					String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
					String fileName = System.currentTimeMillis() + "_" + idx + ext;
					logger.info(fileName);

					byte[] arr;
					try {
						arr = photo.getBytes();
						Path tempPath = Paths.get(root + fileName);
						Files.write(tempPath, arr);
						// 새로 사진 추가
						dao.photoInsert(pro_idx,fileName);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}

	}

	public HashMap<String, Object> photoUploadDo(int pro_idx) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<String> photos = dao.photoUploadDo(pro_idx);
		
		map.put("photos", photos);
		
		return map;
	}

}


