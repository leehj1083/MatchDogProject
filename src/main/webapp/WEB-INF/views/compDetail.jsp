
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="resources/css/home.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 처리를 위한 라이브러리 -->
<style>



a, a:link, a:visited, a:active, a:hover {
		text-decoration: none;
		color: var(--black);
	}
	
	
/* admin페이지 side bar 메뉴 아이콘 */
.bi-gear-fill, .bi-reception-3,  .bi-people-fill, 
.bi-person-gear, .bi-person-x-fill, .bi-door-open-fill {
	position:relative;
	color: var(--black) ;
	font-size: 22px;
	margin-right:10px;
}

/* 본인 페이지 것으로 변경하기  */
.btn_gnb .bi-person-x-fill, .btn_gnb.comp{
    color: var(--white);
    background-color: var(--green);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb:hover .bi-gear-fill,
.btn_gnb:hover .bi-reception-3,
.btn_gnb:hover .bi-people-fill,
.btn_gnb:hover .bi-person-gear,
/* .btn_gnb:hover .bi-person-x-fill, */
.btn_gnb:hover .bi-door-open-fill {
    background-color: var(--light);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb.home:hover,
.btn_gnb.dash:hover,
.btn_gnb.user:hover, 
.btn_gnb.auth:hover,
/* .btn_gnb.comp:hover, */
.btn_gnb.service:hover{
	background-color: var(--light);
}
	    #modalContent{
	    	width: 500px;
	    	height: 500px;
	    	text-align: left; 
	}

    .content {
        padding: 20px;
        text-align: center; /* "우리 동네 리스트"를 가운데 정렬 */
    }
    #modalContent{
    	width: 500px;
    	height: 500px;
    	text-align: left; 
    }



.card {
  width: 100%;
  display: grid;
}

.row1,.row2,.row3,.row4,.row5 {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  border: 1px solid black;
}

.row6 {
   display: grid;
  grid-template-columns: repeat(6, 1fr);
border: 1px solid black;
}
.row7 {
   display: grid;
  grid-template-columns: repeat(2, 1fr);
border: 1px solid black;
}
.row8 {
   display: grid;
  grid-template-columns: repeat(2, 1fr);
border: 1px solid black;
}
.row9 {
   display: grid;
  grid-template-columns: repeat(2, 1fr);
 border: 1px solid black;
}
.row10 {
   display: grid;
  grid-template-columns: repeat(1, 1fr);
border: 1px solid black;
}
 input[name="comp_handleContent"]{
 height: 200px;
}

p{
border-right: 1px solid black;
}
#reportButton {
       margin-right: 10px;
    background-color: rgb(26, 188, 156);
    color: white;
    border: none;
    padding: 9px 10px;
    text-align: center;
    margin-top: -46px;
    margin-bottom: 16px;
}
.w-btn {
	position: relative;
	border: none;
	display: inline-block;
	padding: 15px 30px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
}

.w-btn-outline {
	position: relative;
	padding: 15px 30px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
}

.w-btn-indigo {
	background-color: aliceblue;
	color: #1e6b7b;
}

.w-btn-indigo-outline {
	border: 3px solid aliceblue;
	color: #1e6b7b;
}

.w-btn-indigo-outline:hover {
	color: #1e6b7b;
	background: aliceblue;
}

.w-btn-green {
	background-color: #77af9c;
	color: #d7fff1;
}

.w-btn-green2 {
	background-color: #519d9e;
	color: #9dc8c8;
}

.w-btn-green-outline {
	border: 3px solid #77af9c;
	color: darkgray;
}

.w-btn-green2-outline {
	border: 3px solid #519d9e;
	color: darkgray;
}

.w-btn-green-outline:hover {
	background-color: #77af9c;
	color: #d7fff1;
}

.w-btn-green2-outline:hover {
	background-color: #519d9e;
	color: #9dc8c8;
}

.w-btn-brown {
	background-color: #ce6d39;
	color: #ffeee4;
}

.w-btn-brown-outline {
	border: 3px solid #ce6d39;
	color: #b8b8b8;
}

.w-btn-brown-outline:hover {
	background-color: #ce6d39;
	color: #ffeee4;
}

.w-btn-blue {
	background-color: #6aafe6;
	color: #d4dfe6;
}

.w-btn-pink {
	background-color: #f199bc;
	color: #d4dfe6;
}

.w-btn-gray {
	background-color: #a3a1a1;
	color: #e3dede;
}

.w-btn-red {
	background-color: #ff5f2e;
	color: #e1eef6;
}

.w-btn-skin {
	background-color: #f8e6e0;
	color: #6e6e6e;
}

.w-btn-yellow {
	background-color: #fce205;
	color: #6e6e6e;
}

.w-btn-blue-outline {
	border: 3px solid #6aafe6;
	color: #6e6e6e;
}

