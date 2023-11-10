<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/recvMatchList.css" type="text/css">
<!-- bootstrap 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
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
.btn_gnb .bi-list-ul, .btn_gnb.match{
    color: var(--white);
    background-color: var(--green);
}


/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb:hover .bi-house-door-fill,
.btn_gnb:hover .bi-chat-dots-fill,
.btn_gnb:hover .bi-gear-fill,
.btn_gnb:hover .bi-people-fill,
.btn_gnb:hover .bi-person-circle,
/* .btn_gnb:hover .bi-list-ul */ {
    background-color: var(--light);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb.home:hover,
/* .btn_gnb.match:hover, */
.btn_gnb.chatting:hover,
.btn_gnb.board:hover,
.btn_gnb.myPage:hover,
.btn_gnb.admin:hover{
	background-color: var(--light);
}

.proDetail{
	display:inline-block;
	width:240px;
}

.blur{
	display:flex;
	align-items: center;
    justify-content: center;
    background-color: rgba(0,0,0,0.05);
}

.blur span{
	font-size: 14px;
	line-height: 22px;
	color: var(--dark);
	font-weight: 600;
  	font-family:Pretendard;
  	text-align:center;
  	

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
				<a href="./" class="btn_gnb home">
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
		
		<!-- 여기다가 각자 내용 추가하기 -->
				<div class="container">
			        <div class="left">
			            <div class="top">
			            	<div class="recvMatchingList">나에게 온 요청 리스트</div>
			            </div>
						<!-- 리스트 -->
			            <ul class="people">
			            </ul>
						<!-- 페이징 -->			
						<nav aria-label="Page navigation" style="text-align:center">
							<ul class="pagination" id="pagination"></ul>
						</nav>					
			        </div>
				</div>
				
		</div>
	</div>
</div>
</body>
<script>

var showPage = 1;

listCall(showPage);

function listCall(page){
	$.ajax({
		type:'post',
		url:'recvMatchingList.do',
		data:{'pagePerNum':5, 'page':page},
		dataType:'json',
		success:function(data){
			console.log(data);
			drawList(data);
		},
		error:function(e){
			console.log(e);
		}
	});
}

// 일반 회원이면 3개 이상 리스트 못보게 제한 걸려있음.
// 나에게 요청 보낸 리스트 보기
function drawList(obj){
	
	if(obj.subsType != 1 || obj.matList.length <= 3){
		
		console.log("일반회원이 아닙니다!");
	
		var content = '';
	
		obj.matList.forEach(function(item, idx){
			content +='<li class="person">';
			content +='<div class="myName">'+item.myDogName+' 님에게 온 매칭요청입니다.</div>';
			content +='<a href="./memberDetailList.go?pro_idx='+item.pro_idx+'">';
			content +='<span class="proDetail">'
			content +='<img src="/photo/'+item.photo_fileName+'"/>';
			content +='<span class="name">'+item.pro_dogName+'</span> ';
			content +='<span class="breedType">'+item.breedType+'</span>';
			content +='</span>'
			content +='</a>'
			content +='<span class="time">'+item.matchTime+'</span>';
			content +='<a href="./chatOpen.do?match_idx='+item.match_idx+'"><span class="bi bi-hearts"></span></a>';
			content+='<span class="charTypeList">'
			item.charType.forEach(function(charType,idx){
				content +='<span class="charType">'+charType+'</span>';
			});
			content+='</span>'
			content +='</li>';
		});
	
	}else{
		
		console.log("일반회원이네요?");
		
		var content = '';
	
		for (var idx = 0; idx < 3; idx++) { // idx가 2까지 돌리려면 3으로 설정
		    var item = obj.matList[idx];
		
			content +='<li class="person">';
			content +='<div class="myName">'+item.myDogName+' 님에게 온 매칭요청입니다.</div>';
			content +='<a href="./memberDetailList.go?pro_idx='+item.pro_idx+'">';
			content +='<span class="proDetail">'
			content +='<img src="/photo/'+item.photo_fileName+'"/>';
			content +='<span class="name">'+item.pro_dogName+'</span> ';
			content +='<span class="breedType">'+item.breedType+'</span>';
			content +='</span>'
			content +='</a>'
			content +='<span class="time">'+item.matchTime+'</span>';
			content +='<a href="./chatOpen.do?match_idx='+item.match_idx+'"><span class="bi bi-hearts"></span></a>';
			content+='<span class="charTypeList">'
			item.charType.forEach(function(charType,idx){
				content +='<span class="charType">'+charType+'</span>';
			});
			content+='</span>'
			content +='</li>';
		}
		content +='<a href="./myPageList.do">';
		content +='<li class="person blur">';
		content +='<span>리스트를 3개 이상 더 보고싶으시면 구독을 해주세요!</span> ';
		content +='</li>';
		content +='</a>'

	}
	
	$('.people').empty();
	$('.people').append(content);
	

	// 페이징 처리 UI 그리기(플러그인 사용)
	$('#pagination').twbsPagination({
		startPage:obj.currPage, // 보여줄 페이지
		totalPages:obj.pages,// 총 페이지 수(총갯수/페이지당보여줄게시물수) : 서버에서 계산해서 가져와야함
		visiblePages:5,//[1][2][3][4][5]
		onPageClick:function(e,page){ // 번호 클릭시 실행할 내용
			//console.log(e);
			if(showPage != page){
				console.log(page);
				showPage = page; // 클릭해서 다른 페이지를 보여주게 되면 현재 보고 있는 페이지 번호도 변경해 준다.
				listCall(page);
			}
		}
	});
	// 페이징 처리 css 변경
	$('.first').children().empty();
	$('.last').children().empty();
	$('.prev').children().empty();
	$('.next').children().empty();
	$('.first').children().addClass('bi bi-chevron-double-left');
	$('.last').children().addClass('bi bi-chevron-double-right');
	$('.prev').children().addClass('bi bi-chevron-left');
	$('.next').children().addClass('bi bi-chevron-right');
	
} 


</script>
</html>