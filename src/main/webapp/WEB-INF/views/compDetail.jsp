
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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



.card {
  width: 70%;
  display: grid;
}

.row1,.row2,.row3,.row4,.row5 {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  border: 1px solid black;
}

.row6 {
   display: grid;
  grid-template-columns: repeat(6, 1fr);
border: 1px solid black;
}
.row7 {
   display: grid;
  grid-template-columns: repeat(2, 1fr);
border: 1px solid black;
}
.row8 {
   display: grid;
  grid-template-columns: repeat(2, 1fr);
border: 1px solid black;
}
.row9 {
   display: grid;
  grid-template-columns: repeat(2, 1fr);
 border: 1px solid black;
}
.row10 {
   display: grid;
  grid-template-columns: repeat(1, 1fr);
border: 1px solid black;
}
 input[name="comp_handleContent"]{
 height: 200px;
}

p{
border-right: 1px solid black;
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
	
	
	
      <form action="backCompList">
	<div class = backbutton>
	<button><</button> 신고 상세보기
	</form>
	</div>
	<form class="card" action="proRegist.do" method="post"
		id="compForm">
		<input type="hidden" name="comp_idx" value="${cpd.comp_idx}">
		<div class="row1">
			<p>신고번호</p>
			<p>${cpd.comp_idx}</p>
			<p>신고코드</p>
			<p id="compTypeValue">${cpd.compType_code}</p>
		</div>
		<div class="row2">
			<p>신고분류</p>
			<p id ="compLocValue">${cpd.comp_loc}</p>
			<p>게시물번호</p>
			<p>${cpd.comp_idfNum}</p>

		</div>
		<div class="row3">
			<p>신고자ID</p>
			<p>${mem}</p>
			<p>피신고자ID</p>
			<p>${pem}</p>
		</div>
		<div class="row4">
			<p>신고처리상태</p>
			<p><select name="comp_handleState">
				<option value="미처리">미처리</option>
				<option value="처리중">처리중</option>
				<option value="처리완료">처리완료</option>
			</select></p>
			<p>블라인드여부</p>
			<p>
				<select name="comp_blindStete">
					<option value="N">N</option>
					<option value="Y">Y</option>
				</select>
			</p>
		</div>
		<div class="row5">
			<p>신고일자</p>
			<p>${cpd.comp_receiveDate}</p>
			<p>처리일자</p>
			<p>${cpd.comp_handleDate}</p>
		</div>
		<div class="row6">
			<p>로그인 제한 여부</p>
			<p><select name="member_loginLock">
				<option value="N">N</option>
				<option value="Y">Y</option>
			</select></p>
			<p>로그인 제한 시작일</p>
			<p>
				<input type="date" id="loginLock_sDate" name="loginLock_sDate">
			</p>
			<p>로그인 제한 종료일</p>
			<p>
				<input type="date" id="loginLock_eDate" name="loginLock_eDate">
			</p>
		</div>
		<div class="row7">
			<p>신고사유</p>
			<p>신고사진</p>
		</div>
		<div class="row8">
			<p>${cpd.comp_content}</p>
			<p>${cpd.photo_fileName}</p>
		</div>
		<div class="row9">
			<p>관리자</p>
			<p>${cpd.member_id}</p>
		</div>
		<div class="row10">
		<input name="comp_handleContent" type="text" placeholder="관리자 코맨트"/>
		</div>
		<div class="buttons">
			<button>처리 등록하기</button>
			
		</div>
	</form>
	<div class="row11">
		<p>신고 처리 히스토리</p>
		</div>
		<c:if test="${not empty cpd.comp_handleDate}">
    <div class="row12" style="overflow:scroll; width:70%; height:150px;">
        (가장최근에 처리한 히스토리 내용입니다.)<br>
        신고번호:${cpd.comp_idx}/신고코드:${cpd.compType_code}/신고분류:
        ${cpd.comp_loc}/게시물번호:${cpd.comp_idfNum}/신고자 ID:${mem}/
        피신고자 ID:${pem}/로그인 제제여부:${his.member_loginLock}/로그인 제한 시작일:${his.loginLock_sDate}/
        로그인 제한 종료일:${his.loginLock_eDate},관리자코멘트:${his.comp_handleContent}
    </div>
</c:if>

	
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

document.addEventListener("DOMContentLoaded", function() {
    // DOM이 완전히 로드된 후 실행되도록 변경

    // JavaScript에서 JSP 변수를 사용
    var compTypeCode = "${cpd.compType_code}";
    var compLoc = "${cpd.comp_loc}";

    // compTypeCode 값을 getCompType 함수로 변환
    var compTypeValue = getCompType(compTypeCode);
    var compLocValue = getCompLoc(compLoc);

    // 변환된 값을 HTML 엘리먼트에 적용
    document.getElementById("compTypeValue").textContent = compTypeValue;
    document.getElementById("compLocValue").textContent = compLocValue;

    // 처리 등록하기 버튼 클릭 시 이벤트 핸들러
    document.querySelector('.buttons button').addEventListener('click', function(event) {
        // 관리자 코멘트 값 가져오기
        var compHandleContent = document.querySelector('input[name="comp_handleContent"]').value.trim();

        // 값이 비어있을 경우 alert 띄우고 이벤트 취소
        if (compHandleContent === "") {
            alert("관리자 코멘트를 입력해주세요.");
            event.preventDefault(); // 이벤트 취소
        }
    });
});

</script>

</html>