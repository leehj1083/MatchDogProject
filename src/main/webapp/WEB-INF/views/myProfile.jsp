<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <style>

<textarea style="resize: both;"></textarea>
        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.7);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 70%;
        }

        /* 닫기 버튼 스타일 */
        .close {
            color: #888;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
	<c:if test="${myProfile.size() <= 1 }">
		<input type="button" onclick="location.href='./regProfile.go'" value="+" />
	</c:if>
	<c:if test="${myProfile.size() == 2 }">
		<input type="button" onclick="location.href='./regProfile.go'" value="+" />
		<input type="button" onclick="location.href='./myProfileDel.do?idx=${Profile.pro_idx}'" value="-" />
	</c:if>
	<c:if test="${myProfile.size() >= 3}">
		<input type="button" onclick="location.href='./myProfileDel.do?idx=${Profile.pro_idx}'" value="-" />
	</c:if>

<c:forEach items="${myProfile}" var="Profile">
	
	<!-- style="display: none" -->
<form action="pro_idx.do">
	<input type="text"  name="pro_idx" value="${Profile.pro_idx}"/>
</form>

	<form action="myProfileMod.go" method="post">
   <input type="file" name="photos" multiple="multiple" value="사진 선택">    
    
    <table>
        <tr>
            <th>내 강아지 이름</th>
            <th>${Profile.pro_dogName}</th>
        </tr>
        
        <tr>
            <th>내 강아지 견종</th>
            <td>${Profile.breedType}</td>
        </tr>
        
        <tr>
            <th>내 강아지 나이</th>
            <td>${Profile.pro_dogAge}</td>
        </tr>
        
        <tr>
            <th>내 강아지 성별</th>
            <td>${Profile.pro_dogGender}</td>
        </tr>
        <tr>
		<th>내 강아지 성향</th>
		<td>
		<c:forEach items="${charTypeList}" var="charlist">
		${charlist.charType}
		</c:forEach></td>
	</tr>
	<tr>
	<th>내 강아지 소개 : </th>
	<td><textarea name="pro_dogDesc" spellcheck = "false">${Profile.pro_dogDesc}</textarea></td>
	<tr>
		<th>내 강아지 상태</th>
		<td>
		
		<c:if test="${Profile.pro_dogScore >= 10}">
			<p> 매너견이에요!</p>
		</c:if>
		<c:if test="${Profile.pro_dogScore > 0 && Profile.pro_dogScore < 10}">
			<p> 매너견이 되어보세요!</p>
		</c:if>
		<c:if test="${Profile.pro_dogScore < 0}">
			<p> 비매너견이에요ㅜㅜ</p>
		</c:if>
		
		</td>
		
	</tr>
    </table>
    <br></br>
	<input type="button" onclick="location.href='./myProfileMod.go'" value="수정하기"/>
	<br></br>
</form>
</c:forEach>


</body>
<script>

    </script>
</html>