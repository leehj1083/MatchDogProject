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



<form action="writemyProfile" method="post">
   <input type="file" name="photos" multiple="multiple" value="사진 선택">    
    <table>
        <tr>
            <th>내 강아지 이름</th>
            <th>${myProfile.pro_dogName}</th>
        </tr>
        
        <tr>
            <th>내 강아지 견종</th>
            <td>${myProfile.breedType}</td>
        </tr>
        
        <tr>
            <th>내 강아지 나이</th>
            <td>${myProfile.pro_dogAge}</td>
        </tr>
        
        <tr>
            <th>내 강아지 성별</th>
            <td>${myProfile.pro_dogGender}</td>
        </tr>
        <tr>
		<th>내 강아지 성향</th>
		<td>${myProfile.charType}</td>
	</tr>
	<tr>
	<th>내 강아지 소개 : </th>
	<td><textarea name="pro_dogDesc" spellcheck = "false">
	</textarea></td>
	<tr>
		<th>내 강아지 상태</th>
		<td>${myProfile.pro_dogScore}</td>
	</tr>
    </table>
    <br></br>
	<input type="button" onclick="location.href='./myProfileMod.go'" value="수정하기"/>
	<br></br>
</form>

</body>
<script>

    </script>
</html>