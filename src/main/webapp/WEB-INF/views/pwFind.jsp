<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
.banner{
	width:1500px;
	display:inline-block;
	border-bottom: 1px solid var(--light);
}

.header{
	display:flex;
	width:1280px;
	height:72px;
	margin:0 110px;
	align-items:center;
}

.logo{
	position: relative;
	width:241px;
	height:70px;
}

.logo_matchDog{
	position: absolute;
	top:8px;
	left:20px;
	display:block;
	width:auto;
	height:44px;
}
	.findForm{
		width:400px;
		height:550px;
		margin: 0 auto;
		border: 1px solid black;
		padding : 30px;
	}
</style>
</head>
<body>
<div id="wrap">
	<div class="banner">
		<div class="header">
			<a href="./"><img src="./resources/img/logo.png" class="logo_matchDog"/></a>
		</div>
	</div>
	<div class="content">
		<div class="findForm">
			<h2 style="text-align: center;">비밀번호 찾기</h2><br><hr/>
			<p/>&nbsp;<h3>아이디</h3>
			<p/><input type="text" name="member_id" placeholder="아이디를 입력 하세요" style="width: 80%"/>
			<p/>&nbsp;<h3>이메일</h3>
			<div>
				<p/><input type="text" id="usermail" name="member_email" placeholder="메일 주소를 입력 하세요" />@
				<select name="emailhost" id="mailhost">
					<option value="naver.com">naver.com</option>	
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
				</select>
				<button type="button" id="identifymail">인증요청</button>
			</div>
			<p/><h3>인증번호</h3>
			<p/><input type="text" name= "certNum" placeholder="인증번호를 입력해주세요" maxlength="6"/>
			<button type="button" id="certNumChk">인증하기</button>
			
			<p/><span id="informPw"></span>
			<br/><hr/>
			<div style="display: block; margin: auto; text-align: center;">
			<br>
				<a href="./">로그인</a> / <a href="./idFind.go">아이디 찾기</a> / <a href="./joinAgree.go">회원가입</a>
			</div>
		</div>
	</div>
</div>
</body>
<script>

$('#identifymail').on('click',function(){
	var member_id = $('input[name="member_id"]').val();
	var member_email = $('input[name="member_email"]').val()+"@"+$('select[name="emailhost"]').val();
	var checkInput = $('input[name="certNum"]');
	console.log('id='+member_id+"/"+'email='+member_email);
	
	var memberDTO={
			member_id : member_id,
			member_email : member_email
	};
	
	$.ajax({
		type : 'post',
		url : 'userMailChk.do',
		data : JSON.stringify(memberDTO),
		contentType:'application/json; charset=utf-8',
		dataType : 'JSON',
		success : function(data){
			console.log("인증번호 :"+data.authNumber);
			alert(data.msg);		
			
			$('#certNumChk').on('click',function(){
				var inputCode = $('input[name="certNum"]').val();
				console.log('id='+member_id+"/"+'email='+member_email);
				if(data.authNumber == inputCode){
					$.ajax({
						type:'post',
						url : 'sendPwMail.do',
						data : {'member_email' : member_email, 'member_id' : member_id},
						dataType :'JSON',
						success : function(data){
							console.log(data);						
							$('#informPw').html('임시 비밀번호를 이메일로 보내드렸습니다.');
	       					$('#informPw').css('color','green');
	       					$('#identifyMail').attr('disabled',true);
	       					$('#usermail').attr('readonly',true);
	       					$('#mailhost').attr('readonly',true);	
	                       },
	                   error: function (e) {
	                	   console.log(e);
	                       }
			           });	
				}else{
					$('#informPw').html('인증번호가 일치하지 않습니다.');
					$('#informPw').css('color','red');
				}								
			});				
		},
		error : function(e){
			console.log(e);
		}		
	});	
});




</script>
</html>