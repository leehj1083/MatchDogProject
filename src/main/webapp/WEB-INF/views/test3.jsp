<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 처리를 위한 라이브러리 -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<link rel="stylesheet" href="resources/css/test3.css" type="text/css">
<style>
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
            <ul class="people">
                <li class="person" data-chat="person1">
                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/thomas.jpg" alt="" />
                    <span class="name">Thomas Bangalter</span>
                    <span class="time">2:09 PM</span>
                    <span class="preview">I was wondering...</span>
                </li>
                <li class="person" data-chat="person2">
                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/dog.png" alt="" />
                    <span class="name">Dog Woofson</span>
                    <span class="time">1:44 PM</span>
                    <span class="preview">I've forgotten how it felt before</span>
                </li>
                <li class="person" data-chat="person3">
                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/louis-ck.jpeg" alt="" />
                    <span class="name">Louis CK</span>
                    <span class="time">2:09 PM</span>
                    <span class="preview">But we’re probably gonna need a new carpet.</span>
                </li>
                <li class="person" data-chat="person4">
                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/bo-jackson.jpg" alt="" />
                    <span class="name">Bo Jackson</span>
                    <span class="time">2:09 PM</span>
                    <span class="preview">It’s not that bad...</span>
                </li>
                <li class="person" data-chat="person5">
                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/michael-jordan.jpg" alt="" />
                    <span class="name">Michael Jordan</span>
                    <span class="time">2:09 PM</span>
                    <span class="preview">Wasup for the third time like is you blind bitch</span>
                </li>
            </ul>	
			<!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공-->
			<div class="container">									
				<nav aria-label="Page navigation" style="text-align:center">
					<ul class="pagination" id="pagination"></ul>
				</nav>					
			</div>
        </div>
	</div>
</div>
</body>
<script>
var showPage = 1;

listCall(showPage);

/* $('#pagePerNum').change(function(){
	// 페이지당 보여줄 게시물 갯수가 변경되면 페이징 처리 UI 를 지우고 다시 그려 준다.
	// 안그럼 처음에 계산한 페이지 값을 그대로 들고 있게 된다.
	$('#pagination').twbsPagination('destroy');
	listCall(showPage);
}); */

function listCall(page){
	$.ajax({
		type:'post',
		url:'chattingList.do',
		data:{'pagePerNum':5,'page':page},
		dataType:'json',
		success:function(data){
			console.log(data);
			//drawList(data);
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(obj){
	/* var content ='';
	obj.list.forEach(function(item, idx){
		content +='<tr>';
		content +='<td>'+item.idx+'</td>';
		content +='<td>'+item.subject+'</td>';
		content +='<td>'+item.user_name+'</td>';
		content +='<td>'+item.bHit+'</td>';
		content +='<td>'+item.reg_date+'</td>';
		content +='</tr>';
	});
	$('#list').empty();
	$('#list').append(content); */
	
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