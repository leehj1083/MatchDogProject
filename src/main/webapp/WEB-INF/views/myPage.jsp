<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
 <style>
/* 모달 스타일 */
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 1;
}

.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ccc;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}


.QuitModal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 1;
}

.QuitModal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ccc;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}


</style>
</head>
<body>
탈퇴여부 : ${myPage.member_quit}
	<c:if test="${myPage.member_quit != 'Y'}">
	<h3>${myPage.member_name} 님의 마이페이지</h3>
	<a href="logout">로그아웃</a>
	<br></br>
	<a href="myPageList.do">회원정보</a>
	<br></br>
	<a href="myProfileList.do">프로필</a>
	<br></br>
	<input type="button" onclick="location.href='./myPageMod.go'" value="수정하기"/>
	<br></br>

${myPage.member_idx}
	 	<table>	
 		<tr>
 			<th>이름</th>
 			<td>${myPage.member_name}</td>
 		</tr>
 		<tr>
 			<th>아이디</th>
 			<td>${myPage.member_id}</td>
 		</tr>
 		<tr>
 			<th>닉네임</th>
 			<td>${myPage.member_nickName}</td>
 		</tr>
 		<tr>
 			<th>성별</th>
 			<td>${myPage.member_gender}</td>
 		</tr>
 		<tr>
 			<th>비밀번호</th>
 			<td>${myPage.member_pw}</td>
 		</tr>
 		<tr>
 			<th>이메일</th>
 			<td>${myPage.member_email}</td>
 		</tr>
 		<tr>
 			<th>전화번호</th>
 			<td>${myPage.member_phone}</td>
 		</tr>
 		<tr>
 			<th>주소(도로명)</th>
 			<td>${myPage.member_roadAddr}</td>
 		</tr>
 		<tr>
 			<th>주소(지번)</th>
 			<td>${myPage.member_parcelAddr}</td>
 		</tr>
 		<tr>
 			<th>상세주소</th>
 			<td>${myPage.member_detailAddr}</td>
 		</tr>
 		</table>	
 	<br></br>
 	<br></br>
	<table>
 		<tr>
 			<th>구독</th>
 			<td>${myPage.subsType}</td>
 			
 			<c:if test="${myPage.subsType == 'standard'}">
 				<td><button id="openSubsModal">업그레이드</button></td>
<!--  				<input type="button" id="openSubsModal" onclick="location.href='./subs.go'" value="업그레이드"/> -->

			</c:if>
			<c:if test="${myPage.subsType == 'plus'}">
<!--  				<td><input type="button" onclick="location.href='./subs.go'" value="업그레이드"/></td> -->
				<td><button id="openSubsModal">업그레이드</button></td>
 				<td><input type="button" onclick="location.href='./myPageMod.go'" value="구독취소"/></td>
				<!-- <td colspan="1">업그레이드</td> -->
			</c:if>
			<c:if test="${myPage.subsType == 'premium'}">
 				<td><input type="button" onclick="location.href='./myPageMod.go'" value="구독취소"/></td>
				<!-- <td colspan="1">업그레이드</td> -->
			</c:if>
			<c:if test="${myPage.subsType == 'admin'}">
 				<td><button>관리자입니다</button></td>
				<!-- <td colspan="1">업그레이드</td> -->
			</c:if>
 		</tr>
 		
<!-- <button id="openSubsModal">모달 열기</button> -->
	<!-- 모달 창 -->
	<div id="subsModal" class="modal">
		<div class="modal-content">
			<span id="closeSubsModal" style="float: right; cursor: pointer;">&times;</span>
			<div id="subSmodalContent"></div>
		</div>
	</div>
 		
	</table>
	
	<br></br>
	<button id="openQuitModal" >회원 탈퇴</button>
	
	<div id="memberQuitDoModal" class="QuitModal" >
		<div class="QuitModal-content" >
			<h2>정말 탈퇴하시겠습니까?<br/>모든 정보가 삭제됩니다.</h2>
        <button id="QuitConfirmYes" data-member_idx="${myPage.member_idx}">예</button>
        <button id="QuitConfirmNo">아니오</button>
		</div>
	</div>
</c:if>
</body>
<script>
var openQuitModal = $("#openQuitModal");
var memberQuitDoModal = $("#memberQuitDoModal");
var QuitConfirmYes = $("#QuitConfirmYes");
var QuitConfirmNo = $("#QuitConfirmNo");

//탈퇴버튼 눌렀을 때
openQuitModal.click(function() {
	console.log("탈퇴");
	memberQuitDoModal.css("display", "block");
});

// 탈퇴 네 버튼 값 전송 후 모달 닫기
QuitConfirmYes.click(function(e){
	var member_idx = $(this).data("member_idx");
	console.log(member_idx);
	
 	$.ajax({
		type : 'get',
		url : 'memberQuit.do', // 서버로 요청을 보낼 엔드포인트를 지정
		data : {
			"member_idx" : member_idx
		},
		success : function(data) {
			console.log(data);
			console.log("회원 탈퇴.");
			location.href = "./";
			if (!data.login) {
				alert('로그인이 필요한 서비스입니다.');
				location.href = './';
			}
		},
		error : function(e) {
			console.log(e)
		}
	});
	
	memberQuitDoModal.css("display", "none");
});

// 탈퇴 아니오 버튼 모달 닫기
QuitConfirmNo.click(function() {
	memberQuitDoModal.css("display", "none");
});

// 구독 모달 스크립트
var subsModal = $("#subsModal");
var subSmodalContent = $("#subSmodalContent");
var openSubsModal = $("#openSubsModal");
var closeSubsModal = $("#closeSubsModal");

openSubsModal.click(function() {
    // JSP 파일을 가져와서 모달 창에 표시
    $.get("./subs.go", function(data) {
    	subSmodalContent.html(data);
        subsModal.css("display", "block");
    });
});

closeSubsModal.click(function() {
	subsModal.css("display", "none");
});




var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>