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
<style>
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

    .content {
        margin-left: 260px;
        padding: 20px;
        text-align: center; /* "우리 동네 리스트"를 가운데 정렬 */
    }
    #modalContent{
    	width: 500px;
    	height: 500px;
    	text-align: left; 
    }
</style>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

 <!-- Sidebar -->
    <div class="sidebar">
        <h2>매칭해주개</h2>
        <ul>
            <li><a href="">홈</a></li>
            <li><a href="joinAgree.go">회원가입</a>
            <li><a href="login.go">로그인</a></li>
            <li><a href="logout.do">로그아웃</a></li>
            <li><a href="chattingList.go">채팅</a></li>
            <li><a href="recvMatchingList.go">매칭리스트</a></li>
            <li><a href="boardList.go">커뮤니티</a></li>
            <li><a href="myProfileList.do">마이프로필</a>
            <li><a href="alarmList.go">알람</a></li>
            <li><a href="adminList.go">관리자페이지</a></li>
        </ul>
    </div>

    <div class="content">
    <h3>우리 동네 리스트</h3>
    <div id="firstMatchData">
   		  <img id="min_photo_fileName" src="" alt="min_photo_fileName">
        <p id="member_dongAddr"></p>
        <p id="member_gender"></p>
        <p id="pro_dogName"></p>
        <p id="pro_dogAge"></p>
        <p id="pro_dogGender"></p>
        <p id="pro_dogDesc"></p>
        <p id="charList"></p>
        <p id="proOpen"></p>
    </div>
    
    <table>
        <tbody id="matchingList"></tbody>
    </table>
    <button id="nextButton">다음</button>
    <button id="prevButton">이전</button>
    <button id="matchingdel">매칭리스트 삭제</button>
    <button id="matchingreq" >매칭요청 보내기</button>
    <button id="openModal" >모달 열기</button>
    <!-- 모달을 불러올 위치 -->
    <div id="modalContent"></div>
</div>
</body>	
<script>
var matchingData = []; // 매칭 데이터 배열
var currentIndex = 0; // 현재 표시 중인 데이터 인덱스

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
            matchingData = data.matchingListWithProfiles;
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
   var currentProfile = currentMatch.myProfileList[index];
   var matchingList = currentMatch.matchingList[index];
   
   console.log("currentProfile[0] : "+currentProfile);
   console.log("matchingList[0] : "+matchingList);
   
   $('#min_photo_fileName').attr('src', matchingList.min_photo_fileName);
   $('#min_photo_fileName').attr('alt', matchingList.min_photo_fileName);
   $('#pro_dogName').text('강아지 이름: ' + matchingList.pro_dogName);
   $('#pro_dogAge').text('강아지 나이: ' + matchingList.pro_dogAge);
   $('#pro_dogGender').text('강아지 성별: ' + matchingList.pro_dogGender);
   $('#pro_dogDesc').text('강아지 설명: ' + matchingList.pro_dogDesc);
   $('#member_dongAddr').text('동 주소: ' + matchingList.member_dongAddr);
   $('#member_gender').text('성별: ' + matchingList.member_gender);
   
   $('#charList').text('프로필 성향: ' + currentProfile.charTypeList); // charTypeList에 대한 표시 방법 확인 필요
   $('#proOpen').text('프로필 나이: ' + currentProfile.pro_dogAgeOpen + ', 프로필 성별: ' + currentProfile.pro_dogGenderOpen);
   console.log("매칭리스트 + 성향 값 : "+currentMatch);
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

// 매칭요청 버튼 클릭시 매칭요청 보내기
$('#matchingreq').click(function () {
	console.log("매칭 버튼 클릭");
   	 
        var currentMatch = matchingData[currentIndex];
        var matchingList = currentMatch.matchingList[currentIndex];
        var request = {
      		  pro_idx: matchingList.pro_idx
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

$('#openModal').click(function () {
	var currentMatch = matchingData[currentIndex];
  var matchingList = currentMatch.matchingList[currentIndex];
  var pro_idx = matchingList.pro_idx;

   // JSP 파일을 가져와서 모달 창에 표시
   $.get("./memberDetailList.go?pro_idx=" + pro_idx, function(data) {
   	console.log(data);
   	console.log("#modalContent");
       $("#modalContent").html(data);
   });
});

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

</script>
</html>