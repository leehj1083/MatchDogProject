<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<style>
a, a:link, a:visited, a:active, a:hover {
	text-decoration: none;
	color: var(--black);
}

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
.loginForm {
    width: 300px;
    height: 550px;
    margin: 0 auto;
	font-family:pretendard;
    padding: 30px;
}
.loginForm input[type="text"],
.loginForm input[type="password"] {
    height: 38px; /* 높이를 조절하고자 하는 값으로 수정 */
    font-family:pretendard;
    
}

#login {
    display: block;
    width: 300px;
    height: 40px;
    margin: 20px auto; /* 가운데 정렬을 위해 수정 */
    padding: 6px 20px;
    font-size: 15px;
    text-align: center;
    text-decoration: none;
    background-color: #1abc9c;
    color: #ffffff;
    border-radius: 5px;
    border: 1px solid #1abc9c;
    cursor: pointer;
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
			<h2 style="text-align: center;">로그인</h2><br>
			<p/><h3>아이디</h3>
			<p/><input type="text" name="member_id" placeholder="아이디를 입력하세요" style="width: 100%;"/>
			<br>
			<h3>비밀번호</h3>
			<p/><input type="password" name="member_pw" placeholder="비밀번호를 입력하세요" style="width: 100%;"/>
			<br>
			<br>

			<input type="submit" id="login" value="로그인"/>
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