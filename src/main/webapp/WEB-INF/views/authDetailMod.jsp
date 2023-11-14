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
.gnb{
	position:relative;
	top:2px;
	left:860px;
}
.logout{
	display: inline-block;
	position: relative;
	left: 24px;
	width: 120px;
	height: 32px;
	padding: 4px 15px 0 15px;
	border: 1px solid var(--light);
	background-color: #eceff1;
	border-radius: 8px;
	font-family:Pretendard;
	font-weight: 500;
	text-align: center;
}
.mainContainer{
	display:flex;
	width:1280px;
	margin:0 110px;
}
.side{
	width: 240px;
	padding-left:14px;
}

.side .menu{
	/* position: fixed; */
	padding: 32px 20px 24px 0;
}

a, a:link, a:visited, a:active, a:hover {
	text-decoration: none;
	color: var(--black);
}


/* admin페이지 side bar 메뉴 아이콘 */
.bi-gear-fill, .bi-reception-3, .bi-people-fill, 
.bi-person-gear, .bi-person-x-fill, .bi-door-open-fill {
	position:relative;
	color: var(--black) ;
	font-size: 22px;
	margin-right:10px;
}

/* 본인 페이지 것으로 변경하기  */
.btn_gnb .bi-person-gear, .btn_gnb.auth{
    color: var(--white);
    background-color: var(--green);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb:hover .bi-gear-fill,
.btn_gnb:hover .bi-reception-3,
.btn_gnb:hover .bi-people-fill,
/* .btn_gnb:hover .bi-person-gear, */
.btn_gnb:hover .bi-person-x-fill,
.btn_gnb:hover .bi-door-open-fill {
    background-color: var(--light);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb.home:hover,
.btn_gnb.dash:hover,
.btn_gnb.user:hover,
/* .btn_gnb.auth:hover, */
.btn_gnb.comp:hover,
.btn_gnb.service:hover{
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
        font-size: 13px;
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
        font-size: 13px;
        text-align: center;
        text-decoration: none;
        background-color: #1abc9c;
        color: #ffffff;
        border-radius: 5px;
        border: 1px solid #1abc9c;
        cursor: pointer;
    }
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

</style>
</head>
<body>	

	<div class="banner">
		<div class="header">
			<h1 class="logo">
				<a href="./"><img src="./resources/img/logo.png" class="logo_matchDog"/></a>
			</h1>
			<div class="gnb">
				<a id="openAlarm" class="alarm"><span class="bi bi-bell-fill"></span></a>
				<a href="./logout.do"><span class="logout">로그아웃</span></a>
			</div>
		</div>
	</div>
	<div class="mainContainer">
		<div class="side">
			<div class="menu">
				<span class="btn_gnb home">
					<span class="bi bi-gear-fill"></span>
					<span>관리자 페이지</span>
				</span>
		        <a href="./adminList.go" class="btn_gnb dash">
		        	<span class="bi bi-reception-3"></span>
					<span>DASH BOARD</span>
		        </a>
		        <a href="./memberList.go" class="btn_gnb user">
		        	<span class="bi bi-people-fill"></span>
					<span>회원관리</span>
		        </a>
		        <a href="./authList.do" class="btn_gnb auth">
	                <span class="bi bi-person-gear"></span>
	                <span>권한관리</span>
               </a>
		        <a href="./compList.go" class="btn_gnb comp">
		        	<span class="bi bi-person-x-fill"></span>
					<span>신고관리</span>
		        </a>
		        <a href="./HomeMatchingList.do" class="btn_gnb service">
		        	<span class="bi bi-door-open-fill"></span>
					<span>서비스페이지</span>
		        </a>
			</div>
		</div>
		<div class="content">
		<div id="alarmContent"></div>
		<h2 style="font-family:pretendard">권한 수정</h2><hr/>
		<form action="./authDetailModUpdate.do" method="post">
		<input type="hidden" name="subsType_code" value="${authDetail.subsType_code}">
		
			<table>
					<tr>
						<th>권한명</th>
						<td colspan=2>${authDetail.subsType}</td>
					</tr>
					<tr>		
						<th>설명</th>
						<td colspan=2><input type="text" name="subs_desc" value="${authDetail.subs_desc}" style="width: 90%;"/></td>
					</tr>
					<tr>
						<th>권한코드</th>
<td id = "selectedCodes" style="position: relative;">
    <c:forEach items="${authCodes}" var="authCodes" varStatus="loop">
        ${authCodes}${not loop.last ? ',' : ''}
        <input type="hidden" name="authCodes" value="${authCodes}" />
    </c:forEach>
 </td>

<td style="width: 50px;">
<button type="button" id="openCodeModal" class="sButton" style="position: relative; right: -10;">코드검색
</button>
</td>
					</tr>
					
			</table>
			
							<!-- 모달 내용을 표시할 영역 -->
<div id="codeModal" class="modal">
    <div class="modal-content">
        <span id="closeCodeModal" style="float: right; cursor: pointer;">&times;</span>
        <div class="codeModalContent">
        <table style="text-align: center;">
		<tr>
			<th>${subsType.subsType_code}</th>
			<th>권한 코드</th>
			<th>권한 내용</th>
		</tr>
		<c:forEach items="${authCodeList}" var="authCode">
			<tr>
				<td><input type="checkbox" name="newAuthCodes" class="authCheckbox"
					value="${authCode.authType_code}"></td>
				<td>${authCode.authType_code}</td>
				<td>${authCode.authType}</td>
			</tr>
		</c:forEach>
	</table>
	<br></br>
            <div style="text-align: center;">
                <button id="regButton" type="button" >선택 완료</button>
            </div>
        </div>
    </div>
</div>
			
			
			
			<div class="button-container">
				<a href="javascript:history.back()" class="button-gray">뒤로가기</a>
				<input type="submit" class="button-green" value="수정 완료"/>
			</div>
	
			
			</form>
		</div>
		</div>


</body>
<script>


// 모달 열기
$('#openCodeModal').on('click', function(){
    var codeModalContent = $('.codeModalContent');
    console.log('오픈코드');
    $('#codeModal').css("display", "block");
}); 

// 모달 닫기
$('#closeCodeModal').on('click', function(){
	console.log('모달 닫음');
	$('#codeModal').css("display", "none");
});



//선택 완료 버튼 클릭 시 필요한 작업 후 모달 창 닫기
$("#regButton").on('click', function () {
	
	var selectedAuthCode = $(".authCheckbox:checked");
	var selectedAuthCods = [];
	console.log(selectedAuthCods);
	selectedAuthCode.each(function (e) {
		selectedAuthCods.push($(this).val());
   });
  
	var selectedCodes = $("#selectedCodes");
	selectedCodes.html(selectedAuthCods.join(", "));
   $('#codeModal').css("display", "none");
});

$('#openAlarm').click(function (e) {
	   // JSP 파일을 가져와서 모달 창에 표시
	   $.get("./alarmList.go", function(data) {
	   	console.log(data);
	   	console.log("#alarmContent");
	       $("#alarmContent").html(data);
	   });
	});




</script>
</html>