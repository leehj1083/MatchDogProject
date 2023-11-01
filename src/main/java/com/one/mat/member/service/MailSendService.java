package com.one.mat.member.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {
	
	@Autowired JavaMailSenderImpl mailSender;

	private int authNumber;
	
	public void makeRandomNumber() {		
		// 난수 범위 111111~999999
		Random r = new Random();
		int checkNum = r.nextInt(888888)+111111;  
		// nextInt(888888) -> 0~888888이므로 111111더해줘야함
		System.out.println("인증번호 : "+checkNum);
		authNumber=checkNum;
	}
	
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = "leehj1083@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일입니다.";
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

	
	
	
	

}
