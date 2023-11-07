<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<<<<<<< HEAD


<style>
table {
border: 2px solid black;
}
tr {
border: 1px solid black;
 }




</style>
</head>
<body>
 <table>
 <tr>
 <td>${mms.member_dongAddr}</td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
 </tr>
 
 <tr>
 <td>&nbsp;</td>
 <td><img src="/photo/img1.jpg" width="200px" height="200px"></td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
 </tr>
 
 <tr>
 <td>${pps.pro_dogName}</td>
 <td>${pps.breedType}</td>
 <td>&nbsp;</td>
  <td>
    <c:choose>
        <c:when test="${pps.pro_dogScore >= 10}">
            매너견 입니다
        </c:when>
        <c:when test="${pps.pro_dogScore >= 0}">
            평범한 강아지
        </c:when>
        <c:otherwise>
            비매너견 입니다
        </c:otherwise>
    </c:choose>
</td>
 </tr>
 
 <tr>
 <td>${pps.pro_dogAge}</td>
 <td>/${pps.pro_dogGender}</td>
 <td>&nbsp;</td>
 <td>${pps.pro_dogScore}</td>	
 </tr>
 
  <tr>
 
 <td>강아지 성향</td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
 </tr>
 
 <tr>

 <c:forEach items="${list}" var="myChar">
								<td>
									${myChar.charType}
								</td>
							</c:forEach>
 </tr>
 
 <tr>
 <td colspan="4">--------------------------------------------------------</td>
 </tr>
 
<tr>
<td>견주 닉네임</td>
<td>${mms.member_nickName}</td>
<td>&nbsp;</td>
<td>${mms.member_gender}</td>
</tr>

<tr>
<td>소개글</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>

<tr>
<td>&nbsp;</td>
<td>${pps.pro_dogDesc}</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>








=======
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
		
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		font-size: 15px;
		width : auto;
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
	            <li><a href="./compList.go">신고관리</a></li><br><hr/>	            
	            <li><a href="./home.go">서비스 페이지</a></li>
	        </ul>
	    </div>
		<div class="content">
			<form action="memberDetail" method="get">
			<h3>회원상세보기</h3><hr/>
			<table>
				<tr>
					<th>회원번호</th>
					<td>${dto.member_idx}</td>
					<th>아이디</th>
					<td>${dto.member_id}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${dto.member_name}</td>
					<th>닉네임</th>
					<td>${dto.member_nickName}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${dto.member_email}</td>
					<th>전화번호</th>
					<td>${dto.member_phone}</td>
				</tr>
				<tr>
					<th>지번주소</th>
					<td>${dto.member_parcelAddr}</td>
					<th>도로명주소</th>
					<td>${dto.member_roadAddr}</td>
				</tr>
				<tr>
					<th>동주소</th>
					<td>${dto.member_dongAddr}</td>
					<th>생년월일</th>
					<td>${dto.member_birth}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${dto.member_gender}</td>
					<th>가입일</th>
					<td>${dto.member_regDate}</td>
				</tr>
				<tr>
					<th>구독여부</th>
					<td>${dto.member_subs}</td>
					<th>구독연장여부</th>
					<td>${dto.member_renew}</td>
				</tr>
				<tr>
					<th>구독시작일자</th>
					<td>${dto.subsHistory_start}</td>
					<th>구독만료일자</th>
					<td>${dto.subsHistory_exp}</td>
				</tr>
				<tr>
					<th>구독등급</th>
					<td>${dto.subsType_code}</td>
					<th>탈퇴여부</th>
					<td>${dto.member_quit}</td>
				</tr>
				<tr>
					<th>제재여부</th>
					<td>${dto.member_loginLock}</td>
					<th>권한</th>
					<td>${dto.subsType_code}</td>
				</tr>	
				<tr>
					<th colspan="4">
						<input type="button" onclick="location.href='./memberList.go'" value="회원목록으로"/>
						<input type="button" onclick="location.href='./subsHistory.go?member_idx=${dto.member_idx}'" value="구독이력보기"/>
						<input type="button" onclick="location.href='./updateForm?board_idx=${dto.member_idx}'" value="제재이력보기"/>
						<input type="submit" onclick="location.href='./updateForm?board_idx=${dto.member_idx}'" value="저장하기"/>
					</th>	
				</tr>
			</table>			
			</form>
		</div>
	</div>	
>>>>>>> origin/master
</body>
<script>

</script>
</html>