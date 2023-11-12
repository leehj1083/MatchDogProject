<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	.banner{
		height : 120px;
	}
	.logo_matchDog{
		width : 210px;
		height : 70px;
	}
	.loginForm{
		width:400px;
		height:550px;
		margin: 0 auto;
		border: 1px solid black;
		padding : 30px;
	}
	#login{
		background-color : aqua;
		height : 35px;
		width : 110px;
		text-align: center;
		font-size: medium;
		margin: auto;
		display: block;
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
	<form action="login.do" method="post">
		<div class="loginForm">
			<h2 style="text-align: center;">로그인</h2><br><hr/>
			<p/><h3>아이디</h3>
			<p/><input type="text" name="member_id" placeholder="아이디를 입력 하세요" style="width: 80%;"/>
			<br>
			<h3>비밀번호</h3>
			<p/><input type="password" name="member_pw" placeholder="비밀번호를 입력 하세요" style="width: 80%;"/>
			<br>
			<br>
			<hr/>		
			<br>	
			<input type="submit" id="login" value="로그인"/>
			<br>	
			<hr/>
			<div style="display: block; margin: auto; text-align: center;">
			<br>	
				<a href="./idFind.go">아이디 찾기</a> / <a href="./pwFind.go">비밀번호 찾기</a> / <a href="./joinAgree.go">회원가입</a>
			</div>
		</div>
	</form>
	</div>
</div>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

</script>
</html>