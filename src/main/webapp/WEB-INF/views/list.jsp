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
	.icon {
    	margin-right: 10px;
	}
	#reply{
		color: blue;
	    text-decoration: none; /* 밑줄 제거 */
	}
	a {
    	color: black;
    	text-decoration: none; /* 밑줄 제거 */
	}
	/* 방문한 링크(회색) */
	a:visited {
	    color: black;
	}
	/* 링크 스타일 (검은색) */
	a:hover {
	    color: black;
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
			<th>추천</th>
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
		<tr>
			<td colspan="6" style="text-align:center">
				<div id="searchDIV">
					<select id="searchType">
						<option value="board_subject">제목</option>
						<option value="board_content">글내용</option>
						<option value="member_nickName">작성자</option>
					</select>
					 <input type="text" id="searchKey" placeholder="검색어 입력">
	  				 <button id="search">검색</button>
  				 </div>
			</td>
		</tr>
		
	</table>
</body>
<script>
var showPage = 1;
var searchType = '';
var searchKeyword = '';

listCall(showPage);

$('#pagePerNum').change(function () {
    var selectedPagePerNum = $('#pagePerNum').val();
    $('#pagination').twbsPagination('destroy');
    
    // 검색한 상태인지 확인하고 이에 따라 listCall 또는 searchCall 함수를 호출
    if (searchType !== '' && searchKeyword !== '') {
        searchCall(showPage, searchType, searchKeyword);
    } else {
        listCall(showPage);
    }
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

function drawList(obj) {
    var content = '';
    var totalItems = obj.list.length;
	
    if (totalItems === 0) {
    		content = '<tr><td colspan="5">검색 결과가 없습니다.</td></tr>';
    } else {
        obj.list.forEach(function (item, board_id) {
        	content += '<tr>';
        	content += '<td>' + item.board_id + '</td>';
        	content += '<td><a class="icon" href="detail?board_id=' + item.board_id + '">' + item.board_subject;
        	if (item.img > 0) {
        	    content += '<a class="icon"><img src="resources/img/image.png" width="20px" height="20px"></a>';
        	}
        	if (item.reply > 0) {
        	    content += '<a id="reply" class="icon">[' + item.reply + ']</a>';
        	}
        	content += '</td>';
        	content += '<td>' + item.member_nickName + '</td>';
        	var regDate = new Date(item.board_regDate);
        	var formattedRegDate = regDate.getFullYear() + "-" + (regDate.getMonth() + 1) + "-" + regDate.getDate();
        	content += '<td>' + formattedRegDate + '</td>';
        	content += '<td>' + item.board_bHit.toLocaleString() + '</td>';
        	content += '<td>' + item.likeCount.toLocaleString() + '</td>';
        	content += '</tr>';
        });
        $('#list').empty();
        $('#list').append(content);

        // 검색 결과가 있으면 페이징 UI 그리기
        if (searchType !== '' && searchKeyword !== '') {
            $('#pagination').twbsPagination({
                startPage: obj.currPage,
                totalPages: obj.pages,
                visiblePages: 5,
                onPageClick: function (e, page) {
                    if (showPage != page) {
                        showPage = page;
                        searchCall(page, searchType, searchKeyword); // 검색 결과로 페이지 이동
                    }
                }
            });
        } else {
            $('#pagination').twbsPagination({
                startPage: obj.currPage,
                totalPages: obj.pages,
                visiblePages: 5,
                onPageClick: function (e, page) {
                    if (showPage != page) {
                        showPage = page;
                        listCall(page); // 일반 목록으로 페이지 이동
                    }
                }
            });
        }
    }
}

$('#search').click(function () {
    searchType = $('#searchType').val();
    searchKeyword = $('#searchKey').val();
    showPage=1;
    $('#pagination').twbsPagination('destroy');
    searchCall(showPage, searchType, searchKeyword);
});

function searchCall(page, searchType, searchKeyword) {
    $.ajax({
        type: 'get',
        url: 'search',
        data: {
            'pagePerNum': $('#pagePerNum').val(),
            'page': page,
            'searchType': searchType,
            'searchKeyword': searchKeyword
        },
        dataType: 'json',
        success: function (data) {
            console.log(data);
            drawList(data);
        },
        error: function (e) {
            console.log(e);
        }
    });
}

</script>
</html>