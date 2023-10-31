<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
</head>
<body>
	<form action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="idx" value="${board.board_id}"/>
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="board_subject" value="${board.board_subject}"/></td>
		</tr>
		<!-- 
		<tr>
			<th>작성자</th>
			<td><input type="text" name="member_nickName" value="${member.nickName}" readonly="readonly"/></td>
		</tr>
		 -->
		<tr>
			<th>내용</th>
			<td><textarea name="content">${board.board_content}</textarea></td>
		</tr>
		<tr>
			<th>사진</th>
			<td><input type="file" name="photos" multiple="multiple"/></td>
		</tr>
		<tr>
		<c:if test="${photos.size()>0}">
			<tr>
				<th>사진</th>
				<td>
				<c:forEach items="${photos}" var="photo">
					<img src="/photo/${photo.photo_fileName}" width="500" alt="${photo.photo_fileName}"/>
				</c:forEach>
				</td>
			</tr>
		</c:if>
			<th colspan="2">
				<input type="button" onclick="location.href='./board'" value="리스트"/>
				<input type="submit" value="수정"/>
			</th>
		</tr>
	</table>
	</form>
</body>
<script></script>
</html>