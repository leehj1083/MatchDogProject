
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>

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
      <form action="backCompList">
	<div class = backbutton>
	<button><</button> 신고 상세보기
	</form>
	</div>
	<form class="card" action="proRegist.do" method="post"
		id="compForm">
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
		<div class = "row12"style="overflow:scroll; width:70%; height:150px;">
		<p></p>
		</div>

	
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


</script>

</html>