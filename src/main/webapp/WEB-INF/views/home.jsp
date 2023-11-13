<%@page import="com.one.mat.member.dto.ProfileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<meta charset="UTF-8">
<title>홈 화면</title>
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
	
	
	/* 본인 페이지 것으로 변경하기  */
	.btn_gnb .bi-house-door-fill, .btn_gnb.home{
	    color: var(--white);
	    background-color: var(--green);
	}
	
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	/* .btn_gnb:hover .bi-house-door-fill, */
	.btn_gnb:hover .bi-chat-dots-fill,
	.btn_gnb:hover .bi-gear-fill,
	.btn_gnb:hover .bi-people-fill,
	.btn_gnb:hover .bi-person-circle,
	.btn_gnb:hover .bi-list-ul {
	    background-color: var(--light);
	}
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	/* .btn_gnb.home:hover, */
	.btn_gnb.match:hover,
	.btn_gnb.chatting:hover,	
	.btn_gnb.board:hover,
	.btn_gnb.myPage:hover,
	.btn_gnb.admin:hover{
		background-color: var(--light);
	}
	.content {
	        /* margin-left: 260px; */
			/* padding: 20px; */
	        text-align: center; /* "우리 동네 리스트"를 가운데 정렬 */
	    }

	.sidebar {
        height: 100%;
        width: 250px;
        position: fixed;
        top: 0;
        left: 0;
        background-color: #255,255,255;
        padding-top: 20px;
    }

    .sidebar h2 {
        color: black;
        text-align: center;
    }

    .sidebar ul {
        list-style: none;
        padding: 0;
    }

    .sidebar ul li {
        padding: 10px;
        text-align: center;
    }

    .sidebar a {
        color: black;
        text-decoration: none;
    }
    #modalContent{
    	width: 500px;
    	height: 500px;
    	text-align: center; 
    }
	#photo {
		width: 300px;
		height: 200px;
	}
</style>
</head>
<body>

 <div id="wrap">
	<div class="banner">
		<div class="header">
			<h1 class="logo">
				<!-- <a href="./"><img src="/photo/logo.png" class="logo_matchDog"/></a> -->
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
	<div class="content">
    <h3>우리 동네 리스트</h3>
	<div>
	    <img id="photo">
        <p id="member_dongAddr"></p>
        <p id="member_gender"></p>
        <p id="pro_dogName"></p>
        <p id="pro_dogAge"></p>
        <p id="pro_dogGender"></p>
        <p id="pro_dogDesc"></p>
        <p id="characteristics"></p>
        <p id="proOpen" style="display: none;"></p>
	</div>
    
    <table>
        <tbody id="matchingList"></tbody>
    </table>
    <button id="prevButton">이전</button>
    <button id="nextButton">다음</button>
    <button id="matchingdel">매칭리스트 삭제</button>
    <button id="matchingreq" >매칭요청 보내기</button>
    <button id="openModal" >상세 보기</button>
    <!-- 모달을 불러올 위치 -->
    <div id="modalContent"></div>
	</div>
	</div>
</div>
</body>	
<script>
var matchingData = []; // 매칭 데이터 배열
var currentIndex = 0; // 현재 표시 중인 데이터 인덱스
var pro_idx = ""; 
var currentMatch = "";
var HiddenAge = "";
var HiddenGnd = "";
// 페이지 로딩 시 데이터 가져오기
matchinglist();

// 매칭 리스트
function matchinglist() {
    $.ajax({
        type: 'get',
        url: 'MatchingList.do',
        data: {},
        dataType: 'json',
        success: function (data) {
            console.log(data);
            console.log("성공");
            matchingData = data.list;
			console.log("matchingData : "+matchingData);
            // 페이지 로딩 시 첫 번째 매칭 데이터 표시
			showMatchingData(currentIndex);
        },
        error: function (e) {
            console.log(e);
            console.log("실패");
        }
    });
}

