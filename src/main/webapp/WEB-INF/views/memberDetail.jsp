<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/chattingList.css" type="text/css">
<!-- bootstrap 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
a, a:link, a:visited, a:active, a:hover {
	text-decoration: none;
	color: var(--black);
}


/* 본인 페이지 것으로 변경하기  */
.btn_gnb .bi-chat-dots-fill, .btn_gnb.chatting{
    color: var(--white);
    background-color: var(--green);
}


/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb:hover .bi-house-door-fill,
/* .btn_gnb:hover .bi-chat-dots-fill, */
.btn_gnb:hover .bi-gear-fill,
.btn_gnb:hover .bi-people-fill,
.btn_gnb:hover .bi-person-circle,
.btn_gnb:hover .bi-list-ul {
    background-color: var(--light);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb.home:hover,
.btn_gnb.match:hover,
/* .btn_gnb.chatting:hover, */
.btn_gnb.board:hover,
.btn_gnb.myPage:hover,
.btn_gnb.admin:hover{
	background-color: var(--light);
}

table,th,td{
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
<div id="wrap">
	<div class="banner">
		<div class="header">
			<h1 class="logo">
				<a href="./"><img src="/photo/logo.png" class="logo_matchDog"/></a>
			</h1>
			<div class="gnb">
				<a href="./alarmList.go" class="alarm"><span class="bi bi-bell-fill"></span></a>
				<a href="./logout.do"><span class="logout">로그아웃</span></a>
			</div>
		</div>
	</div>
	<div class="mainContainer">
		<div class="side">
			<div class="menu">
				<a href="./dashBoard.go" class="btn_gnb home">
					<span class="bi bi-house-door-fill"></span>
					<span>관리자 페이지</span>
				</a>
		        <a href="./dashBoard.go" class="btn_gnb match">
		        	<span class="bi bi-list-ul"></span>
					<span>DASH BOARD</span>
		        </a>
		        <a href="./memberList.go" class="btn_gnb chatting">
		        	<span class="bi bi-chat-dots-fill"></span>
					<span>회원관리</span>
		        </a>
		        <a href="./authList.do" class="btn_gnb chatting">
	                <span class="bi bi-chat-dots-fill"></span>
	                <span>권한관리</span>
               </a>
		        <a href="./compList.go" class="btn_gnb board">
		        	<span class="bi bi-people-fill"></span>
					<span>신고관리</span>
		        </a>
		        <a href="./home.go" class="btn_gnb myPage">
		        	<span class="bi bi-person-circle"></span>
					<span>서비스페이지</span>
		        </a>
			</div>
		</div>
		<div class="content">
			<form action="memberDetail" method="get">
			<input type="hidden" name="member_idx" value="${dto.member_idx}"/>
			<h3>회원상세보기</h3><hr/>
			<table>
				<tr>
					<th>회원번호</th>
					<td>${dto.member_idx}</td>
					<th>아이디</th>
					<td>${dto.member_id}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${dto.member_name}</td>
					<th>닉네임</th>
					<td>${dto.member_nickName}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${dto.member_email}</td>
					<th>전화번호</th>
					<td>${dto.member_phone}</td>
				</tr>
				<tr>
					<th>지번주소</th>
					<td>${dto.member_parcelAddr}</td>
					<th>도로명주소</th>
					<td>${dto.member_roadAddr}</td>
				</tr>
				<tr>
					<th>동주소</th>
					<td>${dto.member_dongAddr}</td>
					<th>생년월일</th>
					<td>${dto.member_birth}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${dto.member_gender}</td>
					<th>가입일</th>
					<td>${dto.member_regDate}</td>
				</tr>
				<tr>
					<th>구독여부</th>
					<td>${dto.member_subs}</td>
					<th>구독연장여부</th>
					<td>${dto.member_renew}</td>
				</tr>
				<tr>
					<th>구독시작일자</th>
					<td>${dto.subsHistory_start}</td>
					<th>구독만료일자</th>
					<td>${dto.subsHistory_exp}</td>
				</tr>
				<tr>
					<th>구독등급</th>
					<td>${dto.subsType_code}</td>
					<th>탈퇴여부</th>
					<td>${dto.member_quit}</td>
				</tr>
				<tr>
					<th>제재여부</th>
					<td>${dto.member_loginLock}</td>
					<th>권한수정</th>
					<td>
						<select id="subsType_code" name="subsType_code">
							<option value="1">일반회원</option>
							<option value="2">플러스</option>
							<option value="3">프리미엄</option>
							<option value="4">관리자</option>
						</select>
					</td>
				</tr>	
				<tr>
					<th colspan="4">
						<input type="button" onclick="location.href='./memberList.go'" value="회원목록으로"/>
						<input type="button" onclick="location.href='./subsHistory.do?member_idx=${dto.member_idx}'" value="구독이력보기"/>
						<input type="button" onclick="location.href='./updateForm?member_idx=${dto.member_idx}'" value="제재이력보기"/>
						<input type="button" name="memberAuthMod" value="저장하기"/>
					</th>	
				</tr>
			</table>			
			</form>
		</div>
	</div>	
</div>
</body>
<script>
$('input[name="memberAuthMod"]').on('click', function(){
	if(confirm("수정하시겠습니까?")==true){
		updateAuthLevel();
		alert('수정되었습니다.');
	}else{
		return;
	}	
});

function updateAuthLevel(subsType_code) {
	var subsType_code = $('#subsType_code').val();
    var member_idx = "${dto.member_idx}"
    
    $.ajax({
        type: "get",
        url: "memberAuthMod",
        data: {
            subsType_code: subsType_code,
            member_idx: member_idx
        },
        success: function(data) {
            location.href = './memberDetail?member_idx=${dto.member_idx}';
        },
        error: function() {
            alert("권한 레벨 업데이트에 실패했습니다.");
        }
    });
}

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

</script>
</html>