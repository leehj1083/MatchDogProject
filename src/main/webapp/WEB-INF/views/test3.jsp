<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/test3.css" type="text/css">
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

</style>
</head>
<body>
<div class="wrapper">
	<div class="container">
        <div class="left">
        
            <div class="top">
                <input type="text" placeholder="Search" />
                <a href="javascript:;" class="search"></a>
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
</body>
<script>
var showPage = 1;

listCall(showPage);

function listCall(page){
	$.ajax({
		type:'post',
		url:'chattingList.do',
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

// 채팅방 리스트 뿌려주기...
function drawList(obj){
	
	var content = '';

	obj.list.forEach(function(item, idx){
		content +='<li class="person">';
		content +='<a href="./chattingRoom.go?chat_idx='+item.chat_idx+'">';
		content +='<div class="myName">'+item.myDogName+' 님에게 온 매칭입니다.</div>';
		content +='<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/michael-jordan.jpg"/>';
		content +='<span class="name">'+item.pro_dogName+'</span> ';
		content +='<span>'+item.breedType+'</span>';
		content +='<span class="time">'+item.msgTime+'</span>';
		content +='<span>'+item.chatMsg_read+'</span>';
		content +='<span class="preview">'+item.chatMsg_msg+'</span>';
		content +='</a>'
		content +='</li>';
		
	});
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
}

</script>
</html>