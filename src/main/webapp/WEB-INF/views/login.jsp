<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	.loginForm{
		width:400px;
		height:600px;
		margin: 0 auto;
	}
	#login{
		background-color : aqua;
		height : 30px;
		width : 100px;
	}
</style>
</head>
<body>
	<div class="container">
		<a href="./home.go"><img src="./resources/img/maticon.PNG" src="매칭해주개메인" /></a>
	</div>
	<form action="login.do" method="post">
		<div class="loginForm">
			<h2>로그인</h2>
			<p/><h3>아이디</h3>
			<p/><input type="text" name="id" placeholder="아이디를 입력 하세요" />
			<h3>비밀번호</h3>
			<p/><input type="password" name="pw" placeholder="비밀번호를 입력 하세요" /><hr/>
					
			<input type="submit" id="login" value="로그인"/>
			<hr/>
			<a href="./idFind.go">아이디 찾기</a> / <a href="./pwFind.go">비밀번호 찾기</a> / <a href="./joinAgree.go">회원가입</a>
		</div>
	</form>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

/* ${'#login'}.on('click',function(){
	var id = $('input[name="id"]').val();
	var pw = $('input[name="pw"]').val();
	console.log(id+"/"+pw);
	
	$.ajax({
		type:'post',
		url:'login',
		data:{'id':id, 'pw':pw},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			alert(data.msg);
			if(data.loginLock==true){
				alert('로그인이 제한되었습니다.');
			}
			if(data.id!= null){
				if(data.subsType=='admin'){
					location.href='./dashBoard.go';
				}else{
					location.href='./home.go';
				}
			}
		},
		error:function(e){
			console.log(e);
		}		
	});	
}) */
</script>
</html>