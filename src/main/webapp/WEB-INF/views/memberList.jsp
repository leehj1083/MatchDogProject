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
	.whole{
		width:auto;
		height : 100%;
		margin :0px auto;
		padding : 20px;
		border : 1px solid black;
	}
	.header{
		height : 100px;
		padding : 20px;
		margin-bottom: 20px;
		border:1px solid black;
	}
	.headerRight{
		text-align: right;
	}
    .sidebar {
        width: auto;
        height : auto;
        float : left;
        margin-right : 20px;
        background-color: #255,255,255;
        padding-top: 20px;
        border : 1px solid black;
    }

    .sidebar h2, h3 {
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
    	width : auto;
        float: right;
    }
	
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		font-size: 15px;
	}	
	
	select{
		margin: 5px 0px;
	}

</style>
</head>
<body>	
	<div class="whole">
		<div class="header">
			<a href="./"><img src="./resources/img/maticon.PNG" src="매칭해주개메인" /></a>
			<div class ="headerRight">
				안녕하세요 ${sessionScope.loginInfo.member_nickName} 님&nbsp;&nbsp;&nbsp;&nbsp;		
				<a href="logout">로그아웃</a>
			</div>
		</div>
		<div class="sidebar">
	        <ul>
	            <li><h3 style="font-weight: bold; ">관리자 페이지</h3></li>
	            <li><a href="./dashBoard.go">DASH BOARD</a></li>
	            <li><a href="./memberList.go">회원관리</a></li>
	            <li><a href="./compList.go">신고관리</a><br><hr/>	            
	            <li><a href="./home.go">서비스 페이지</a></li>
	        </ul>
	    </div>
		<div class="title">
			<h2>매칭해주개 회원 리스트</h2><hr/>
			<span style="font-size: medium; font-weight: bold;">총 회원 수&nbsp;<span id="totalUser"></span>&nbsp;명</span>
			<select id="pagePerNum" style="float: right;">
				<option value="10">10</option>
				<option value="15">15</option>
				<option value="20">20</option>
			</select>
		</div>
		<div class="content">	
			<table>
				<thead>
					<tr>
						<th>번호</th>			
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>거주지(동)</th>
						<th>구독여부</th>
						<th>구독연장여부</th>
						<th>제재여부</th>
						<th>권한등급</th>
					</tr>
				</thead>
				<tbody id="list">		
				</tbody>
				<tr>
					<td colspan="10" id="paging">	
						<!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공-->
						<div class="container">									
							<nav aria-label="Page navigation" style="text-align:center">
								<ul class="pagination" id="pagination"></ul>
							</nav>					
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="10" style="text-align:center">
						<div id="searchDIV">
							<select id="searchType" name="searchType">
								<option value="member_id">아이디</option>
								<option value="member_name">이름</option>
								<option value="member_dongAddr">거주지(동)</option>
							</select>
							 <input type="text" id="searchKeyword" name="searchKeyword" placeholder="검색어 입력">
			  				 <button id="search">검색</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  				 <button id="authorization">권한관리</button>
		  				 </div>
					</td>
				</tr>			
			</table>
		</div>
	</div>
</body>
<script>
var showPage = 1;
var searchType ='';
var searchKeyword = '';

listCall(showPage, searchType, searchKeyword);
countUser(searchType, searchKeyword);


$('#pagePerNum').change(function(){
	// 페이지당 보여줄 게시물 갯수가 변경되면 페이징 처리 UI 를 지우고 다시 그려 준다.
	// 안그럼 처음에 계산한 페이지 값을 그대로 들고 있게 된다.
	$('#pagination').twbsPagination('destroy');
	listCall(showPage, searchType, searchKeyword);
});

$('#search').click(function(){	
	searchType = $('#searchType').val();
    searchKeyword = $('input[name="searchKeyword"]').val();
    console.log(searchType);
    console.log(searchKeyword);
    console.log(showPage);
    $('#pagination').twbsPagination('destroy');
    listCall(showPage, searchType, searchKeyword);
});


function listCall(page, searchType, searchKeyword){
	$.ajax({
		type:'get',
		url:'memberList.do',
		data:{
			'pagePerNum':$('#pagePerNum').val(),
			'page':page,
			'searchType': searchType,
            'searchKeyword': searchKeyword
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
				countUser(searchType, searchKeyword);
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
					listCall(lastPage, searchType, searchKeyword);	
				}else{
					showPage=page;  // 클릭해서 다른 페이지를 보여주게 되면 현재 보고있는 페이지 번호도 변경해준다.
					listCall(showPage, searchType, searchKeyword);
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

function countUser(searchType, searchKeyword){
	$.ajax({
		type:'get',
		url:'countUser.do',
		data:{
			'searchType': searchType,
            'searchKeyword': searchKeyword
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

</script>
</html>