.w-btn-pink-outline {
	border: 3px solid #f199bc;
	color: #6e6e6e;
}

.w-btn-gray-outline {
	border: 3px solid #a3a1a1;
	color: #6e6e6e;
}

.w-btn-red-outline {
	border: 3px solid #ff5f2e;
	color: #6e6e6e;
}

.w-btn-skin-outline {
	border: 3px solid #f8e6e0;
	color: #6e6e6e;
}

.w-btn-yellow-outline {
	border: 3px solid #fce205;
	color: #6e6e6e;
}

.w-btn-blue-outline:hover {
	background-color: #6aafe6;
	color: #d4dfe6;
}

.w-btn-pink-outline:hover {
	background-color: #f199bc;
	color: #d4dfe6;
}

.w-btn-gray-outline:hover {
	background-color: #a3a1a1;
	color: #e3dede;
}

.w-btn-red-outline:hover {
	background-color: #ff5f2e;
	color: #e1eef6;
}

.w-btn-skin-outline:hover {
	background-color: #f8e6e0;
	color: #6e6e6e;
}

.w-btn-yellow-outline:hover {
	background-color: #fce205;
	color: #6e6e6e;
}

.w-btn:hover {
	letter-spacing: 2px;
	transform: scale(1.2);
	cursor: pointer;
}

.w-btn-outline:hover {
	letter-spacing: 2px;
	transform: scale(1.2);
	cursor: pointer;
}

.w-btn:active {
	transform: scale(1.5);
}

.w-btn-outline:active {
	transform: scale(1.5);
}

.w-btn-gra1 {
	background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
	color: white;
}

.w-btn-gra2 {
	background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
	color: white;
}

.w-btn-gra3 {
	background: linear-gradient(45deg, #ff0000, #ff7300, #fffb00, #48ff00, #00ffd5,
		#002bff, #7a00ff, #ff00c8, #ff0000);
	color: white;
}

.w-btn-gra-anim {
	background-size: 400% 400%;
	animation: gradient1 5s ease infinite;
}

@
keyframes gradient1 { 0% {
	background-position: 0% 50%;
}

50


%
{
background-position


:


100
%


50
%;


}
100


%
{
background-position


:


0
%


50
%;


}
}
@
keyframes gradient2 { 0% {
	background-position: 100% 50%;
}

50


%
{
background-position


:


0
%


50
%;


}
100


%
{
background-position


:


100
%


50
%;


}
}
@
keyframes ring { 0% {
	width: 30px;
	height: 30px;
	opacity: 1;
}

100


%
{
width


:


300px
;


height


:


300px
;


opacity


:


0
;


}
}
.w-btn-neon2 {
	position: relative;
	border: none;
	min-width: 200px;
	min-height: 50px;
	background: linear-gradient(90deg, rgba(129, 230, 217, 1) 0%,
		rgba(79, 209, 197, 1) 100%);
	border-radius: 1000px;
	color: darkslategray;
	cursor: pointer;
	box-shadow: 12px 12px 24px rgba(79, 209, 197, 0.64);
	font-weight: 700;
	transition: 0.3s;
}

.w-btn-neon2:hover {
	transform: scale(1.2);
}

.w-btn-neon2:hover::after {
	content: "";
	width: 30px;
	height: 30px;
	border-radius: 100%;
	border: 6px solid #00ffcb;
	position: absolute;
	z-index: -1;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	animation: ring 1.5s infinite;
}

#backButton {
    background: url('./resources/img/backBtn.png') no-repeat;
    width: 42px; /* 이미지의 가로 크기에 맞게 조절 */
    height: 36px; /* 이미지의 세로 크기에 맞게 조절 */
    border: none; /* 버튼 스타일 초기화 */
    cursor: pointer; /* 마우스를 올렸을 때 포인터로 변경 */
    margin-right: 691px;
    margin-top : 10px;
    margin-bottom: 10px;
}

</style>


