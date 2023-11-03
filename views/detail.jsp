<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
</head>
<body>
	<table>
		<tr>
			<th>제목</th>
			<td>${bbs.subject}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${bbs.bHit}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${bbs.user_name}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${bbs.content}</td>
		</tr>
		<c:if test="${photos.size() >0}">
		<tr>
			<th>사진</th>
			<td>
			<c:forEach items="${photos}" var="photo">
				<img src="/photo/${photo.newFileName}" width="500" alt="${photo.oriFileName}"/>
			</c:forEach>			
			</td>
		</tr>
		</c:if>
		<tr>
			<th colspan="2">
				<input type="button" onclick="location.href='./list'" value="리스트"/>
				<input type="button" onclick="location.href='./del?idx=${bbs.idx}'" value="삭제"/>
				<input type="button" onclick="location.href='./updateForm?idx=${bbs.idx}'" value="수정"/>
			</th>
		</tr>
	</table>	
</body>
<script></script>
</html>