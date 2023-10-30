<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	.content{
		width: 500px;
		height:500px;
		margin: 0 auto;
	}
	.terms_box{
		width: 400px;
		height:100px;
	}
	
</style>
</head>
<body>	
	<div class="container">
		<a href="/home.go"><img src="./resources/img/maticon.PNG" src="매칭해주개메인" /></a>
	</div>
	<div class="content">
		<div class="form_section">
			<div class="check_terms">
				<input type="checkbox" id="chk_all">
				<label for="chk_all">
					<span>전체 동의하기</span>
				</label>
			</div>
			<div class="terms_desc">가입시 본인명의의 이메일을 인증하며, 생년월일, 주소제공 등 개인정보 제공 동의를 포함합니다.</div>
		</div>
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
			<li class="terms_item">
				<div class="check_terms">
					<input type="checkbox" name="chk">
					<label for="chk">
					<span>[필수] 개인정보 수집 및 이용 동의하기</span>
				</label>
				</div>
				<div class="terms_box" style="overflow: scroll">
					<p class="terms_text">개인정보보호법에 따라 매칭해주개에 회원가입 신청하시는 분께 수집하는 개인정보의 항목을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
						1. 수집하는 개인정보
						
						회원가입 시점에 이용자로부터 수집하는 개인정보는 아래와 같습니다.
						- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호, 본인확인 이메일주소를 수집합니다. 가입 시, 중복가입 확인정보(DI)를 함께 수집합니다. 
						- 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.</p>
				</div>
			</li>	
		</ul>
		<input type="button" id="next" value="다음으로"/>
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