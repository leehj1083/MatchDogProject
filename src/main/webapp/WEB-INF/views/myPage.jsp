<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
 <style></style>
</head>
<body>
	<h3>${myPage.member_name} 님의 마이페이지</h3>
	<a href="logout">로그아웃</a>
	<br></br>
	<a href="myPageList.do">회원정보</a>
	<br></br>
	<a href="myProfileList.do">프로필</a>
	<br></br>
	<input type="button" onclick="location.href='./myPageMod.go'" value="수정하기"/>
	<br></br>
 	<br></br>
	 	<table>	
 		<tr>
 			<th>이름</th>
 			<td>${myPage.member_name}</td>
 		</tr>
 		<tr>
 			<th>아이디</th>
 			<td>${myPage.member_id}</td>
 		</tr>
 		<tr>
 			<th>닉네임</th>
 			<td>${myPage.member_nickName}</td>
 		</tr>
 		<tr>
 			<th>성별</th>
 			<td>${myPage.member_gender}</td>
 		</tr>
 		<tr>
 			<th>비밀번호</th>
 			<td>${myPage.member_pw}</td>
 		</tr>
 		<tr>
 			<th>이메일</th>
 			<td>${myPage.member_email}</td>
 		</tr>
 		<tr>
 			<th>전화번호</th>
 			<td>${myPage.member_phone}</td>
 		</tr>
 		<tr>
 			<th>주소(도로명)</th>
 			<td>${myPage.member_roadAddr}</td>
 		</tr>
 		<tr>
 			<th>주소(지번)</th>
 			<td>${myPage.member_parcelAddr}</td>
 		</tr>
 		<tr>
 			<th>상세주소</th>
 			<td>${myPage.member_detailAddr}</td>
 		</tr>
 		</table>	
 	<br></br>
 	<br></br>
	<table>
 		<tr>
 			<th>구독</th>
 			<td>${myPage.subsType}</td>
 			
 			<c:if test="${myPage.subsType == 'standard'}">
 				<td><input type="button" onclick="location.href='./subs.go'" value="업그레이드"/></td>
				<!-- <td colspan="1">업그레이드</td> -->
			</c:if>
			<c:if test="${myPage.subsType == 'plus'}">
 				<td><input type="button" onclick="location.href='./subs.go'" value="업그레이드"/></td>
 				<td><input type="button" onclick="location.href='./myPageMod.go'" value="구독취소"/></td>
				<!-- <td colspan="1">업그레이드</td> -->
			</c:if>
			<c:if test="${myPage.subsType == 'premium'}">
 				<td><input type="button" onclick="location.href='./myPageMod.go'" value="구독취소"/></td>
				<!-- <td colspan="1">업그레이드</td> -->
			</c:if>
			<c:if test="${myPage.subsType == 'admin'}">
 				<td><button>관리자입니다</button></td>
				<!-- <td colspan="1">업그레이드</td> -->
			</c:if>
 		</tr>
	</table>

</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>