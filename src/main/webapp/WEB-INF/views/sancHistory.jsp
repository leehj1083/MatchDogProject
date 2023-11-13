<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="resources/css/home.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 처리를 위한 라이브러리 -->

<style>
table,td{
border: 1px solid black;
}
a, a:link, a:visited, a:active, a:hover {
		text-decoration: none;
		color: var(--black);
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
	    #modalContent{
	    	width: 500px;
	    	height: 500px;
	    	text-align: left; 
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

    .content {
        margin-left: 260px;
        padding: 20px;
        text-align: center; /* "우리 동네 리스트"를 가운데 정렬 */
    }
    #modalContent{
    	width: 500px;
    	height: 500px;
    	text-align: left; 
    }
</style>
</head>
<body>
<div class="container">
		<a href="./"><img src="./resources/img/maticon.PNG" src="매칭해주개메인" /></a>
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




<table>
<tr>
<td>번호</td>
<td>제제 종류</td>
<td>제제 시작일</td>
<td>제제 종료일</td>
<td>제제사유</td>
</tr>
<tr>
<td colspan="5"><c:if test="${empty compList}">
    <p>제제 이력이 없습니다.</p>
</c:if></td>
</tr>
<c:forEach items="${compList}" var="comp">
								<tr>
								<td>${comp.loginLock_id}</td>
								<td>로그인 금지</td>
								<td>${comp.loginLock_sDate}</td>
								<td>${comp.loginLock_eDate}</td>
								<td>${comp.comp_handleContent}</td>
								</tr>
							</c:forEach>


</table>


</body>

<script>

function getCompType(compType_code) {
    if (compType_code === "1") {
        return "1(불법)";
    } else if (compType_code === "2") {
        return "2(음란물)";
    } else if (compType_code === "3") {
        return "3(불법정보)";
    } else if (compType_code === "4") {
        return "4(청소년 유해)";
    } else if (compType_code === "5") {
        return "5(욕설/혐오)";
    } else if (compType_code === "6") {
        return "6(정보/노출)";
    } else if (compType_code === "7") {
        return "7(불쾌한 표현)";
    } else {
        return "알 수 없음";
    }
}

function getCompLoc(comp_loc) {
    if (comp_loc === "1") {
        return "게시글";
    } else if (comp_loc === "2") {
        return "댓글";
    } else if (comp_loc === "3") {
        return "채팅방";
    } else {
        return "알 수 없음";
    }
}

// JavaScript에서 JSP 변수를 사용
var compTypeCode = "${cpd.compType_code}";
var compLoc = "${cpd.comp_loc}"

// compTypeCode 값을 getCompType 함수로 변환
var compTypeValue = getCompType(compTypeCode);
var compLocValue = getCompLoc(compLoc);

// 변환된 값을 HTML 엘리먼트에 적용
document.getElementById("compTypeValue").textContent = compTypeValue;
document.getElementById("compLocValue").textContent = compLocValue;

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