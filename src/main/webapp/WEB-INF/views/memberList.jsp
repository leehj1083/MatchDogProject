<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/chattingList.css" type="text/css">
<!-- bootstrap 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<!-- bootstrap : 디자인을 위한 프레임워크 -->
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

/* 본인 페이지 것으로 변경하기  */
.btn_gnb .bi-chat-dots-fill, .btn_gnb.chatting{
    color: var(--white);
    background-color: var(--green);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb:hover .bi-house-door-fill,
.btn_gnb:hover .bi-gear-fill,
.btn_gnb:hover .bi-people-fill,
.btn_gnb:hover .bi-person-circle,
.btn_gnb:hover .bi-list-ul {
    background-color: var(--light);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb.home:hover,
.btn_gnb.match:hover,
.btn_gnb.board:hover,
.btn_gnb.myPage:hover,
.btn_gnb.admin:hover{
	background-color: var(--light);
}

table{
	width :950px;
	border: 1px solid black;
	border-collapse: collapse;	
	table-layout: fixed;
	font-size: 14px;
}
th,td{
	border : 1px solid black;
	text-align : center;
	padding : 5px 7px;
}
.logo_matchDog{
	width : 120px;
	height : 40px;
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
				<a href="./alarmList.go" class="alarm"><span class="bi bi-bell-fill"></span></a>
				<a href="./logout.do"><span class="logout">로그아웃</span></a>
			</div>
		</div>
	</div>
	<div class="mainContainer">
		<div class="side">
			<div class="menu">
				<a href="./adminList.go" class="btn_gnb home">
					<span class="bi bi-house-door-fill"></span>
					<span>관리자 페이지</span>
				</a>
		        <a href="./adminList.go" class="btn_gnb match">
		        	<span class="bi bi-list-ul"></span>
					<span>DASH BOARD</span>
		        </a>
		        <a href="./memberList.go" class="btn_gnb chatting">
		        	<span class="bi bi-chat-dots-fill"></span>
					<span>회원관리</span>
		        </a>
		        <a href="./authList.do" class="btn_gnb chatting">
	                <span class="bi bi-chat-dots-fill"></span>
	                <span>권한관리</span>
               </a>
		        <a href="./compList.go" class="btn_gnb board">
		        	<span class="bi bi-people-fill"></span>
					<span>신고관리</span>
		        </a>
		        <a href="./HomeMatchingList.do" class="btn_gnb myPage">
		        	<span class="bi bi-person-circle"></span>
					<span>서비스페이지</span>
		        </a>
			</div>
		</div>
		<div class="content">
		<h2>매칭해주개 회원 리스트</h2><hr/>
			<span style="font-size: medium; font-weight: bold;">총 회원 수&nbsp;<span id="totalUser"></span>&nbsp;명</span>
			<select id="pagePerNum" style="float: right;">
				<option value="10">10</option>
				<option value="15">15</option>
				<option value="20">20</option>
			</select>
			<div class="listTable">
				<table>
					<thead>
						<tr>
							<th style="width: 60px;">번호</th>			
							<th style="width: 90px;">아이디</th>
							<th style="width: 90px;">이름</th>
							<th style="width: 120px;">전화번호</th>
							<th style="width: 180px;">이메일</th>
							<th>거주지(동)</th>
							<th style="width: 75px;">구독여부</th>
							<th style="width: 75px;">구독연장</th>
							<th style="width: 75px;">제재여부</th>
							<th style="width: 85px;">
								<select id="subsType" name="subsType">
									<option value="all" selected="selected">구독등급</option>
									<option value="standard">일반회원</option>
									<option value="plus">플러스</option>
									<option value="premium">프리미엄</option>
									<option value="admin">관리자</option>
								</select>
							</th>
						</tr>
					</thead>
					<tbody id="list">		
					</tbody>
					<tr>
						<td colspan="10" id="paging" style="padding-bottom: 30px; padding-top: 15px;"> 	
							<!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공-->
							<div class="container">									
								<nav aria-label="Page navigation">
									<ul class="pagination" id="pagination" style="display: block; text-align: center;"></ul>
								</nav>					
							</div><p><br>
							<div id="searchDIV">
								<select id="searchType" name="searchType">
									<option value="member_id">아이디</option>
									<option value="member_name">이름</option>
									<option value="member_dongAddr">거주지(동)</option>
								</select>
								 <input type="text" id="searchKeyword" name="searchKeyword" placeholder="검색어 입력">
				  				 <button id="search">검색</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  				 </div>
						</td>
					</tr>							
				</table>
			</div>
		</div>
	</div>
</div>
</body>
<script>
var showPage = 1;
var searchType ='';
var searchKeyword = '';
var subsType = '';

listCall(showPage, searchType, searchKeyword, subsType);
countUser(searchType, searchKeyword, subsType);


$('#pagePerNum').change(function(){
	// 페이지당 보여줄 게시물 갯수가 변경되면 페이징 처리 UI 를 지우고 다시 그려 준다.
	// 안그럼 처음에 계산한 페이지 값을 그대로 들고 있게 된다.
	$('#pagination').twbsPagination('destroy');
	listCall(showPage, searchType, searchKeyword, subsType);
});

$('#search').click(function(){	
	searchType = $('#searchType').val();
    searchKeyword = $('input[name="searchKeyword"]').val();  
    console.log(searchType);
    console.log(searchKeyword);
    console.log(showPage);    
    $('#pagination').twbsPagination('destroy');
    listCall(showPage, searchType, searchKeyword, subsType);
});

$('#subsType').change(function(){
	subsType=$('#subsType').val();
	console.log(subsType);
	$('#pagination').twbsPagination('destroy');
	listCall(showPage, searchType, searchKeyword, subsType);
});

function listCall(page, searchType, searchKeyword, subsType){
	$.ajax({
		type:'get',
		url:'memberList.do',
		data:{
			'pagePerNum':$('#pagePerNum').val(),
			'page':page,
			'searchType': searchType,
            'searchKeyword': searchKeyword,
            'subsType':subsType
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.success == -1){
				alert('이 페이지에 접근할 수 없습니다.');
				location.href="./";
			}else{
				console.log(data.pages);
				drawList(data);
				countUser(searchType, searchKeyword, subsType);
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}


function drawList(obj) {
	console.log(obj);
	console.log(obj.currPage);
	console.log(obj.pages);
	var totalPages = obj.pages;
    var content = '';
    var totalUser = obj.list.length;

    if (totalUser == 0) {
    		content = '<tr><td colspan="10">회원 리스트가 없습니다.</td></tr>';
    }else {
        obj.list.forEach(function (item) {
            content += '<tr>';
            content += '<td>' + item.member_idx + '</td>';
            content += '<td>' + item.member_id + '</td>';
            content += '<td>' + '<a href="./memberDetail?member_idx='+item.member_idx+'">'+ item.member_name +'</a>'+'</td>';
            content += '<td>' + item.member_phone + '</td>';
            content += '<td>' + item.member_email + '</td>';
            content += '<td>' + item.member_dongAddr + '</td>';
            content += '<td>' + item.member_subs + '</td>';
            content += '<td>' + item.member_renew + '</td>';           
            content += '<td>' + item.member_loginLock + '</td>';  
            content += '<td>' + item.subsType_code + '</td>';  
            content += '</tr>';
        })
            

    // 검색 결과가 있으면 페이징 UI 그리기
    $('#pagination').twbsPagination({
        startPage: showPage, // 시작시 보여줄 페이지
        totalPages: obj.pages, // 총 페이지 수 (총 갯수 / 페이지당 보여줄 게시물 수): 서버에서 계산해서 가져와야함
        visiblePages: 5, // [1][2][3][4][5]
        onPageClick: function (e, page) {
        	console.log(page);
            console.log(obj.currPage);
            console.log(obj.pages);
            if (showPage != page) {                
                if(page>obj.pages){
					var lastPage = 0;
					lastPage = obj.pages;
					listCall(lastPage, searchType, searchKeyword, subsType);	
				}else{
					showPage=page;  // 클릭해서 다른 페이지를 보여주게 되면 현재 보고있는 페이지 번호도 변경해준다.
					listCall(showPage, searchType, searchKeyword, subsType);
				}                    
            }                
        }
    });
    };
    $('#list').empty();
    $('#list').append(content);
}


$('#authorization').click(function(){
	location.href="./auth.go";
});

function countUser(searchType, searchKeyword, subsType){
	$.ajax({
		type:'get',
		url:'countUser.do',
		data:{
			'searchType': searchType,
            'searchKeyword': searchKeyword,
            'subsType':subsType
		},
		dataType:'json',
		success:function(data){
			console.log(data.cnt);			
			$('#totalUser').html(data.cnt);
		},
		error:function(e){
			console.log(e);
		}
	});
}

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

</script>
</html>