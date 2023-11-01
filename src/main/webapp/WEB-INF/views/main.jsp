<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<input type="button" onclick="location.href='./myPageList.do'" value="마이페이지" />
<input type="button" onclick="location.href='./chattingList.go'" value="채팅방" />
<input type="button" onclick="location.href='./HomeMatchingList.do'" value="홈으로" />
<input type="button" onclick="location.href='./myProfileList.do'" value="마이프로필리스트" />
<input type="button" onclick="location.href='./showChar'" value="성향팝업" />
<input type="button" onclick="location.href='./regProfile'" value="마이프로필" />

<%-- <c:url value='/resources/img/no_image.png'/> --%>

</body>
<script></script>
</html>