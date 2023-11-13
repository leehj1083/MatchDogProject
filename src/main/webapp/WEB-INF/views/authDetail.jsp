<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/chattingList.css" type="text/css">
<!-- bootstrap 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<!-- bootstrap : 디자인을 위한 프레임워크 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 처리를 위한 라이브러리 -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
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
table {
        width: 700px; /* 테이블 전체 너비 설정 */
        margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
        /* 다른 스타일링 속성들 추가 가능 */
    }
table,th,td{
	border: 1px solid #aaa;
	border-collapse: collapse;
	padding: 0.6rem;
	margin :6rem;
	font-family:pretendard;
}
td, th {
  padding: 0.6rem;
  min-width: 10rem;
  text-align: left;
  margin: 0
}
th:first-child, td:first-child {
        width: 20%; /* 첫 번째 열 너비 설정 */
    }

.button-container {
        display: flex;
        justify-content: space-between;
    }

    .button-gray {
        padding: 10px 20px;
        font-size: 16px;
        text-align: center;
        text-decoration: none;
        background-color: #808080;
        color: #ffffff;
        border-radius: 5px;
        border: 1px solid #808080;
        cursor: pointer;
    }
    .button-green {
        padding: 10px 20px;
        font-size: 16px;
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
		        <a href="./memberList.go" class="btn_gnb match">
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
		<h2>권한 상세</h2><hr/>
			<table>
					<tr>
						<th>권한명</th>
						<td>${authDetail.subsType}</td>
					</tr>
					<tr>		
						<th>설명</th>
						<td>${authDetail.subs_desc}</td>
					</tr>
					<tr>
						<th>권한코드</th>
						<td><c:forEach items="${authCodes}" var="authCodes" varStatus="loop">
						${authCodes}${not loop.last ? ',' : ''}</c:forEach></td>
					</tr>
					
			</table>
			<input type="hidden" value="${authDetail.subsType_code}"/>
			<div class="button-container">
    <a href="./authList.do" class="button-gray">뒤로가기</a>
    <a href="./authDetailMod.go?subsType_Code=${authDetail.subsType_code}" class="button-green">수정하기</a>
</div>
		</div>
	</div>
</div>
</body>
<script>
</script>
</html>