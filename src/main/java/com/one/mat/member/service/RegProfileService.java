package com.one.mat.member.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.one.mat.admin.dto.CompDTO;
import com.one.mat.member.dao.RegProfileDAO;
import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.PhotoDTO;
import com.one.mat.member.dto.ProfileDTO;

@Service
public class RegProfileService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	RegProfileDAO dao;

	private String root = "C:/upload/";
	
	public ArrayList<CompDTO> compList() {
		return dao.compList();
	}

	public void chattingcompSave(Map<String, String> params) {

		CompDTO dto = new CompDTO();

		String memberIdxStr = params.get("memberIdx");
		int memberIdx = Integer.parseInt(memberIdxStr);
		dto.setMember_idx(memberIdx);

		String compStr = params.get("compType_code");
		int compType_code = Integer.parseInt(compStr);
		dto.setCompType_code(compType_code);
		
		String reportIdStr =params.get("reportId");
		int reportId = Integer.parseInt(reportIdStr);
		dto.setComp_reportIdx(reportId);
		
		String chattIdStr = params.get("chattId");
		int chattId = Integer.parseInt(chattIdStr);
		dto.setComp_idfNum(chattId);

		dto.setComp_content(params.get("comp_content"));

		dao.chattingcompSave(dto);

	}

	public void compPhoto(String photo) {
		
		dao.compPhoto(photo);
		
	}

	public void boardcompSave(Map<String, String> params) {
		CompDTO dto = new CompDTO();

		String memberIdxStr = params.get("memberIdx");
		int memberIdx = Integer.parseInt(memberIdxStr);
		dto.setMember_idx(memberIdx);
		
		String boardIdStr = params.get("boardId");
		int boardId = Integer.parseInt(boardIdStr);
		dto.setBoard_id(boardId);
	
		
		String compStr = params.get("compType_code");
		int compType_code = Integer.parseInt(compStr);
		dto.setCompType_code(compType_code);

		dto.setComp_content(params.get("comp_content"));
		
		dao.boardcompSave(dto);
		
	}

	public void commentcompSave(Map<String, String> params) {
		
		CompDTO dto = new CompDTO();

		String memberIdxStr = params.get("memberIdx");
		int memberIdx = Integer.parseInt(memberIdxStr);
		dto.setMember_idx(memberIdx);
		
		String replyIdStr = params.get("replyId");
		int replyId = Integer.parseInt(replyIdStr);
		dto.setReply_id(replyId);

		String compStr = params.get("compType_code");
		int compType_code = Integer.parseInt(compStr);
		dto.setCompType_code(compType_code);

		dto.setComp_content(params.get("comp_content"));
		
		dao.commentcompSave(dto);
	}

	public ArrayList<ProfileDTO> charlist() {
		return dao.charlist();
	}
	public void memberDetail(Model model) {
		MemberDTO mms = dao.memberDetail();
		ProfileDTO pps = dao.proDetail();
		model.addAttribute("pps",pps);
		model.addAttribute("mms",mms);
	}
	public ArrayList<PhotoDTO> memberDetailListPhoto() {
		return dao.memberDetailListPhoto();
	}

	public void historySave(int memberIdx) {
		dao.historySave(memberIdx);
	}

	// -------------------------------------------------
	
	public ArrayList<ProfileDTO> list() {
		return dao.list();
	}

	public ArrayList<ProfileDTO> list2() {
		return dao.list2();
	}

	public void profileSaveDo(Map<String, String> params, String selectedCharTypesCode, 
			MultipartFile[] uploadFiles,String[] dataIndex, int member_idx) {

		logger.info("선택한 코드들 :"+selectedCharTypesCode);
		
		ArrayList<Integer> checkPro = dao.checkPro(member_idx);
		
		// Insert 한 pro_idx 값 가지고 오기
		
		// 값이 정상적으로 들어오는지 체크
		logger.info("프로필Id에 필요 : "+member_idx);
		logger.info("프로필Id에 필요 : "+params.get("pro_dogName"));
		logger.info("프로필Id에 필요 : "+params.get("pro_dogAge"));
		logger.info("프로필Id에 필요 : "+params.get("pro_dogGender"));
		logger.info("프로필Id에 필요 : "+params.get("pro_dogDesc"));
		//logger.info("프로필Id에 필요 : "+params.get("pro_dogScore"));
		//logger.info("프로필Id에 필요 : "+params.get("pro_rep"));
		//logger.info("프로필Id에 필요 : "+params.get("pro_quit"));
		logger.info("기타 프로필 생성 기본에 필요 : "+params.get("charTypeCodes"));
		logger.info("기타 프로필 생성 기본에 필요 : "+params.get("breedType_code"));
		
		
		// 파라미터는 DTO 형태로 넣어야 함
		ProfileDTO dto = new ProfileDTO();
		dto.setMember_idx(member_idx);
		dto.setPro_dogName(params.get("pro_dogName"));
		dto.setPro_dogAge(Integer.parseInt(params.get("pro_dogAge")));
		dto.setPro_dogGender(params.get("pro_dogGender"));
		dto.setPro_dogDesc(params.get("pro_dogDesc"));
		dto.setPro_dogScore(5);
		if(checkPro.isEmpty()) {
			dto.setPro_rep("Y");
		}else {
			dto.setPro_rep("N");
		}
		dto.setPro_quit("N");
		
		//dao 로 dto 에 삽입한 내용을 보내기.
		dao.profileSaveDo(dto);
		
		//생성된 PK 값 가져오기
		int pro_idx = dto.getPro_idx();
		logger.info("생성된 PK 값 : "+pro_idx);
		
		if(pro_idx>0) {
		
			// pro open 삽입
			dao.proOpenAge(pro_idx);
			dao.proOpenGender(pro_idx);
			
			// breed 삽입
			int breedType_code = Integer.parseInt(params.get("breedType_code"));
			dao.breed(pro_idx,breedType_code);
			
			//charType 삽입
			int charType1 = 0;	
			int charType2 = 0;	    
			int charType3 = 0;    
			int charType4 = 0;
			
			if(params.get("charTypeCodes") != null ) {
	 			int charTypeCodes = Integer.parseInt(params.get("charTypeCodes"));	
	 			logger.info("charTypeCodes:"+charTypeCodes);
	 		};
	 		
	 		if(selectedCharTypesCode != null) {
	 			String[] charTypeCodesArr = selectedCharTypesCode.split(",");	
	 			logger.info(Arrays.toString(charTypeCodesArr));
	 			if (charTypeCodesArr.length >= 1) {
	 				charType1 = Integer.parseInt(charTypeCodesArr[0]);
	 			}
	 			if (charTypeCodesArr.length >= 2) {
	 				charType2 = Integer.parseInt(charTypeCodesArr[1]);
	 			}
	 			if (charTypeCodesArr.length >= 3) {
	 				charType3 = Integer.parseInt(charTypeCodesArr[2]);
	 			}
	 			if (charTypeCodesArr.length >= 4) {
	 				charType4 = Integer.parseInt(charTypeCodesArr[3]);
	 			}
	 			dao.charTypeSave(pro_idx,charType1, charType2, charType3, charType4);
	 		}
	 		
	 		logger.info("charType1:"+charType1);
	 	    logger.info("charType2:"+charType2);
	 	    logger.info("charType3:"+charType3);
	 	    logger.info("charType4:"+charType4);
	 	    
	 	    saveFile(pro_idx,uploadFiles,dataIndex);
	
		}    
 	    
	}

	private void saveFile(int pro_idx, MultipartFile[] uploadFiles, String[] dataIndex) {
		
		for (int i = 0; i < dataIndex.length; i++) {
			MultipartFile photo = uploadFiles[i];
			String oriFileName = uploadFiles[i].getOriginalFilename();
			String idx = dataIndex[i];
			
			if (!oriFileName.equals("")) {
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				String fileName = System.currentTimeMillis() + "_" + idx + ext;
				
				byte[] arr;
				try {
					arr = photo.getBytes();
					Path Path = Paths.get(root + fileName);
					Files.write(Path, arr);
					// 새로 사진 추가
					dao.photoInsert(pro_idx, fileName);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	

	

	

}
