<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
table,td{
border: 1px solid black;
}

</style>
</head>
<body>

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


</script>
</html>