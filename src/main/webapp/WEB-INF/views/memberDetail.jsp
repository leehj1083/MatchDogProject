<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>


<style>
table {
border: 2px solid black;
}
tr {
border: 1px solid black;
 }




</style>
</head>
<body>
 <table>
 <tr>
 <td>${mms.member_dongAddr}</td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
 </tr>
 
 <tr>
 <td>&nbsp;</td>
 <td><img src="/photo/img1.jpg" width="200px" height="200px"></td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
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








</body>
</html>