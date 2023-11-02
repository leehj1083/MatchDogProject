<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h3>${myPage.member_name} 님의 마이페이지</h3>
	<a href="logout">로그아웃</a>
	<br></br>
	<a href="myPage">회원정보</a>
	<br></br>
	<a href="myProfile">프로필</a>
	<br></br>
	<a href="myPageMod">수정하기</a>
	<br></br>
 	<br></br>
 	<form action="myPageModUpdate.do" method="post">
	 	<table>	
 		<tr>
 			<th>이름</th>
 			<td><input type="text" name="member_name" readonly="readonly" value="${myPage.member_name}"/></td>
 		</tr>
 		<tr>
 			<th>아이디</th>
 			<td><input type="text" name="member_id" readonly="readonly" value="${myPage.member_id}"/></td>
 		</tr>
 		<tr>
 			<th>닉네임</th>
 			<td>
 			<input type="text" name="member_nickName"  placeholder="${myPage.member_nickName}"/>
     		 <input type="button" id="overlayNick" value="중복확인"/>
      <p/><span class="nickChk"></span>
     <p/><span class="noticeNick" style="font-size : 8pt"> ※ 닉네임은 2자 이상 8자 이하로 입력해주세요</span>
     </td>
 		</tr>
 		<tr>
 			<th>성별</th>
 			<td><input type="text" name="member_gender" readonly="readonly" value="${myPage.member_gender}"/></td>
 		</tr>
 		<tr>
 			<th>비밀번호</th>
 			<td><input type="text" name="member_pw" placeholder="비밀번호를 입력하세요" value="${myPage.member_pw}"/></td>
 		</tr>
 		<tr>
 			<th>비밀번호 확인</th>
 			<td><input type="text" name="member_pwReChk" placeholder="비밀번호를 한번 더 입력하세요" value="${myPage.member_pw}"/></td>
 		</tr>
 		<tr>
 			<th>이메일</th>
 			<td>
 			<input type="text" id="usermail" name="member_email" placeholder="이메일 주소를 입력하세요" value="${myPage.member_email}"/>@
	  <select name="emailhost" id="mailhost">
			<option value="naver">naver.com</option>	
			<option value="google">gmail.com</option>
			<option value="daum">daum.net</option>
			<option value="nate">nate.com</option>
	  </select>
 			</td>
 		</tr>
 		<tr>
 			<th>전화번호</th>
 			<td><input type="text" name="member_phone" placeholder="핸드폰번호 입력하세요" value="${myPage.member_phone}"/></td>
 		</tr>
 		<tr>
 			<th>주소<input type="text" id="postcode" placeholder="우편번호">
	  <input type="button" id="findpostcode" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
	  <input type="text" id="roadAddress"  name = member_roadAddr placeholder="도로명주소" value="${myPage.member_roadAddr}"><br/>
	  <input type="text" id="jibunAddress" name = member_parcelAddr placeholder="지번주소" value="${myPage.member_parcelAddr}"><br/>
	  <span id="guide" style="color:#999;display:none"></span><br/>
	  <input type="text" id="detailAddress" name = member_detailAddr placeholder="상세주소" value="${myPage.member_detailAddr}">		  
	  <input type="text" id="member_dongAddr" placeholder="참고항목" value="${myPage.member_dongAddr}">               
	  </th>
 		</tr>
 		</table>
 		 	<br></br>
 		<input type="button" onclick="location.href='./myPageList.do'" value="수정 취소"/>
 		<input type="submit" value="수정 완료"/>
 		 </form>
 	<br></br>
 	<br></br>


</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("postcode").value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("extraAddress").value = '';
            }
            
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }

    }).open();
}


var overlayNickChk = false;
$('#overlayNick').on('click',function(){
	var $nickName = $('input[name="member_nickName"]');
	console.log('member_nickName='+$nickName);

	$.ajax({
		type : 'post',
		url : 'overlayNick',
		data : {'member_nickName':$nickName.val()},
		dataType : 'JSON',
		success : function(data){
			console.log(data);
			myPageModNickOveraly = data.use;
			if(data.use){
				$('.nickChk').text("사용 가능한 닉네임 입니다.");
				$('.nickChk').css("color", "green");
				$('.nickChk').css("font-size", "10px");
				
			}else{
				$('.nickChk').text("이미 사용중인 닉네임 입니다.");
				$('.nickChk').css("color", "red");
				$('.nickChk').css("font-size", "10px");
				$nickName.val('');
			}
		},
		error : function(e){
			console.log(e);
		}		
	});	
});

</script>

<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>



</html>