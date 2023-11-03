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
	<button onclick="location.href='writeForm'">글쓰기</button>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
		</tr>
		<c:if test="${list.size() == 0}">
			<tr><th colspan="4">등록된 게시물이 없습니다.</th></tr>
		</c:if>
		<c:forEach items="${list}" var="bbs">
			<tr>
				<td>${bbs.idx}</td>
				<td><a href="detail?idx=${bbs.idx}">${bbs.subject}</a></td>
				<td>${bbs.user_name}</td>
				<td>${bbs.bHit}</td>
			</tr>
		</c:forEach>
	</table>
</body>
<script></script>
</html>