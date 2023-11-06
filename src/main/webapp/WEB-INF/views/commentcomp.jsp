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
	<form action="commentcompSave.do" method="post" id="myForm">

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
<td colspan="3"><textarea name="comp_content" spellcheck="false">내용을입력해주세요</textarea></td>
</tr>

<tr>
<td>사진 첨부</td>
<td>&nbsp;</td>
<td><input type="file" id="compFile" name="photo"></td>
</tr>
</table>





<input type="hidden" id="compType_code" name="compType_code" value="">
	<button id="reportButton">신고하기</button>


	</form>

</body>

<script>
document.addEventListener("DOMContentLoaded", function () {
    var checkboxes = document.querySelectorAll("input[type='checkbox']");
    
    checkboxes.forEach(function (checkbox) {
        checkbox.addEventListener("click", function () {
        	document.getElementById("compType_code").value = checkbox.value;
        	// 다른 체크박스들을 모두 선택 해제합니다.
            checkboxes.forEach(function (otherCheckbox) {
                if (otherCheckbox !== checkbox) {
                    otherCheckbox.checked = false;
                }
            });
        });
    });
    var reportButton = document.getElementById("reportButton");

    reportButton.addEventListener("click", function () {
        var confirmation = confirm("정말 신고하시겠습니까?");
        
        if (confirmation) {
            // 여기에 확인을 눌렀을 때 Controller로 요청을 보내는 코드를 추가합니다.
            document.getElementById("myForm").submit();
        } else {
            alert("신고가 취소되었습니다.");
            event.preventDefault();
        }
    });
});
</script>
</html>