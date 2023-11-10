<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/chattingList.css" type="text/css">
<!-- bootstrap 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
 <style></style>
</head>
<body>
	<table style="text-align: center;">
		<tr>
			<th>${subsType.subsType_code}</th>
			<th>권한 코드</th>
			<th>권한 내용</th>
		</tr>
		<c:forEach items="${authCodeList}" var="authCode">
			<tr>
				<td><input type="checkbox" class="authCheckbox"
					value="${authCode.authType_code}"></td>
				<td>${authCode.authType_code}</td>
				<td>${authCode.authType}</td>
			</tr>
		</c:forEach>
	</table>
	<br></br>
            <div style="text-align: center;">
                <button id="regButton" type="button" >등록 완료</button>
            </div>

</body>
<script>
/* $("#regButton").one('click', function () {
	var selectedValues = [];
    $(".authCheckbox:checked").each(function (e) {
        selectedValues.push($(this).val());
    });
    console.log(selectedValues);
     $.ajax({
        url: "authSave.do",
        type: "POST",
        traditional: true, // 배열 전송을 위한 옵션
        data: { "selectedValues": selectedValues },
        success: function (data) {
            // 저장이 완료된 후, POST 방식으로 ./authDetailMod.go에 요청 보내기
                console.log("페이지 리로드 성공");
        },
        error: function (e) {
            console.log(e);
        }
    });

}); */
</script>
</html>