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
<jsp:include page="adminCheck.jsp" />    
<!-- 페이징 처리를 위한 라이브러리 -->
<style>
	a, a:link, a:visited, a:active, a:hover {
		text-decoration: none;
		color: var(--black);
	}
	
	button{
	  border: 0;
	  background-color: transparent;
	  cursor : pointer;
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

    #modalContent{
    	width: 500px;
    	height: 500px;
    	text-align: center; 
    	z-index:1000
    }
	#openModal #photo {
	    position: relative;
    	left: 0px;
		width: 360px;
	    height: 520px;
	    border-radius: 12px;
  		object-fit: cover;
  		box-shadow: 0 0 8px 1px var(--light);
  		text-align: center; 
		
	}
	#openAlarm{
		cursor: pointer;
	}
	
	.mainContent{
		display:flex;
		flex-direction: column;
	}
	

	.btn{
		display: inline-block;
		position: absolute;
		width: 100px;
		height: 32px;
		padding: 6px 15px 0 15px;
		background-color: var(--green);
		border-radius: 16px;
		color:var(--white);
		font-family:Pretendard;
		font-weight: 500;
		text-align: center;
		z-index:100;	
	}
	
	.btn_ch{
		display: inline-block;
		position: relative;
		width: 92px;
		height: 28px;
		padding: 6px 15px 0 15px;
		background-color: var(--green);
		border-radius: 14px;
		color:var(--white);
		font-family:Pretendard;
		font-weight: 500;
		font-size:14px;
		text-align: center;
		z-index:100;	
		margin: 2px;
	}
	
	.main_text{
			font-size:16px;
			font-family:Pretendard;
			color:var(--dark);
			font-weight: 600;
			margin-bottom:20px;
	}
	
	.text{
        	display:inline-block;
        	position: absolute;
			width:120px;
        	font-size:16px;
			font-family:Pretendard;
			color:var(--dark);
			font-weight: 600;
			word-break: break-all;
			text-align:left;
        }
	
	.main_subject{
        	display:inline-block;
        	position: relative;
        	font-size:20px;
			font-family:Pretendard;
			color:var(--green);
			font-weight: 800;
			word-break: break-all;
			text-align:left;
			left:294px;
			margin-bottom:20px;
        }
	
	#member_dongAddr{
		top:220px;
		left:938px;
	}
	
	#member_gender{
		top:220px;
		left:718px;
	}
	
	#pro_dogName{
		font-size:30px;
		color:var(--white);
		top:471px;
		left:720px;
	}
	
	#pro_dogAge{
		top:511px;
		left:726px;
		text-align:left;
	}
	
	#pro_dogGender{
		top:511px;
		left:780px;
		text-align:left;
	}
	
	.ch_flex{
		display:flex;
		flex-wrap: wrap;
		width:200px;
	}
	
	.mat_flex{
		position:absolute;
		top:380px;
		left:750px;
		display:flex;
		width:300px;
		justify-content: space-around;
    	align-items: center;
	}
	
	.btn_flex{
		position:absolute;
		top: 410px;
    	left: 424px;
		display:flex;
		width:910px;
		justify-content: space-around;
    	align-items: center;
	}

	#characteristics{
		display:inline-block;
		position:absolute;
		top:538px;
		left:720px;
	}

	#pro_dogDesc{
		top:611px;
		left:724px;
		width:308px;
		height: 50px;
	}
	
	.bi-x-lg, .bi-heart-fill, .bi-chevron-compact-left, .bi-chevron-compact-right{
		font-weight: 900;
		font-size:42px;
	}

	.bi-heart-fill{
		color:var(--red);
	}
	
	.bi-x-lg{
		color:var(--green);
	}
	
	heart{
  cursor: pointer;
  display: inline-block;
  height: 150px;
  width: 150px;
  margin: 200px auto;
  background-size: auto 100%;
  background-position: 0 0;
  background-image: url(https://abs.twimg.com/a/1446304541/img/t1/web_heart_animation.png);
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
				<a id="openAlarm" class="alarm"><span class="bi bi-bell-fill"></span></a>
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
	            <a href="./adminList.go" class="btn_gnb admin">
	            	<span class="bi bi-gear-fill"></span>
					<span>관리자페이지</span>
	            </a>
			</div>
		</div>
	<div class="content">
		<div class="mainContent">
			<div class="main_subject">우리동네 매칭리스트</div>
			<div class="main_text">우리 동네의 만나고 싶은 강아지들과 매칭을 이용해보세요!</div>
			<div class="mat_card">
			    <button id="openModal" ><img id="photo"></button>
		        <div class="btn" id="member_dongAddr"></div>
		        <div class="btn" id="member_gender"></div>
			    <div class="text" id="pro_dogName"></div>
			    <div class="text" id="pro_dogAge"></div>
			    <div class="text" id="pro_dogGender"></div>	        
		        <div class="text" id="pro_dogDesc"></div>
		        <div id="characteristics">
		        	<div class="ch_flex">
			        	<div class="btn1 btn_ch"></div>
			        	<div class="btn2 btn_ch"></div>
			        	<div class="btn3 btn_ch"></div>
			        	<div class="btn4 btn_ch"></div>
		        	</div>
		        </div>
		        <div class="btn" id="proOpen" style="display: none;"></div>
			    <table>
			        <tbody id="matchingList"></tbody>
			    </table>
			    <div class="btn_flex">
			    <button id="prevButton"><span class="bi bi-chevron-compact-left"></span></button>
			    <button id="nextButton"><span class="bi bi-chevron-compact-right"></span></button>
			    </div>
			    <div class="mat_flex">
				    <button id="matchingdel"><span class="bi bi-x-lg"></span></button>
				    <button id="matchingreq" ><heart></heart></button>
			    </div>
			    <!-- 모달을 불러올 위치 -->
			    <div id="modalContent"></div>
			    <div id="alarmContent"></div>
			</div>
		    
		</div>
	</div>
	</div>
</div>
</body>	
<script>
function getRandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

// 각 버튼에 랜덤 색상 적용
$(document).ready(function() {
    // 랜덤 색상 생성
    var color1 = getRandomColor();
    var color2 = getRandomColor();
    var color3 = getRandomColor();
    var color4 = getRandomColor();

    // 각 버튼에 색상 적용
    $('.btn1').css('background-color', color1);
    $('.btn2').css('background-color', color2);
    $('.btn3').css('background-color', color3);
    $('.btn4').css('background-color', color4);
});

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
	        $('#pro_dogName').text(matchingList.pro_dogName);
	        if (HiddenAge !== "") {
	            if (HiddenAge == 'N') {
	                $('#pro_dogAge').text('(비공개)');
	            } else {
	                $('#pro_dogAge').html(matchingList.pro_dogAge+'살&nbsp;&nbsp;&nbsp;&nbsp;/');
	            }
	        } else {
	            $('#pro_dogAge').html(matchingList.pro_dogAge+'살&nbsp;&nbsp;&nbsp;&nbsp;/');
	        }
	        if (HiddenGnd !== "") {
	            if (HiddenGnd == 'N') {
	                $('#pro_dogGender').text('(비공개)');
	            } else {
	                $('#pro_dogGender').text(matchingList.pro_dogGender+'아');
	            }
	        } else {
	            $('#pro_dogGender').text(matchingList.pro_dogGender+'아');
	        }
	        $('#pro_dogDesc').text(matchingList.pro_dogDesc);
	        $('#member_dongAddr').text(matchingList.member_dongAddr);
	        $('#member_gender').text(matchingList.member_gender+'성');
	        

	        var ch = $('#characteristics');
	        var characteristicsArray = matchingList.characteristics.split(" / ");
	        
	        // 4개로 끊기.
	        for (var i = 0; i < characteristicsArray.length; i++) {
    			var characteristic = characteristicsArray[i];
    			var targetClass = "btn" + (i + 1); // 각 요소에 해당하는 클래스 이름
    			ch.find("." + targetClass).html(characteristic);
	        }
	        
	        //$('#characteristics').text(matchingList.characteristics);
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

/* 이거는 이전버튼 누르고 삭제 눌렀을때 제대로 동작되게 하는걸 수정하려고 넣어본 코드
$('#prevButton').click(function () {
    console.log("이전 버튼");
    currentIndex = (currentIndex - 1 + matchingData.length) % matchingData.length;
    console.log("현재 인덱스: " + currentIndex);
    showMatchingData(currentIndex);
});
*/

// 삭제 버튼 클릭시 리스트에서 삭제
$('#matchingdel').click(function () {
	console.log("삭제 버튼");
	matchingData.splice(currentIndex,1);
	showMatchingData(currentIndex);
});


function delayedAlert(){
	setTimeout(function(){
		alert("매칭 요청이 발송되었습니다");
		},500);
}

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
		  
		},
		error: function (e) {
		    // 오류 발생 시 처리하는 로직을 작성합니다
		    console.error('매칭 요청 실패:', e);
		    console.log("stringify 실패 : " + JSON.stringify(request));
		}
	}); 
		    delayedAlert();
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

var pos = 0,
dpos = 3.5714,
cycle,
heart = false,
animating = false;

$('heart').click(function () {
if (!animating) {
    animating = true;
    animate();
}
});

function animate() {
cycle = setInterval(increment, 30);
}

function increment() {
pos += dpos;
if (pos > 100) {
    clearInterval(cycle);
    animating = false;

    // 애니메이션이 완료된 후 초기 상태로 되돌아감
    resetHeart();
} else {
    $('heart').css('background-position', pos + '% 0');
}
}

function resetHeart() {
// 초기 상태로 되돌아가는 동작
$('heart').css('background-position', '0 0');
heart = !heart; // 상태를 반전시켜 다시 하트로 변경
pos = 0;
}

</script>
</html>