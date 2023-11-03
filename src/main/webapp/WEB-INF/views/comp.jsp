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
	<form action="compSave.do" method="post" id="myForm">

		<h1>신고하기</h1>
	
<table>
<tr>
<td>사유선택</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<c:forEach items="${compList}" var="myComp">
<tr>
<td colspan="3"><input type="checkbox" value="${myComp.compType_code}" />
    ${myComp.compType}</td>
</tr>
</c:forEach>
</table>
<table>
<tr>
<td>신고사유(자세히)</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>

<tr>
<td colspan="3"><textarea name="compReason" spellcheck="false">내용을입력해주세요</textarea></td>
</tr>

<tr>
<td>사진 첨부</td>
<td>&nbsp;</td>
<td><input type="file" id="compFile" name="photo"></td>
</tr>
</table>



<button>신고하기</button>





	</form>
</body>

<script>
document.addEventListener("DOMContentLoaded", function () {
    var checkboxes = document.querySelectorAll("input[type='checkbox']");
    
    checkboxes.forEach(function (checkbox) {
        checkbox.addEventListener("click", function () {
            // 다른 체크박스들을 모두 선택 해제합니다.
            checkboxes.forEach(function (otherCheckbox) {
                if (otherCheckbox !== checkbox) {
                    otherCheckbox.checked = false;
                }
            });
        });
    });
});
</script>
</html>