function showMatchingData(index) {
	var currentMatch = matchingData[index];
    // 데이터가 없는 경우 처리
    if (!currentMatch) {
        console.log("데이터가 아직 로드되지 않았습니다.");
        return;
    }
    var matchingList = currentMatch;
    
    pro_idx = matchingList.pro_idx;
    
	$.ajax({
	    type: 'get',
	    url: 'MatchingProOpen.do',
	    data: {pro_idx: pro_idx},
	    dataType: 'json',
	    success: function (data) {
	        console.log(data);
	        if (data.list && data.list.length > 0){    	
	            console.log("첫번째 숨김여부"+data.list[0].open_hide);
	            HiddenAge = data.list[0].open_hide;
		        console.log("두번째 숨김여부"+data.list[1].open_hide);
		        HiddenGnd = data.list[1].open_hide;
	        }else{
	        	console.log("데이터가 없습니다");
	        	HiddenAge = "";
	        	HiddenGnd = "";
	        }
	        // 각 데이터에 대한 처리
	    	$('#photo').attr('src', '/photo/' + matchingList.min_photo_fileName);
	        $('#photo').attr('alt', matchingList.min_photo_fileName);
	        $('#pro_dogName').text('강아지 이름: ' + matchingList.pro_dogName);
	        if (HiddenAge !== "") {
	            if (HiddenAge == 'N') {
	                $('#pro_dogAge').text('강아지 나이: ' + matchingList.pro_dogAge);
	            } else {
	                $('#pro_dogAge').text('강아지 나이: ' + '(비공개)');
	            }
	        } else {
	            $('#pro_dogAge').text('강아지 나이: ' + matchingList.pro_dogAge);
	        }
	        if (HiddenGnd !== "") {
	            if (HiddenGnd == 'N') {
	                $('#pro_dogGender').text('강아지 성별: ' + matchingList.pro_dogGender);
	            } else {
	                $('#pro_dogGender').text('강아지 성별: ' + '(비공개)');
	            }
	        } else {
	            $('#pro_dogGender').text('강아지 성별: ' + matchingList.pro_dogGender);
	        }
	        $('#pro_dogDesc').text('강아지 설명: ' + matchingList.pro_dogDesc);
	        $('#member_dongAddr').text('동 주소: ' + matchingList.member_dongAddr);
	        $('#member_gender').text('성별: ' + matchingList.member_gender);
	        $('#characteristics').text('성향: '+matchingList.characteristics);
	        $('#proOpen').text('pro_idx: ' + matchingList.pro_idx);
	    },
	    error: function (e) {
	        console.log(e);
	        console.log("실패");
	    }
	});
    
    console.log("매칭리스트 + 성향 값 : " + currentMatch);
}

// 다음 버튼 클릭 시 다음 매칭 데이터 표시
$('#nextButton').click(function () {
		console.log("다음 버튼");
    currentIndex = (currentIndex + 1) % matchingData.length;
    showMatchingData(currentIndex);
});

// 이전 버튼 클릭 시 이전 매칭 데이터 표시
$('#prevButton').click(function () {
		console.log("이전 버튼");
    currentIndex = (currentIndex - 1) % matchingData.length;
    console.log("인덱스 -1 = "+currentIndex);
    if(currentIndex < 0){
   	 currentIndex = matchingData.length-1;
   	 console.log("마지막 인덱스 = "+currentIndex);
     showMatchingData(currentIndex);
    }else{
   	 showMatchingData(currentIndex);
    }
});

// 삭제 버튼 클릭시 리스트에서 삭제
$('#matchingdel').click(function () {
	console.log("삭제 버튼");
	matchingData.splice(currentIndex,1);
	showMatchingData(currentIndex);
});

//매칭요청 버튼 클릭시 매칭요청 보내기
$('#matchingreq').click(function () {
	console.log("매칭 버튼 클릭");
	  	 
	var currentMatch = matchingData[currentIndex];
	var matchingList = currentMatch && currentMatch.matchingList && currentMatch.matchingList[currentIndex];
	var request = {
    		  pro_idx: pro_idx
    };
	$.ajax({
		type: 'POST',  // HTTP 요청 방식 선택 (GET, POST 등)
		url: 'HomeSend.do',  // 서버로 요청을 보낼 URL
		data: JSON.stringify(request),  // 데이터를 JSON 형식으로 변환하여 보냅니다
		contentType: 'application/json',  // 보내는 데이터의 유형 (JSON)
		dataType: 'Json',  // 서버로부터의 응답 데이터 타입 (JSON)
		success: function (response) {
			console.log("stringify 성공 : " + JSON.stringify(request));
		    console.log('매칭 요청 성공:', response);
		    alert("매칭 요청이 발송되었습니다");
		},
		error: function (e) {
		    // 오류 발생 시 처리하는 로직을 작성합니다
		    console.error('매칭 요청 실패:', e);
		    console.log("stringify 실패 : " + JSON.stringify(request));
		}
	}); 
});

$('#openModal').click(function (e) {
	e.stopPropagation(); // 모달의 영향을 받지 않도록 이벤트 전파 막기
	var currentMatch = matchingData[currentIndex];
	var matchingList = currentMatch && currentMatch.matchingList && currentMatch.matchingList[currentIndex];
	
	console.log("모달클릭");
	console.log("pro_idx 값: "+pro_idx);

   // JSP 파일을 가져와서 모달 창에 표시
	if (pro_idx !== '') {
	    $.get("./memberDetailList.go?pro_idx=" + pro_idx, function(data) {
	        console.log(data);
	        console.log("#modalContent");
	        $("#modalContent").html(data);
	    });
	}
});

$('#openAlarm').click(function (e) {
	e.stopPropagation(); // 모달의 영향을 받지 않도록 이벤트 전파 막기
   // JSP 파일을 가져와서 모달 창에 표시
   $.get("./alarmList.go", function(data) {
   	console.log(data);
   	console.log("#alarmContent");
       $("#alarmContent").html(data);
   });
});

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

</script>
</html>