<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>


<style>
tr {
border: 1px solid black;
 }
#image {
  width: 200px; /* 이미지 너비 조정 */
  height: 200px; /* 이미지 높이 조정 */
}
.image-container {
  position: relative;
  display: inline-block; /* 이미지와 텍스트를 동일한 줄에 표시 */
 	width: 200px;
 	height: 200px;
}

.text-overlay {
  position: absolute;
  top: 10px; /* 텍스트의 상단 여백 */
  left: 10px; /* 텍스트의 왼쪽 여백 */
  background-color: rgba(255, 255, 255, 0.5); /* 텍스트 배경색 및 투명도 조절 */
  color: black; /* 텍스트 색상 조절 */
  padding: 5px; /* 텍스트 주위에 여백 추가 (선택 사항) */
}




</style>
</head>
<body>
<div class="image-container">
  <img id="image" src="/photo/${pho.photo_fileName}" alt="/photo/${pho.photo_fileName}">
  <div class="text-overlay">${map.member_dongAddr}</div>
</div>
<table>
<tr >
	<td >${map.pro_dogName}</td>
	<td >${map.breedType}</td>
</tr>
<tr>
	<td>${map.pro_dogAge}살</td>
	<td>${map.pro_dogGender}</td>
</tr>
<tr>
	<td>강아지 성향</td>
</tr>
<tr>
	<td> 성향들...</td>
</tr>	
<tr>
	<td>견주 닉네임&nbsp&nbsp&nbsp${map.member_nickName}</td>
</tr>
<tr>
	<td>소개글</td>
</tr>
<tr>
	<td>${map.pro_dogDesc}</td>
</tr>
</table>

		<%-- <div id="id"><img id="photo" src="/photo/${pho.photo_fileName}" wi class="text">${map.member_dongAddr}</span></div> --%>
 <%-- <table>
 <tr>
 <td>${mms.member_dongAddr}</td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
 </tr>
 
 <tr>
  <c:forEach items="${list2}" var="pho">
<td><img src="/photo/${pho.photo_fileName}" width="200px" height="200px"></td>
<td><p>${pho.photo_fileName}</p></td>
 </c:forEach>
 <td><img src="/photo/img1.jpg" width="200px" height="200px"></td>
 </tr>
 
 <tr>
 <td>${pps.pro_dogName}</td>
 <td>${pps.breedType}</td>
 <td>&nbsp;</td>
  <td>
    <c:choose>
        <c:when test="${pps.pro_dogScore >= 10}">
            매너견 입니다
        </c:when>
        <c:when test="${pps.pro_dogScore >= 0}">
            평범한 강아지
        </c:when>
        <c:otherwise>
            비매너견 입니다
        </c:otherwise>
    </c:choose>
</td>
 </tr>
 
 <tr>
 <td>${pps.pro_dogAge}</td>
 <td>/${pps.pro_dogGender}</td>
 <td>&nbsp;</td>
 <td>${pps.pro_dogScore}</td>	
 </tr>
 
  <tr>
 
 <td>강아지 성향</td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
 </tr>
 
 <tr>

 <c:forEach items="${list}" var="myChar">
								<td>
									${myChar.charType}
								</td>
							</c:forEach>
 </tr>
 
 <tr>
 <td colspan="4">--------------------------------------------------------</td>
 </tr>
 
<tr>
<td>견주 닉네임</td>
<td>${mms.member_nickName}</td>
<td>&nbsp;</td>
<td>${mms.member_gender}</td>
</tr>

<tr>
<td>소개글</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>

<tr>
<td>&nbsp;</td>
<td>${pps.pro_dogDesc}</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>

</table> --%>
</body>
<script>

</script>
</html>