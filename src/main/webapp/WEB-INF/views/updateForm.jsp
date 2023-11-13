<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="resources/css/board.css" type="text/css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<!-- 페이징 처리를 위한 라이브러리 -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>

a, a:link, a:visited, a:active, a:hover {
		text-decoration: none;
		color: var(--black);
	}
	
	
	/* 본인 페이지 것으로 변경하기  */
	.btn_gnb .bi-people-fill, .btn_gnb.board{
	    color: var(--white);
	    background-color: var(--green);
	}
	
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	 .btn_gnb:hover .bi-house-door-fill,
	.btn_gnb:hover .bi-chat-dots-fill,
	.btn_gnb:hover .bi-gear-fill,
  /*.btn_gnb:hover .bi-people-fill, */
	.btn_gnb:hover .bi-person-circle,
	.btn_gnb:hover .bi-list-ul {
	    background-color: var(--light);
	}
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
  .btn_gnb.home:hover,
	.btn_gnb.match:hover,
	.btn_gnb.chatting:hover,	
	/* .btn_gnb.board:hover,*/
	.btn_gnb.myPage:hover,
	.btn_gnb.admin:hover{
		background-color: var(--light);
	}
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
    </style>
</head>
<body>

<div id="wrap">
	<div class="banner">
		<div class="header">
			<h1 class="logo">
				<!-- <a href="./"><img src="/photo/logo.png" class="logo_matchDog"/></a> -->
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
		<div id="alarmContent"></div>
	<form action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="board_id" value="${board.board_id}"/>
	<input type="hidden" name="delphotoArray" value=""/>
	<table>
		<h2>글수정</h2>
		<hr>
		<tr>
			<td cols="2">작성자 : &nbsp&nbsp<input type="text" name="member_nickName" value="${board.member_nickName}" readonly="readonly"/></td>
		</tr>
		<tr>
			<td cols="2">제목 : &nbsp&nbsp<input type="text" name="board_subject" value="${board.board_subject}"/></td>
		</tr> 
		<tr>
			<td cols="2"><textarea name="board_content" rows="15" cols="140">${board.board_content}</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="file" name="photos" multiple="multiple"/></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" id="cancel" value="취소"/>
				<input type="submit" value="수정저장"/>
			</th>
		</tr>
	</table>
		<p>사진</p>
        <c:if test="${photos.size() > 0}">
			<c:forEach items="${photos}" var="photo">               
				<div class="photo-item" style="display: inline;">
					<img src="/photo/${photo.photo_fileName}" width="100" height="100" alt="${photo.photo_fileName}"/>
					<button data-photo_id="${photo.photo_id}" class="delphoto">삭제</button>
				</div>
			</c:forEach>
        </c:if>
	</form>
	</div>
	</div>
	</div>
	
</body>
<script>
var hidePhotoArray = [];

$('.delphoto').click(function() {
    event.preventDefault();
    var photoId = $(this).data('photo_id');
    var photoDiv = $(this).parent(); // 이미지를 감싸는 div 요소
	
    photoDiv.hide();
    hidePhotoArray.push(photoId);
    $('[name="delphotoArray"]').val(hidePhotoArray.join(','));
});

$('#cancel').click(function() {
    if (confirm('변경내용이 저장되지않습니다.')) {
        location.href = './detail?board_id=${board.board_id}';
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

</script>
</html>