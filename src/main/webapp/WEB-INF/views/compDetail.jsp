
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>

<form action="proRegist.do" method="post" id="compForm">
<table>

<tr>
<td>신고번호</td>
<td>1234</td>
<td>신고코드</td>
<td>2(욕설)</td>
</tr>

<tr>
<td>신고분류</td>
<td>댓글</td>
<td>게시물번호</td>
<td>1234</td>
</tr>

<tr>
<td>신고자ID</td>
<td>semi</td>
<td>피신고자ID</td>
<td>semi2</td>
</tr>

<tr>
<td>신고처리상태</td>
<td><select name ="situation">
<option value = "미처리">미처리</option>
<option value = "처리중">처리중</option>
<option value = "처리완료">처리완료</option>
</select></td>
<td>블라인드여부</td>
<td><select name ="blind">
<option value = "N">N</option>
<option value = "Y">Y</option>
</select></td>
</tr>

<tr>
<td>신고자ID</td>
<td>semi</td>
<td>피신고자ID</td>
<td>semi2</td>
</tr>

</table>
</form>
</body>
</html>