</head>
<body>
<div id="wrap">
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
				<span class="btn_gnb admin">
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
			
			
	     	 <form action="backCompList">
				<div class = backbutton>
					<button id="backButton"></button>
					<p id="reportButton">신고 상세보기</p>
				</div>
			</form>
			<form class="card" action="proRegist.do" method="post" id="compForm">
				<input type="hidden" name="comp_idx" value="${cpd.comp_idx}">
				<div class="row1">
					<p>신고번호</p>
					<p>${cpd.comp_idx}</p>
					<p>신고코드</p>
					<p id="compTypeValue">${cpd.compType_code}</p>
				</div>
				<div class="row2">
					<p>신고분류</p>
					<p id ="compLocValue">${cpd.comp_loc}</p>
					<p>게시물번호</p>
					<p>${cpd.comp_idfNum}</p>
				</div>
				<div class="row3">
					<p>신고자ID</p>
					<p>${mem}</p>
					<p>피신고자ID</p>
					<p>${pem}</p>
				</div>
				<div class="row4">
					<p>신고처리상태</p>
					<p><select name="comp_handleState">
						<option value="미처리">미처리</option>
						<option value="처리중">처리중</option>
						<option value="처리완료">처리완료</option>
					</select></p>
					<p>블라인드여부</p>
					<p>
						<select name="comp_blindStete">
							<option value="N">N</option>
							<option value="Y">Y</option>
						</select>
					</p>
				</div>
				<div class="row5">
					<p>신고일자</p>
					<p>${cpd.comp_receiveDate}</p>
					<p>처리일자</p>
					<p>${cpd.comp_handleDate}</p>
				</div>
				<div class="row6">
					<p>로그인 제한 여부</p>
					<p><select name="member_loginLock">
						<option value="N">N</option>
						<option value="Y">Y</option>
					</select></p>
					<p>로그인 제한 시작일</p>
					<p>
						<input type="date" id="loginLock_sDate" name="loginLock_sDate">
					</p>
					<p>로그인 제한 종료일</p>
					<p>
						<input type="date" id="loginLock_eDate" name="loginLock_eDate">
					</p>
				</div>
				<div class="row7">
					<p>신고사유</p>
					<p>신고사진</p>
				</div>
				<div class="row8">
					<p>${cpd.comp_content}</p>
					<p>${cpd.photo_fileName}</p>
				</div>
				<div class="row9">
					<p>관리자</p>
					<p>${cpd.member_id}</p>
				</div>
				<div class="row10">
				<input name="comp_handleContent" type="text" placeholder="관리자 코맨트"/>
				</div>
				<div class="buttons">
					<button class="w-btn w-btn-green">처리 등록하기</button>
					
				</div>
			</form>
			<div class="row11">
			<p>신고 처리 히스토리</p>
			</div>
		<c:if test="${not empty cpd.comp_handleDate}">
    	<div class="row12" style="overflow:scroll; width:100%; height:150px;">
		        (가장최근에 처리한 히스토리 내용입니다.)<br>
		        신고번호:${cpd.comp_idx}/신고코드:${cpd.compType_code}/신고분류:
		        ${cpd.comp_loc}/게시물번호:${cpd.comp_idfNum}/신고자 ID:${mem}/
		        피신고자 ID:${pem}/로그인 제제여부:${his.member_loginLock}/로그인 제한 시작일:${his.loginLock_sDate}/
		        로그인 제한 종료일:${his.loginLock_eDate},관리자코멘트:${his.comp_handleContent}
    	</div>
		</c:if>
	</div>
	</div>
	</div>
</body>
<script>

function getCompType(compType_code) {
    if (compType_code === "1") {
        return "1(불법)";
    } else if (compType_code === "2") {
        return "2(음란물)";
    } else if (compType_code === "3") {
        return "3(불법정보)";
    } else if (compType_code === "4") {
        return "4(청소년 유해)";
    } else if (compType_code === "5") {
        return "5(욕설/혐오)";
    } else if (compType_code === "6") {
        return "6(정보/노출)";
    } else if (compType_code === "7") {
        return "7(불쾌한 표현)";
    } else {
        return "알 수 없음";
    }
}

function getCompLoc(comp_loc) {
    if (comp_loc === "1") {
        return "게시글";
    } else if (comp_loc === "2") {
        return "댓글";
    } else if (comp_loc === "3") {
        return "채팅방";
    } else {
        return "알 수 없음";
    }
}

document.addEventListener("DOMContentLoaded", function() {
    // DOM이 완전히 로드된 후 실행되도록 변경

    // JavaScript에서 JSP 변수를 사용
    var compTypeCode = "${cpd.compType_code}";
    var compLoc = "${cpd.comp_loc}";

    // compTypeCode 값을 getCompType 함수로 변환
    var compTypeValue = getCompType(compTypeCode);
    var compLocValue = getCompLoc(compLoc);

    // 변환된 값을 HTML 엘리먼트에 적용
    document.getElementById("compTypeValue").textContent = compTypeValue;
    document.getElementById("compLocValue").textContent = compLocValue;

    // 처리 등록하기 버튼 클릭 시 이벤트 핸들러
    document.querySelector('.buttons button').addEventListener('click', function(event) {
        // 관리자 코멘트 값 가져오기
        var compHandleContent = document.querySelector('input[name="comp_handleContent"]').value.trim();

        // 값이 비어있을 경우 alert 띄우고 이벤트 취소
        if (compHandleContent === "") {
            alert("관리자 코멘트를 입력해주세요.");
            event.preventDefault(); // 이벤트 취소
        }
    });
});

</script>

</html>