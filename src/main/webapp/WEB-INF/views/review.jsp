<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/chattingRoom.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>

#input_img{
	display:none;
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

.container .right .people .person img {
	left:40%;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	object-fit: cover;
	box-shadow: 0 0 8px 1px var(--light);
}

.container .right{
	position: relative;
	top:56px;
	height:480px;
	border: none;
	box-shadow: none;
}

.container .right .top{
	top: 0px;
	border-radius : 8px;
	background-color:var(--green);
	font-size: 18px;
	font-family:Pretendard;
	font-weight: 600;	
	padding: 15px 20px;
	box-shadow: 0 0 8px 1px var(--light);
}

.container .right .top span{
	color: var(--white);
}

.bi-chevron-left{
	margin-right:20px;
	font-weight:800;
	font-size:32px;
	cursor:pointer;
}

.person{
	position:relative;
	top:60px;
	height:240px;
	display:flex;
	flex-direction: column;
    align-items: center;
}

.name{
	font-size:20px;
	font-weight:700;
	padding:10px;	
}

.breedType{
	margin-bottom:10px;	
}

.explanation{
	display:flex;
	flex-direction: column;
    align-items: center;
    font-size: 12px;
	font-family:Pretendard;
	font-weight: 400;
	color:var(--grey);
}


.explanation div{
	margin-bottom:4px;
}

.goodOrBad{
	display:flex;
	justify-content: center;
}

.good, .bad{
	display: flex;
	justify-content: center;
	width: 180px;
	height: 56px;
	padding: 15px 15px;
	margin: 15px;
	border: 1px solid var(--light);
	background-color: var(--light);
	border-radius: 10px;
	font-family:Pretendard;
	font-weight: 500;
	text-align: center;
	cursor:pointer;
}

.bi-emoji-heart-eyes-fill, .bi-emoji-neutral-fill{
	display:inline-block;
	font-size: 22px;
	margin-right: 10px;
}

.good{
	background-color: var(--green);
	color:var(--white);
}

.bad:hover{
	background-color: var(--green);
	color:var(--white);
}

.bad{
	background-color:var(--light);
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
		        <a href="./myProfileList.do" class="btn_gnb myPage">
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
			<div class="container">
        		<div class="right">
        			<div class="top">
        				<span class="bi bi-chevron-left"></span>
        				<span class="reviewWrite">후기 작성</span>
        			</div>
        			<div class="people">
        				<div class="person">
        				</div>
        			</div>
        			<div class="explanation">
						<div>매칭한 상대는 어떠셨나요?</div>
						<div>괜찮으셨다면 '좋아요' 를</div>
						<div>괜찮지 않으셨다면 '별로에요' 를 눌러주세요!</div>
						<div>( 주신 점수는 매너견 호칭 획득에 반영됩니다. )</div>
					</div>
					<div class="goodOrBad">
						<div class="goodPopUp">
							<div class="good">
								<div class="bi bi-emoji-heart-eyes-fill"></div>
								<div>좋아요 +1</div>
							</div>
						</div>
						<div class="badPopUp">
							<div class="bad">
								<div class="bi bi-emoji-neutral-fill"></div>
								<div>별로에요 -1</div>
							</div>
						</div>
					</div>
		        </div>
		    </div>
		</div>
	</div>
</div>
</body>
<script>

var chat_idx = ${chat_idx};
var pro_idx = ${pro_idx};

$.ajax({
	type:'post',
	url:'reviewProfile.do',
	data:{'pro_idx' : pro_idx},
	dataType:'JSON',
	success:function(data){
		console.log(data);
		drawList(data);
	},
	error:function(e){
		console.log(e);
	}
});

$('.bi-chevron-left').on('click',function(){
	location.href="./chattingRoom.go?chat_idx="+chat_idx;
});

function drawList(obj){
	var content = '';
	
	content +='<div><img src="/photo/'+obj.dto.photo_fileName+'"/></div>';
	content +='<div class="name">'+obj.dto.pro_dogName+'</div> ';
	content +='<div class="breedType">'+obj.dto.breedType+'</div>';
	$('.person').empty();
	$('.person').append(content);
	
}


// css 처리
$('.bad').on('mouseover',function(){
	$('.good').css('background-color','var(--light)');
	$('.good').css('color','var(--dark)');
});

$('.bad').off('mouseleave');

$('.bad').on('mouseleave', function () {
	  // 마우스를 떼면 원래 스타일로 복구
	  $('.good').css('background-color', 'var(--green)'); // 배경색 초기화
	  $('.good').css('color', 'var(--white)'); // 글자색 초기화
	});

// 내용 전송

  $(".good").on('click',function() {
	  // location.href="./chattingRoom.go?chat_idx="+chat_idx;
	  
 	  $.ajax({
			type:'post',
			url:'reviewLike.do',
			data:{'pro_idx' : pro_idx,'chat_idx':chat_idx},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if(data.result != 0){
					location.href="./chattingRoom.go?chat_idx="+chat_idx;
				}
			},
			error:function(e){
				console.log(e);
			}
		});
  });
  
  $(".bad").on('click',function() {
	  
	  $.ajax({
			type:'post',
			url:'reviewUnLike.do',
			data:{'pro_idx' : pro_idx,'chat_idx':chat_idx},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if(data.result != 0){
					location.href="./chattingRoom.go?chat_idx="+chat_idx;
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	  
  });



</script>
</html>