<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
.banner {
	width: 1500px;
	display: inline-block;
	border-bottom: 1px solid var(- -light);
}

.header {
	display: flex;
	width: 1280px;
	height: 72px;
	margin: 0 110px;
	align-items: center;
}

.logo {
	position: relative;
	width: 241px;
	height: 70px;
}

.logo_matchDog {
	position: absolute;
	top: 8px;
	left: 20px;
	display: block;
	width: auto;
	height: 44px;
}

.content {
	width: 400px;
	height: 550px;
	margin: 0 auto;
	/* 		border: 1px solid black; */
	padding: 30px;
	font-family: pretendard;
}

.terms_box {
	width: 350px;
	height: 150px;
	margin: 5px;
	background-color: #DDE0DD;
}

#next {
	display: block;
	width: 250px;
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
	font-family: pretendard;
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
	<h3>회원가입 이용약관</h3>
		<div class="form_section">
			<div class="check_terms">
				<input type="checkbox" id="chk_all">
				<label for="chk_all">
					<span style="font-weight: bold;">전체 동의하기</span><p/>
				</label>
			</div>
			
			<div class="terms_desc">가입시 본인명의의 이메일을 인증하며, 생년월일, 주소제공 등 개인정보 제공 동의를 포함합니다.</div>
		</div><p/>
		<ul class="terms_list">
			<li class="terms_item">
				<div class="check_terms">
					<input type="checkbox" name="chk">
					<label for="chk">
					<span>[필수] 서비스 이용 약관 동의하기</span>
				</label>
				</div>
				<div class="terms_box" style="overflow: scroll">
					<p class="terms_text">여러분을 환영합니다. 매칭해주개 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 
						매칭해주개 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 됩니다.</p>
				</div>
			</li>
			<br><p/>
			<li class="terms_item">
				<div class="check_terms">
					<input type="checkbox" name="chk">
					<label for="chk">
					<span>[필수] 개인정보 수집 및 이용 동의하기</span>
				</label>
				</div>
				<div class="terms_box" style="overflow: scroll">
					<p class="terms_text">개인정보보호법에 따라 매칭해주개에 회원가입 신청하시는 분께 수집하는 개인정보의 항목을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
						<br></br>1. 수집하는 개인정보
						
						회원가입 시점에 이용자로부터 수집하는 개인정보는 아래와 같습니다.
						- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호, 본인확인 이메일주소를 수집합니다. 가입 시, 중복가입 확인정보(DI)를 함께 수집합니다. 
						- 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.</p>
				</div>
			</li>	
		</ul>
		<br>
		<div style="display: block; margin: auto; text-align: center;">
			<input type="button" id="next" value="다음으로"/>
		</div>
	</div>
</div>	
</body>
<script>

$('#chk_all').on('click',function(){
	var $chk = $('input[type="checkbox"]');
	if($(this).is(":checked")){
		$chk.prop("checked", true);
	}else{
		$chk.prop("checked", false);
	}
});

$("input[name='chk']").on('click',function(){
	var total = $("input[name='chk']").length;
	var checked = $("input[name='chk']:checked").length;
	
	if(total != checked){
		$('#chk_all').prop("checked", false);
	}else{
		$('#chk_all').prop("checked", true);
	}
});


$('#next').on('click',function(){
	if($('#chk_all').is(":checked")){
		/* 각 chk가 체크되면 chk_all이 체크되도록 해야 함 */
	location.href='./joinForm.go';
	}else{
		alert("필수항목에 모두 동의하셔야 합니다.");
	}
});


</script>
</html>