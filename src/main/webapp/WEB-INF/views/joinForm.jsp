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
     <input type="text" name="member_id"/>
     <input type="button" id="overlayId" value="중복확인"/>
     <p/><span class="idValid" style="font-size : 8pt"> ※ 아이디는 영문, 숫자로 구성하여 4~14자 까지 입력해주세요</span>
     <p/><span class="idChk"></span>
    

	  <p/>비밀번호<br/>  
      <input type="password" name="member_pw"/>
      <p/><span class="pwValid" style="font-size : 8pt"> ※ 비밀번호는 문자와 숫자, 특수문자를 혼합하여 8자 이상 입력해주세요</span>
      <p/>비밀번호 확인<br/>
      <input type="password" name="pwCheck"/>
      <p/><span class="pwReChk" style="font-size : 8pt"> ※ 비밀번호를 다시 한 번 입력해주세요</span>
      
      
      <p/>생년월일<br/>   
      <input type="date" name="member_birth"/>

	  <p/>닉네임<br/>
	  <input type="text" name="member_nickName"/>
      <input type="button" id="overlayNick" value="중복확인"/>      
      <p/><span class="nickValid" style="font-size : 8pt"> ※ 닉네임은 문자와 숫자로 구성하여 2~8자 까지 입력해주세요</span>
      <p/><span class="nickChk"></span> 
         
      <p/>이름<br/>    
	  <input type="text" name="member_name"/>
	  
	  <p/>전화번호<br/>
      <input type="text" name="member_phone"/>
       <p/><span class="phoneValid" style="font-size : 8pt"> ※ 전화번호는 -를 포함하여 입력하여 주십시오</span>
      
         
	  <p/>성별<br/>
      <input type="radio" name="member_gender" value="남"/>남자
      <input type="radio" name="member_gender" value="여"/>여자
         
      <p/>주소<input type="text" id="postcode" placeholder="우편번호">
	  <input type="button" id="findpostcode" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
	  <input type="text" id="roadAddress"  name = member_roadAddr placeholder="도로명주소"><br/>
	  <input type="text" id="jibunAddress" name = member_parcelAddr placeholder="지번주소"><br/>
	  <span id="guide" style="color:#999;display:none"></span><br/>
	  <input type="text" id="detailAddress" name = member_detailAddr placeholder="상세주소">		  
	  <input type="text" id="extraAddress" placeholder="참고항목">                  
      
      <p/>이메일   
      <p/><input type="text" id="usermail" name="member_email" placeholder="메일 주소를 입력 하세요" />@
	  <select name="emailhost" id="mailhost">
			<option value="naver.com">naver.com</option>	
			<option value="gmail.com">gmail.com</option>
			<option value="daum.net">daum.net</option>
			<option value="nate.com">nate.com</option>
	  </select>
	  <button type="button" id="identifyMail">인증요청</button>
	  
      <p/>&nbsp;인증번호<input type="text" name= "checkNum" placeholder="인증번호 6자리를 입력해주세요"  disabled = "disabled" maxlength="6"/>
	  <button type="button" id="checkMail">인증하기</button>
	  <p/><span id="mailChk"></span>
            
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
// ID 중복체크
var overlayIdChk = false;
$('#overlayId').on('click',function(){
	var $id = $('input[name="member_id"]');
	console.log('member_id='+$id);

	$.ajax({
		type : 'post',
		url : 'overlayId',
		data : {'member_id':$id.val()},
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


// 닉네임 중복체크
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


// ID 정규표현식
$('input[name="member_id"]').keyup(function(){
	var getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/);
	if($(this).val()==''){
		$('.idValid').css('color','red');
		$('.idValid').html('아이디는 필수값 입니다.');
	}else if(!getIdCheck.test($(this).val())){
		$('.idValid').css('color','red');
		$('.idValid').html('아이디가 형식에 어긋납니다.');
	}else{
		$('.idValid').css('color','green');
		$('.idValid').html('적합한 아이디 형식입니다.');
	}
});


// PW 정규표현식
$('input[name="member_pw"]').keyup(function(){
	var getPwCheck = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/);
	if($(this).val()==''){
		$('.pwValid').css('color','red');
		$('.pwValid').html('비밀번호는 필수값 입니다.');
	}else if(!getPwCheck.test($(this).val())){
		$('.pwValid').css('color','red');
		$('.pwValid').html('비밀번호가 형식에 어긋납니다.');
	}else{
		$('.pwValid').css('color','green');
		$('.pwValid').html('적합한 비밀번호 형식입니다.');
	}
});


// PW 일치 확인(재입력)
$('input[name="pwCheck"]').keyup(function(){
	if($(this).val()==''){
		$('.pwReChk').css('color','red');
		$('.pwReChk').html('비밀번호를 다시 입력해주세요.');
	}else if($(this).val()==$('input[name="member_pw"]').val()){
		$('.pwReChk').css('color','green');
		$('.pwReChk').html('비밀번호가 일치합니다.');
	}else{
		$('.pwReChk').css('color','red');
		$('.pwReChk').html('비밀번호를 다시 입력해주세요.');
	}	
});


// 닉네임 정규표현식
$('input[name="member_nickName"]').keyup(function(){
	var getNickCheck = RegExp(/^[a-zA-Zㄱ-ㅎ가-힣0-9]{2,8}$/);
	if($(this).val()==''){
		$('.nickValid').css('color','red');
		$('.nickValid').html('닉네임은 필수 입력입니다.');
	}else if(!getNickCheck.test($(this).val())){
		$('.nickValid').css('color','red');
		$('.nickValid').html('닉네임이 형식에 어긋납니다.');
	}else{
		$('.nickValid').css('color','green');
		$('.nickValid').html('적합한 닉네임 형식입니다.');
	}
});

//전화번호 정규표현식
$('input[name="member_phone"]').keyup(function(){
	var getPhoneCheck = RegExp(/^\d{2,3}-\d{3,4}-\d{4}$/);
	if($(this).val()==''){
		$('.phoneValid').css('color','red');
		$('.phoneValid').html('전화번호는 필수 입력입니다.');
	}else if(!getPhoneCheck.test($(this).val())){
		$('.phoneValid').css('color','red');
		$('.phoneValid').html('전화번호가 형식에 어긋납니다.');
	}else{
		$('.phoneValid').css('color','green');
		$('.phoneValid').html('적절한 전화번호 형식입니다.');
	}
});


// 이메일 본인확인
$('#identifyMail').on('click',function(){
	var member_email=$('input[name="member_email"]').val()+"@"+$('select[name="emailhost"]').val();
	console.log('메일주소 : '+member_email);
	var checkInput = $('input[name="checkNum"]');
	
	$.ajax({
		type:'get',
		url : '<c:url value="/mailCheck?member_email="/>'+email,
		success : function(data){
			console.log("data : "+data);
			checkInput.attr('disabled',false);
			code=data;
			alert('인증번호가 전송되었습니다.');
		}		
	});	
	
	$('#checkMail').on('click',function(){
		var inputCode = $('input[name="checkNum"]').val();
		var $resultMsg = $('#mailChk');
		
		if(inputCode == code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#identifyMail').attr('disabled',true);
			$('#usermail').attr('readonly',true);
			$('#mailhost').attr('readonly',true);		
		}else{
			$resultMsg.html('인증번호가 일치하지 않습니다.');
			$resultMsg.css('color','red');
		}
	});
		
});


/*
// 회원가입
$('#join').on('click',function(){
	var $id=$('input[name="member_id"]');
	var $pw=$('input[name="member_pw"]');
	var $birth=$('input[name="member_birth"]');
	var $nickName=$('input[name="member_nickName"]');
	var $name=$('input[name="member_name"]');
	var $phone=$('input[name="member_phone"]');	
	var $gender=$('input[name="member_gender"]:checked');
	var $roadAddr=$('input[name="member_roadAddr"]');
	var $parcelAddr=$('input[name="member_parcelAddr"]');
	var $detailAddr=$('input[name="member_detailAddr"]');
	// 동주소 추출
	var regex = /([가-힣A-Za-z·\d~\-\.]+(동)\s)/i;
	var $dongAddr=$parcelAddr.val().match(regex)[1];
	console.log("동주소 : "+$dongAddr);
	// 이메일 전체 주소 추출
	var $email=$('input[name="email"]').val()+"@"+$('select[name="emailhost"]').val();
	
	var param = {};
	param.member_id=$id.val();
	param.member_pw=$pw.val();
	param.member_birth=$birth.val();
	param.member_nickName=$nickName.val();
	param.member_name=$name.val();			
	param.member_phone=$phone.val();
	param.member_gender=$gender.val();
	param.member_roadAddr=$roadAddr.val();
	param.member_parcelAddr=$parcelAddr.val();
	param.member_detailAddr=$detailAddr.val();
	param.member_dongAddr=$dongAddr;
	param.member_email=$email;	
	
	console.log(param);
	
	$.ajax({
		type : 'post',
		url : 'join.do',
		data : param,
		dataType : 'JSON',
		success : function(data){
			console.log(data);
			if(data.success>0){
				alert('회원가입에 성공했습니다.');
				location.href='./login.go';
			}else{
				alert('회원가입에 실패했습니다.');
			}
		},
		error : function(e){
			console.log(e);
		}				
	});
	
	/* if(overlayChk){
		if($id.val()==''){
			alert('아이디를 입력해 주세요');
			$id.focus();
		}else if($pw.val()==''){
			alert('비밀번호를 입력해 주세요');
			$pw.focus();
		}else if($name.val()==''){
			alert('이름을 입력해 주세요');
			$name.focus();
		}else if($gender.val()==null){
			alert('성별을 선택해 주세요');
		}else if($email.val()==''){
			alert('이메일을 입력해 주세요');
			$email.focus();
		}else if($email.val()==''){
			alert('이메일을 입력해 주세요');
			$email.focus();
		}else if($email.val()==''){
			alert('이메일을 입력해 주세요');
			$email.focus();
		}else if($email.val()==''){
			alert('이메일을 입력해 주세요');
			$email.focus();
		}else if($email.val()==''){
			alert('이메일을 입력해 주세요');
			$email.focus();
		}	
	}else{
		alert('아이디 중복 체크를 해주세요.');
	}	 
}); */

$('#join').on('click',function(){
	join();
});

function join(){
	var member_id=$('input[name="member_id"]').val();
	var member_pw=$('input[name="member_pw"]').val();
	var member_birth=$('input[name="member_birth"]').val();
	var member_nickName=$('input[name="member_nickName"]').val();
	var member_name=$('input[name="member_name"]').val();
	var member_phone=$('input[name="member_phone"]').val();	
	var member_gender=$('input[name="member_gender"]:checked').val();
	var member_roadAddr=$('input[name="member_roadAddr"]').val();
	var member_parcelAddr=$('input[name="member_parcelAddr"]').val();
	var member_detailAddr=$('input[name="member_detailAddr"]').val();
	// 동주소 추출
	var regex = /([가-힣A-Za-z·\d~\-\.]+(동)\s)/i;
	var member_dongAddr=member_parcelAddr.match(regex)[1];
	console.log("동주소 : "+member_dongAddr);
	// 이메일 전체 주소 추출
	var member_email=$('input[name="member_email"]').val()+"@"+$('select[name="emailhost"]').val();
	var member_birth = $('input[name="member_birth"]').val();
	var currentDate = new Date();
	var member_regDate = currentDate.toISOString();
	
	
	var memberDTO = {
			member_id : member_id,
			member_pw : member_pw,
			member_email : member_email,
			member_gender : member_gender,
			member_phone : member_phone,
			member_name : member_name,
			member_roadAddr : member_roadAddr,
			member_parcelAddr : member_parcelAddr,
			member_dongAddr : member_dongAddr,
			member_detailAddr : member_detailAddr,
			member_nickName : member_nickName,
			member_birth : member_birth,
			member_regDate : member_regDate			
	};
	
	$.ajax({
		type:'post',
		url :'join.do',
		data:JSON.stringify(memberDTO),
		contentType:'application/json; charset=utf-8',
		dataType:'JSON',
		success : function(data){
			if(data.success>0){
				alert('회원가입에 성공했습니다.');
				location.href='./';
			}else{
				alert('회원가입에 실패했습니다.');
			}
		},
		error : function(e){
			alert("회원가입 실패");
		}		
	});

}

</script>
</html>