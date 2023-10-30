<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	.inputForm{
		width:600px;
		height:1000px;
		margin: 0 auto;
	}
</style>
</head>
<body>
	<div class="container">
		<a href="./home.go"><img src="./resources/img/maticon.PNG" src="매칭해주개메인" /></a>
	</div>
	
	<div class="inputForm">
     <h2>회원가입</h2>
     <p/>회원가입에 필요한 기본 정보를 입력해주세요<br/>
     
     <p/>아이디<br/>  
     <input type="text" name="id"/>
     <input type="button" id="overlayId" value="중복확인"/>
     <p/><span class="idChk"></span>
     <p/><span class="noticeId" style="font-size : 8pt"> ※ 아이디는 영문과 숫자를 혼합하여 최대 10자 까지 입력해주세요</span>
    

	  <p/>비밀번호<br/>  
      <input type="password" name="pw"/>
      <p/><span class="pwChk" style="font-size : 8pt"> ※ 비밀번호는 문자와 숫자를 혼합하여 입력해주세요</span>
      <input type="hidden" id="pwValidation"/>
      <p/>비밀번호 확인<br/>
      <input type="password" name="pwCheck"/>
      <p/><span class="pwReChk" style="font-size : 8pt"> ※ 비밀번호를 다시 한 번 입력해주세요</span>
      
      
      <p/>생년월일<br/>   
      <input type="text" name="birth"/>

	  <p/>닉네임<br/>
	  <input type="text" name="nickName"/>
      <input type="button" id="overlayNick" value="중복확인"/>
      <p/><span class="nickChk"></span>
     <p/><span class="noticeNick" style="font-size : 8pt"> ※ 닉네임은 2자 이상 8자 이하로 입력해주세요</span>
         
      <p/>이름<br/>    
	  <input type="text" name="name"/>
	  
	  <p/>전화번호<br/>
      <input type="text" name="phone"/>
         
	  <p/>성별<br/>
      <input type="radio" name="gender" value="남"/>남자
      <input type="radio" name="gender" value="여"/>여자
         
      <p/>주소<input type="text" id="postcode" placeholder="우편번호">
	  <input type="button" id="findpostcode" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
	  <input type="text" id="roadAddress"  name = roadAddr placeholder="도로명주소"><br/>
	  <input type="text" id="jibunAddress" name = parcelAddr placeholder="지번주소"><br/>
	  <span id="guide" style="color:#999;display:none"></span><br/>
	  <input type="text" id="detailAddress" name = detailAddr placeholder="상세주소">		  
	  <input type="text" id="extraAddress" placeholder="참고항목">                  
      
      <p/>이메일   
      <p/><input type="text" id="usermail" name="email" placeholder="메일 주소를 입력 하세요" />@
	  <select name="emailhost" id="mailhost">
			<option value="naver">naver.com</option>	
			<option value="google">gmail.com</option>
			<option value="daum">daum.net</option>
			<option value="nate">nate.com</option>
	  </select>
	  <button type="button" id="identifyMail">인증요청</button>
	  
      <p/>&nbsp인증번호<input type="text" name= "checkNum" placeholder="인증번호를 입력해주세요" maxlength="6"/>
	  <button type="button" id="checkMail">인증하기</button>
            
      <p/><input type="button" id="join" value="회원가입"/>
             
     </div>
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
</script>
<script>
var overlayIdChk = false;
var overlayNickChk = false;


$('#overlayId').on('click',function(){
	var $id = $('input[name="id"]');
	console.log('id='+$id);

	$.ajax({
		type : 'post',
		url : 'overlayId',
		data : {'id':$id.val()},
		dataType : 'JSON',
		success : function(data){
			console.log(data);
			overlayIdChk = data.use;
			if(data.use){
				$('.idChk').text("사용 가능한 아이디 입니다.");
				$('.idChk').css("color", "green");
				$('.idChk').css("font-size", "10px");
			}else{
				$('.idChk').text("이미 사용중인 아이디 입니다.");
				$('.idChk').css("color", "red");
				$('.idChk').css("font-size", "10px");
				$id.val('');
			}
		},
		error : function(e){
			console.log(e);
		}		
	});	
});

$('#overlayNick').on('click',function(){
	var $nickName = $('input[name="nickName"]');
	console.log('nickName='+$nickName);

	$.ajax({
		type : 'post',
		url : 'overlayNick',
		data : {'nickName':$nickName.val()},
		dataType : 'JSON',
		success : function(data){
			console.log(data);
			overlayNickChk = data.use;
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

$('#join').on('click',function(){
	var $id=$('input[name="id"]');
	var $pw=$('input[name="pw"]');
	var $birth=$('input[name="birth"]');
	var $nickName=$('input[name="nickName"]');
	var $name=$('input[name="name"]');
	var $phone=$('input[name="phone"]');	
	var $gender=$('input[name="gender"]:checked');
	var $roadAddr=$('input[name="roadAddr"]');
	var $parcelAddr=$('input[name="parcelAddr"]');
	var $detailAddr=$('input[name="detailAddr"]');
	var $email=$('input[name="email"]').val()+"@"+$('select[name="emailhost"]').val();
	
	if(overlayChk){
		if($id.val()==''){
			alert('아이디를 입력해 주세요');
			$id.focus();
		}else if($pw.val()==''){
			alert('비밀번호를 입력해 주세요');
			$pw.focus();
		}else if($name.val()==''){
			alert('이름을 입력해 주세요');
			$name.focus();
		}else if($age.val()==''){
			alert('나이를 입력해 주세요');
			$age.focus();
		}else if($gender.val()==null){
			alert('성별을 선택해 주세요');
		}else if($email.val()==''){
			alert('이메일을 입력해 주세요');
			$email.focus();
		}else{
			var param = {};
			param.id=$id.val();
			param.pw=$pw.val();
			param.name=$name.val();
			
			var regex = new RegExp('[a-zA-Zㄱ-ㅎ가-힣]');
			var match = regex.test($age.val());  // 패턴이 일치하면 true, 아니면 false
			console.log("match : "+match);
			if(match){  // match=true인 경우(문자가 들어간 경우)
				alert('숫자만 넣어 주세요');
				return false;  // 실행않고 밖으로 빠져나가 버림
			}			
			param.age=$age.val();				
			param.gender=$gender.val();
			param.email=$email.val();			
			if($auth.val() != null){
				param.auth=$auth.val();				
			}
			console.log(param);
			
			$.ajax({
				type : 'post',
				url : 'join',
				data : param,
				dataType : 'JSON',
				success : function(data){
					console.log(data);
					if(data.success>0){
						alert('회원가입에 성공했습니다.');
						location.href='./';
					}else{
						alert('회원가입에 실패했습니다.');
					}
				},
				error : function(e){
					console.log(e);
				}				
			});			
		}		
	}else{
		alert('아이디 중복 체크를 해주세요.');
	}	
});

</script>
</html>