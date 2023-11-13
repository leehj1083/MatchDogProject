<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/myProfile.css" type="text/css">
<!-- bootstrap 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 처리를 위한 라이브러리 -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
 <style>
 
a, a:link, a:visited, a:active, a:hover {
	text-decoration: none;
	color: var(--black);
}

textarea{
	resize: none;
}

.input_img {
	display: none;
}


/* 본인 페이지 것으로 변경하기  */
.btn_gnb .bi-person-circle, .btn_gnb.myPage{
    color: var(--white);
    background-color: var(--green);
}

.btn_gnb.myPageInfo{
    color: var(--white);
    background-color: var(--green);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb:hover .bi-house-door-fill,
.btn_gnb:hover .bi-chat-dots-fill,
.btn_gnb:hover .bi-gear-fill,
.btn_gnb:hover .bi-people-fill,
/*.btn_gnb:hover .bi-person-circle,*/
.btn_gnb:hover .bi-list-ul {
    background-color: var(--light);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb.home:hover,
.btn_gnb.match:hover,
.btn_gnb.chatting:hover,
.btn_gnb.board:hover,
/*.btn_gnb.myPage:hover,*/
.btn_gnb.admin:hover,
/* .btn_gnb.myPageInfo:hover{
	background-color: var(--light);
} */
.btn_gnb.myProfile:hover{
	background-color: var(--light);
}


.content {
padding: 1.6rem;
margin: 1.6rem;
font-family:pretendard;
}

.close {
	position: relative;
	left: 330px;
	top: 20px;
	cursor: pointer;
	font-size: 32px;
	color:var(--grey);
}

.fileContent{
	display:inline-block;
}

.write-link.attach{
	display: inline-block;
	position:relative;
	top:100px;
	right:20px;
	cursor: pointer;
	color:var(--green);
	font-size: 33px;
}


.image-container{
	display:inline-block;
	width: 104px;
	height: 120px;
	border: 1px solid var(--light);
	border-radius: 8px;
	box-shadow: 0 0 4px 1px var(--light);
	margin-left:10px;
	margin-bottom:40px;
}


.imgtable .image-container img{
	display:inline-block;
	right:10px;
	width: 104px;
	height: 120px;
	border-radius: 8px;
    object-fit: cover;
}




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
	font-family:Pretendard;
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
	font-family:Pretendard;
}


.QuitModal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	font-family:Pretendard;
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
	font-family:Pretendard;
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ccc;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}
  .profile-info {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
  }

  .profile-info p {
    margin: 0;
  }

  .name-label {
    flex: 1; /* 이름 레이블 영역이 가능한 최대 너비를 차지하도록 설정 */
  }

  .name-value {
    flex: 2; /* 이름 값 영역이 가능한 최대 너비의 2배를 차지하도록 설정 */
    text-align: left; /* 중앙 정렬 */
  }
  
     .button-gray {
        padding: 6px 20px;
        font-size: 12px;
        text-align: center;
        text-decoration: none;
        background-color: #808080;
        color: #ffffff;
        border-radius: 5px;
        border: 1px solid #808080;
        cursor: pointer;
    }
    .button-green {
        padding: 6px 20px;
        font-size: 12px;
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
				<a href="./HomeMatchingList.do"><img src="/photo/logo.png" class="logo_matchDog"/></a>
			</h1>
			<div class="gnb">
				<a id="openAlarmModal" class="alarm"><span class="bi bi-bell-fill"></span></a>
				<a href="./logout.do"><span class="logout">로그아웃</span></a>
			</div>
		</div>
	</div>
	<div class="mainContainer">
		<div class="side">
			<div class="menu">
				<a href="./HomeMatchingList.do" class="btn_gnb home">
					<span class="bi bi-house-door-fill"></span>
					<span>홈</span>
				</a>
		        <a href="./recvMatchingList.go" class="btn_gnb match">
		        	<span class="bi bi-list-ul"></span>
					<span>매칭리스트</span>
		        </a>
		        <a href="./chattingList.go" class="btn_gnb chatting">
		        	<span class="bi bi-chat-dots-fill"></span>
					<span>채팅</span>
		        </a>
		        <a href="./boardList.go" class="btn_gnb board">
		        	<span class="bi bi-people-fill"></span>
					<span>커뮤니티</span>
		        </a>
		        <a href="./myPageList.do" class="btn_gnb myPage">
		        	<span class="bi bi-person-circle"></span>
					<span>마이페이지</span>
		        </a>
	            <a href="./dashBoard.go" class="btn_gnb admin">
	            	<span class="bi bi-gear-fill"></span>
					<span>관리자페이지</span>
	            </a>
			</div>
		</div>
		<div class="subSide">
			<div class="my_profile_h3"> ${myPage.member_name} 님의 마이페이지</div>
 			<div><img src="/photo/${photoName}" class="profilePhoto"/></div>
			<c:url value="/myPage" var="myPageUrl" />
			<div class="myPageMenu">
				<a href="./myPageList.do" class="btn_gnb myPageInfo">
					<span>회원 정보</span>
			    </a>
			    <a href="./myProfileList.do" class="btn_gnb myProfile">
					<span>프로필</span>
			    </a>
<br></br>
<br></br>
<br></br>
<br></br>
<br></br>
<br></br>

<button id="openQuitModal" >회원 탈퇴</button>
</div>
</div>
<div class="content">
<input type="hidden" name = "${myPage.member_quit}" value = "${myPage.member_quit}"/>
<c:if test="${myPage.member_quit != 'Y'}">

<br></br>
<div style="display: flex; justify-content: space-between;">
  <h3 style="color : var(--green);">기본 정보</h3>
  <span style="display: inline-block;">
    <input type="button" class="button-green" onclick="location.href='./myPageMod.go'" value="수정하기"/>
  </span>
</div>

<input type="hidden" value="${myPage.member_idx}"/>
<br></br>
<br></br>
<input type="hidden" name=member_id value="${myPage.member_id}"/>
<div class="profile-info">
  <div class="name-label">
    <strong>이름</strong>
  </div>
  <div class="name-value">
    <p>${myPage.member_name}</p>
  </div>
</div>

<div class="profile-info">
  <div class="name-label">
    <strong>아이디</strong>
  </div>
<div class="name-value">
    <p>${myPage.member_id}</p>
  </div>
</div>

<div class="profile-info">
  <div class="name-label">
    <strong>성별</strong>
  </div>
  <div class="name-value">
    <p>${myPage.member_gender}</p>
  </div>
</div>

<div class="profile-info">
  <div class="name-label">
    <strong>닉네임</strong>
  </div>
  <div class="name-value">
    <p>${myPage.member_nickName}</p>
  </div>
</div>

<div class="profile-info">
  <div class="name-label">
    <strong>이메일</strong>
  </div>
  <div class="name-value">
    <p>${myPage.member_email}</p>
  </div>
</div>

<div class="profile-info">
  <div class="name-label">
    <strong>전화번호</strong>
  </div>
  <div class="name-value">
    <p>${myPage.member_phone}</p>
  </div>
</div>

<div class="profile-info">
  <div class="name-label">
    <strong>주소(도로명)</strong>
  </div>
  <div class="name-value">
    <p>${myPage.member_roadAddr}</p>
  </div>
</div>

<div class="profile-info">
  <div class="name-label">
    <strong>주소(지번)</strong>
  </div>
  <div class="name-value">
    <p>${myPage.member_parcelAddr}</p>
  </div>
</div>

<div class="profile-info">
  <div class="name-label">
    <strong>상세주소</strong>
  </div>
  <div class="name-value">
    <p>${myPage.member_detailAddr}</p>
  </div>
</div>

 	<br></br>
 	<br></br>
<div style="display: flex; justify-content: space-between;">
  <div>
    <p>
      <strong>구독&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
      <span id="subsTypeSpan" style="display: inline-block; padding: 5px 10px; border-radius: 30px; color: #ffffff; width: 100px; text-align: center;">
  ${myPage.subsType}
</span>
      <%-- <span style="display: inline-block; padding: 5px 10px; border-radius: 30px; background-color: #CD5C5C; color: #ffffff; width: 70px; text-align: center;">
  ${myPage.subsType}
</span> --%>
    </p>
  </div>

  <div>
    <c:if test="${myPage.subsType == 'standard'}">
      <p>
        <button id="openSubsModal" class="button-green">업그레이드</button>
      </p>
    </c:if>

    <c:if test="${myPage.subsType == 'plus'}">
      <p>
        <button id="openSubsModal" class="button-green">업그레이드</button>
        <input type="button" id="subsDeleteDo" class="button-gray" value="구독취소"/>
      </p>
    </c:if>

    <c:if test="${myPage.subsType == 'premium'}">
      <p>
        <input type="button" id="subsDeleteDo" class="button-gray" value="구독취소"/>
      </p>
    </c:if>

    <c:if test="${myPage.subsType == 'admin'}">
      <p>
        <strong>관리자입니다</strong>
      </p>
    </c:if>
  </div>
</div>
 	
 	
	<input type="hidden" value= "${myPage.member_subs}"/>
	<input type="hidden" value= "${myPage.member_renew}"/>

	<br></br>

<!-- 		<div id="alarmContent"></div> -->

<!-- 알람 모달 창 -->
<!-- 	<div id="alarmModal" class="modal"> -->
		<div id="alarmModal" class="modal">
<!-- 			<span id="closeAlarmModal" style="float: right; cursor: pointer;">&times;</span> -->
			<div id="alarmContent"></div>
		</div>
<!-- 	</div> -->
	
	<!-- 업그레이드 모달 창 -->
	<div id="subsModal" class="modal">
		<div class="modal-content">
			<span id="closeSubsModal" style="float: right; cursor: pointer;">&times;</span>
			<div id="subSmodalContent"></div>
		</div>
	</div>
	

	
	<!-- 회원 탈퇴 모달창 -->
	<div id="memberQuitDoModal" class="QuitModal" >
		<div class="QuitModal-content" >
			<h2>정말 탈퇴하시겠습니까?<br/>모든 정보가 삭제됩니다.</h2>
        <button id="QuitConfirmYes" class="button-gray" data-member_idx="${myPage.member_idx}">예</button>
        <button id="QuitConfirmNo" class="button-green" >아니오</button>
		</div>
	</div>
	
	<!-- 구독 취소 모달창 -->
	<div id="subsDeleteModal" class="modal" >
		<div class="modal-content" >
			<h2>정말 취소하시겠습니까?<br/>모든 혜택이 사라집니다.</h2>
        <button id="subsDeleteYes" class="button-gray" data-member_idx="${myPage.member_idx}">예</button>
        <button id="subsDeleteNo" class="button-green" >아니오</button>
		</div>
	</div>
</c:if>
</div>
</div>
</div>
</body>



<script>

//알람 모달 스크립트
var alarmModal = $("#alarmModal");
var alarmContent = $("#alarmContent");
var openAlarmModal = $("#openAlarmModal");
/* var closeAlarmModal = $("#closeAlarmModal"); */

openAlarmModal.click(function() {
    // JSP 파일을 가져와서 모달 창에 표시
    $.get("./alarmList.go", function(data) {
    	console.log(data);
    	alarmContent.html(data);
    	alarmModal.css("display", "block");
    });
});

/* closeAlarmModal.click(function() {
	alarmModal.css("display", "none");
}); */



// 구독 색깔 지정
var subsTypeSpan = document.getElementById("subsTypeSpan");

  switch ("${myPage.subsType}") {
    case "plus":
      subsTypeSpan.style.backgroundColor = "#B22222"; /* 빨간색 */
      break;
    case "premium":
      subsTypeSpan.style.backgroundColor = "#DAA520"; /* 금색 */
      break;
    default:
      subsTypeSpan.style.backgroundColor = "#BC8F8F"; /* 기본 색상 */
  }






// 구독 취소 모달
var subsDeleteDo = $("#subsDeleteDo");
var subsDeleteModal = $("#subsDeleteModal");
var subsDeleteYes = $("#subsDeleteYes");
var subsDeleteNo = $("#subsDeleteNo");

// 구독 취소 버튼을 눌렀을 때
subsDeleteDo.click(function() {
	console.log("구독취소");
	subsDeleteModal.css("display", "block");
});

// 구독취소 예를 눌렀을 때

subsDeleteYes.click(function(e){
	var member_idx = $(this).data("member_idx");
	console.log(member_idx);
	location.href="./myPageSubsDelete.do";
 	subsDeleteModal.css("display", "none");
});


// 구독취소 아니오 눌렀을 때
subsDeleteNo.click(function() {
	subsDeleteModal.css("display", "none");
});


// 탈퇴 처리 모달
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