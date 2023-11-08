package com.one.mat.member.service;

import java.util.Random;
import java.util.regex.Pattern;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.one.mat.member.dao.MemberDAO;
import com.one.mat.member.dto.MemberDTO;

@Component
public class MailSendService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberDAO dao;
	@Autowired JavaMailSenderImpl mailSender;

	private int authNumber;
	private String member_newPw;
	
	public void makeRandomNumber() {		
		// 난수 범위 111111~999999
		Random r = new Random();
		int checkNum = r.nextInt(888888)+111111;  
		// nextInt(888888) -> 0~888888이므로 111111더해줘야함
		System.out.println("인증번호 : "+checkNum);
		authNumber=checkNum;
	}	
	
	
	public String joinMailCheck(String member_email) {
		makeRandomNumber();
		String setFrom = "leehjtest1@gmail.com";
		String toMail = member_email;
		String title = "매칭해주게 가입 메일 인증번호 발송.";
		String content = 
				"매칭해주게 서비스를 이용해주셔서 감사합니다." +
		"<br><br>" +
				"인증번호는 "+ authNumber + "입니다." +
		"<br>"+
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요";
		mailSend(setFrom, toMail, title, content);
				
		return Integer.toString(authNumber);
	}

	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);			
		} catch (MessagingException e) {
			e.printStackTrace();
		}		
	}	

	public int sendFindIdMail(MemberDTO dto) {
		makeRandomNumber();
		String setFrom = "leehjtest1@gmail.com";
		String toMail = dto.getMember_email();
		String title = "매칭해주게 아이디 찾기 본인인증 메일 인증번호 발송.";
		String content = 
				"매칭해주게 서비스를 이용해주셔서 감사합니다." +
		"<br><br>" +
				"인증번호는 "+ authNumber + "입니다." +
		"<br>"+
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요";
		mailSend(setFrom, toMail, title, content);
		return authNumber;
	}

	public int sendFindPwMail(MemberDTO dto) {
		makeRandomNumber();
		String setFrom = "leehjtest1@gmail.com";
		String toMail = dto.getMember_email();
		String title = "매칭해주게 비밀번호 찾기 본인인증 메일 인증번호 발송.";
		String content = 
				"매칭해주게 서비스를 이용해주셔서 감사합니다." +
		"<br><br>" +
				"인증번호는 "+ authNumber + "입니다." +
		"<br>"+
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요";
		mailSend(setFrom, toMail, title, content);
		return authNumber;
	}
	
	public MemberDTO sendPwMail(String member_id, String member_email) {
		member_newPw = getTempPassword();
		MemberDTO dto = new MemberDTO();
		String setFrom = "leehjtest1@gmail.com";
		String toMail = member_email;
		String title = "매칭해주게 임시 비밀번호 발송.";
		String content = 
			member_id+" 님 안녕하세요"+
		"<br><br>" +
		"매칭해주게 서비스를 이용해주셔서 감사합니다." +
		"<br><br>" +
				"임시 비밀번호는 "+ member_newPw + "입니다." +
		"<br>"+
				"로그인하시어 비밀번호를 변경해 주세요";
		mailSend(setFrom, toMail, title, content);
		updatePw(member_newPw, member_id, member_email);
		return dto;
	}

	public String getTempPassword(){
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

        String str = "";

        int idx = 0;
        for (int i = 0; i < 6; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
}
	
	private void updatePw(String member_newPw, String member_id, String member_email) {
		String member_pw = member_newPw;
		dao.updatePw(member_pw, member_id, member_email);		
	}	

}
