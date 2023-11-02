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
        .switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
  vertical-align:middle;
}

/* Hide default HTML checkbox */
.switch input {display:none;}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}

p {
	margin:0px;
	display:inline-block;
	font-size:15px;
	font-weight:bold;
}
    </style>
</head>
<body>

	<a href="logout">로그아웃</a>
	<br></br>

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
   <br></br>

<c:forEach items="${myProfile}" var="Profile">
	
	<!-- style="display: none" -->
<form action="pro_idx.do">
	<input type="text"  name="pro_idx" value="${Profile.pro_idx}"/>
</form>

	<form action="myProfileMod.go" method="post">
 <!--   <input type="file" name="photos" multiple="multiple" value="사진 선택">     -->
    <h3>${Profile.pro_dogName} 프로필</h3>
    <table>
   		<tr>
            <th>사진</th>
            <th>${Profile.photo_fileNameList}</th>
        </tr>
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
            <td><label class="switch"> <input type="checkbox">
							<span class="slider round"></span>
					</label>
						<p>ON</p>
						<p style="display: none;">OFF</p>
						<!--             <button type="button" id="toggleButton" value="Y">ON</button>
            <button type="button" id="toggleButton" value="N">OFF</button> -->
        	</td>
        </tr>
        
        <tr>
            <th>내 강아지 성별</th>
            <td>${Profile.pro_dogGender}</td>
        </tr>
        <tr>
		<th>내 강아지 성향</th>
		<td>${Profile.charTypeList}</td>
<%-- 		<td>
		<c:forEach items="${charType}" var="charType">
		${charType.charType}
		</c:forEach></td> --%>
	</tr>
	<tr>
	<th>내 강아지 소개 : </th>
	<td><textarea name="pro_dogDesc" spellcheck = "false">${Profile.pro_dogDesc}</textarea></td>
	<tr>
		<th>내 강아지 상태</th>
		<td>
		
		<c:if test="${Profile.pro_dogScore >= 10}">
			<td> 매너견이에요!</td>
		</c:if>
		<c:if test="${Profile.pro_dogScore > 0 && Profile.pro_dogScore < 10}">
			<td> 매너견이 되어보세요!</td>
		</c:if>
		<c:if test="${Profile.pro_dogScore < 0}">
			<td> 비매너견이에요ㅜㅜ</td>
		</c:if>
		
		</td>
		
	</tr>
    </table>
    <br></br>
	<input type="submit" id="myProfileMod" value="수정하기"/>
	<br></br>
</form>
</c:forEach>


</body>
<script>
var check = $("input[type='checkbox']");
check.click(function(){
	$("p").toggle();
});

$('#myProfileMod').on('click',function(){
	location.href='./myProfileMod.go';
});

$('#toggleButton').on('click',function(){
	location.href='./myPageList.do';
});
    </script>
</html>