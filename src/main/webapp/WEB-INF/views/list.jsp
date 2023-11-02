<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap : 디자인을 위한 프레임워크 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 처리를 위한 라이브러리 -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	select{
		margin: 5px 0px;
	}

</style>
</head>
<body>
	<select id="pagePerNum">
		<option value="5">5</option>
		<option value="10">10</option>
		<option value="15">15</option>
		<option value="20">20</option>
	</select>
	<div>
	안녕하세요 ${sessionScope.loginInfo.member_nickName} 님
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="logout">로그아웃</a>  
	</div>
	<button onclick="location.href='BoardWrite'">글쓰기</button>
	<table>
		<thead>
		<tr>
			<th>번호</th>			
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		</thead>
		<tbody id="list">		
		</tbody>
		<tr>
			<td colspan="6" id="paging">	
				<!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공-->
				<div class="container">									
					<nav aria-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>					
				</div>
			</td>
		</tr>
		
	</table>
</body>
<script>
var showPage = 1;

listCall(showPage);

$('#pagePerNum').change(function(){
	// 페이지당 보여줄 게시물 갯수가 변경되면 페이징 처리 UI 를 지우고 다시 그려 준다.
	// 안그럼 처음에 계산한 페이지 값을 그대로 들고 있게 된다.
	$('#pagination').twbsPagination('destroy');
	listCall(showPage);
});

function listCall(page){
	$.ajax({
		type:'get',
		url:'list',
		data:{'pagePerNum':$('#pagePerNum').val(), 'page':page},
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

function drawList(obj){
	var content ='';
	obj.list.forEach(function(item, board_id){
		content +='<tr>';
		content +='<td>'+item.board_id+'</td>';
		content +='<td>'+'<a href="detail?board_id=item.board_id">'+item.board_subject+'</a>'+'</td>';
		content +='<td>'+item.member_nickName+'</td>';
		var regDate = new Date(item.board_regDate);
		var formattedRegDate = regDate.getFullYear() + "-" + (regDate.getMonth() + 1) + "-" + regDate.getDate();
		content +='<td>'+formattedRegDate+'</td>'; // 날짜 형식 변경
		content +='<td>'+item.board_bHit.toLocaleString()+'</td>';
		content +='</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
	
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