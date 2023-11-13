<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/myProfile.css" type="text/css">
<!-- bootstrap 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 처리를 위한 라이브러리 -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
 <style>


a, a:link, a:visited, a:active, a:hover {
	text-decoration: none;
	color: var(--black);
}

textarea{
	resize: none;
}

.input_img {
	display: none;
}


/* 본인 페이지 것으로 변경하기  */
.btn_gnb .bi-person-circle, .btn_gnb.myPage{
    color: var(--white);
    background-color: var(--green);
}

.btn_gnb.myPageInfo{
    color: var(--white);
    background-color: var(--green);
}


/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb:hover .bi-house-door-fill,
.btn_gnb:hover .bi-chat-dots-fill,
.btn_gnb:hover .bi-gear-fill,
.btn_gnb:hover .bi-people-fill,
/*.btn_gnb:hover .bi-person-circle,*/
.btn_gnb:hover .bi-list-ul {
    background-color: var(--light);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb.home:hover,
.btn_gnb.match:hover,
.btn_gnb.chatting:hover,
.btn_gnb.board:hover,
/*.btn_gnb.myPage:hover,*/
.btn_gnb.admin:hover,
/* .btn_gnb.myPageInfo:hover{
	background-color: var(--light);
} */
.btn_gnb.myProfile:hover{
	background-color: var(--light);
}
.content {
padding: 1.6rem;
margin: 1.6rem;
font-family:pretendard;
}

.charModal {
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

.charModal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 70%;
}

/*사진 모달창*/
.photoModal {
	display: inline-block;
	width: 480px;
	height: 720px;
	border: 1px solid var(--light);
	box-shadow: 0 0 8px 1px var(--light);
	border-radius: 12px;
    position: absolute; 
    top:304px;
    left:804px;
    z-index: 1000;
    background-color:var(--white);
}

.imgtable {
	margin-top:60px;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.close {
	position: relative;
	left: 330px;
	top: 20px;
	cursor: pointer;
	font-size: 32px;
	color:var(--grey);
}

.fileContent{
	display:inline-block;
}

.write-link.attach{
	display: inline-block;
	position:relative;
	top:100px;
	right:20px;
	cursor: pointer;
	color:var(--green);
	font-size: 33px;
}

.filebox .bi-plus-circle-fill {
	display: inline-block;
	position:relative;
	top:100px;
	right:20px;
	cursor: pointer;
	color:var(--green);
	font-size: 33px;
}

.filebox .bi-dash-circle-fill {
	display: none;
	position:relative;
	top:100px;
	right:20px;
	cursor: pointer;
	color:var(--green);
	font-size: 33px;
}

.image-container{
	display:inline-block;
	width: 104px;
	height: 120px;
	border: 1px solid var(--light);
	border-radius: 8px;
	box-shadow: 0 0 4px 1px var(--light);
	margin-left:10px;
	margin-bottom:40px;
}


.imgtable .image-container img{
	display:inline-block;
	right:10px;
	width: 104px;
	height: 120px;
	border-radius: 8px;
    object-fit: cover;
}

.photoTextSave{
	display:inline-block;
	position:relative;
	top:22px;
	left:32px;
	font-size:24px;
	font-family:Pretendard;
	font-weight: 700;
	text-align: center;
	color:var(--green);
	cursor:auto;
}

.photo_selected{
	display: inline-block;
	position: relative;
	width: 200px;
	height: 46px;
	top:40px;
	padding: 12px 15px 0 15px;
	border: 1px solid var(--light);
	background-color: var(--green);
	border-radius: 8px;
	font-size:16px;
	color:var(--white);
	font-family:Pretendard;
	font-weight: 500;
	text-align: center;
	cursor:pointer;
}


 
 /* 대표프로필 모달 */
.RepdoModal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 1;
}

.RepdoModal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ccc;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

/* 프로필 생성 모달 */
.regProfileGoModal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 1;
}

.regProfileGoModal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ccc;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

/* 프로필 삭제 모달 */
.profileDelDoModal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 1;
}

.profileDelDoModal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ccc;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.button-gray {
	padding: 6px 20px;
	font-size: 12px;
	text-align: center;
	text-decoration: none;
	background-color: #808080;
	color: #ffffff;
	border-radius: 5px;
	border: 1px solid #808080;
	cursor: pointer;
}

.button-green {
	padding: 6px 20px;
	font-size: 12px;
	text-align: center;
	text-decoration: none;
	background-color: #1abc9c;
	color: #ffffff;
	border-radius: 5px;
	border: 1px solid #1abc9c;
	cursor: pointer;
}


<textarea style ="resize: both ;"> </textarea>

/* 닫기 버튼 스타일 */
/*  .close {
            color: #888;
            float: right;
            font-size: 28px;
            font-weight: bold;
        } */
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
	vertical-align: middle;
}

/* Hide default HTML checkbox */
.switch input {
	display: none;
}

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

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
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

  .profile-info {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
  }

  .profile-info p {
    margin: 0;
  }

  .name-label {
    flex: 1; /* 이름 레이블 영역이 가능한 최대 너비를 차지하도록 설정 */
  }

  .name-value {
    flex: 2; /* 이름 값 영역이 가능한 최대 너비의 2배를 차지하도록 설정 */
    text-align: left; /* 중앙 정렬 */
  }
 </style>
</head>
<body>
<div id="wrap">
	<div class="banner">
		<div class="header">
			<h1 class="logo">
				<a href="./HomeMatchingList.do"><img src="/photo/logo.png" class="logo_matchDog"/></a>
			</h1>
			<div class="gnb">
				<a id="openAlarm" class="alarm"><span class="bi bi-bell-fill"></span></a>
				<a href="./logout.do"><span class="logout">로그아웃</span></a>
			</div>
		</div>
	</div>
	<div class="mainContainer">
		<div class="side">
			<div class="menu">
				<a href="./HomeMatchingList.do" class="btn_gnb home">
					<span class="bi bi-house-door-fill"></span>
					<span>홈</span>
				</a>
		        <a href="./recvMatchingList.go" class="btn_gnb match">
		        	<span class="bi bi-list-ul"></span>
					<span>매칭리스트</span>
		        </a>
		        <a href="./chattingList.go" class="btn_gnb chatting">
		        	<span class="bi bi-chat-dots-fill"></span>
					<span>채팅</span>
		        </a>
		        <a href="./boardList.go" class="btn_gnb board">
		        	<span class="bi bi-people-fill"></span>
					<span>커뮤니티</span>
		        </a>
		        <a href="./myProfileList.do" class="btn_gnb myPage">
		        	<span class="bi bi-person-circle"></span>
					<span>마이페이지</span>
		        </a>
	            <a href="./adminList.go" class="btn_gnb admin">
	            	<span class="bi bi-gear-fill"></span>
					<span>관리자페이지</span>
	            </a>
			</div>
		</div>
		<div class="subSide">
			<div class="my_profile_h3">${myPage.member_name} 님의 마이페이지</div>
			<div><img src="/photo/${photoName}" class="profilePhoto"/></div>
			<c:url value="/myPage" var="myPageUrl" />
			<div class="myPageMenu">
				<a href="./myProfileList.do" class="btn_gnb myPageInfo">
					<span>회원 정보</span>
			    </a>
			    <a href="./myProfileList.do" class="btn_gnb myProfile">
					<span>프로필</span>
			    </a>
		    </div>
		</div>

 	<br></br>
 	<div class="content">
 	<div id="alarmContent"></div>
 	<form action="myPageModUpdate.do" method="post">
 	<div class="inputForm">
     <h3 style="color : var(--green);">기본 정보</h3>
<br></br>
 	<input type="hidden" name=member_id value="${myPage.member_id}"/>
 	<div class="profile-info">
  <div class="name-label">
    <strong>이름</strong>
  </div>
  <div class="name-value">
    <p>${myPage.member_name}</p>
  </div>
</div>
<div class="profile-info">
  <div class="name-label">
    <strong>아이디</strong>
  </div>
<div class="name-value">
    <p>${myPage.member_id}</p>
  </div>
</div>
<div class="profile-info">
  <div class="name-label">
    <strong>성별</strong>
  </div>
  <div class="name-value">
    <p>${myPage.member_gender}</p>
  </div>
</div>
<div class="profile-info">
  <div class="name-label">
    <strong>닉네임</strong>
  </div>
  <div class="name-value">
    <p><input type="text" name="member_nickName" value="${myPage.member_nickName}"/><input type="button" id="overlayNick" value="중복확인"/><span class="nickChk"></span></p>
  	<span class="nickValid" style="font-size : 8pt"> ※ 닉네임은 문자와 숫자로 구성하여 2~8자 까지 입력해주세요</span>
  </div>
</div>
 	<p>이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${myPage.member_name}</p>
 	<p>아이디 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${myPage.member_id}</p>
 	<p>성별 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${myPage.member_gender}</p>
 	<p/>닉네임 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="member_nickName" value="${myPage.member_nickName}"/>
      <input type="button" id="overlayNick" value="중복확인"/> <span class="nickChk"></span> <p/>
      <span class="nickValid" style="font-size : 8pt"> ※ 닉네임은 문자와 숫자로 구성하여 2~8자 까지 입력해주세요</span>
     <p>비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="password" name="member_pw" placeholder="비밀번호를 입력하세요" value="${myPage.member_pw}"/>
      <p>비밀번호 확인 <input type="password" name="member_pwReChk"  placeholder="비밀번호를 한번 더 입력하세요" value=""/>  
 	<p/><span class="pwReChk" style="font-size : 8pt"> ※ 비밀번호를 다시 한 번 입력해주세요</span>
 	<p>이메일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	<input type="text" id="usermail" name="member_email" placeholder="메일 주소를 입력 하세요" value="${myPage.member_email}"/>@
	  <select name="emailhost" id="mailhost">
			<option value="naver.com">naver.com</option>	
			<option value="gmail.com">gmail.com</option>
			<option value="daum.net">daum.net</option>
			<option value="nate.com">nate.com</option>
	  </select>
	  
	  <p>전화번호  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="member_phone" value="${myPage.member_phone}"/>
       <p><span class="phoneValid" style="font-size : 8pt"> ※ 전화번호는 -를 포함하여 입력하여 주십시오</span>
	  
	  <p/>주소<input type="text" id="postcode" placeholder="우편번호">
	  <input type="button" id="findpostcode" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
	  <input type="text" id="roadAddress"  name = "member_roadAddr" placeholder="도로명주소" value="${myPage.member_roadAddr}"><br/>
	  <input type="text" id="jibunAddress" name = "member_parcelAddr" placeholder="지번주소" value="${myPage.member_parcelAddr}"><br/>
	  <span id="guide" style="color:#999;display:none"></span><br/>
	  <input type="text" id="detailAddress" name = "member_detailAddr" placeholder="상세주소" value="${myPage.member_detailAddr}">		  
	  <input type="text" id="extraAddress" name="member_dongAddr" placeholder="참고항목" value="${myPage.member_dongAddr}">                  
	  
	 	</div>
 		 	<br></br>
 		 	<div style="display: flex; justify-content: space-between;">
<span>
  <input type="button" onclick="location.href='./myPageList.do'" class="button-gray" value="수정 취소"/>
</span>
<span>
  <input type="submit" id="myPageUpdate" class="button-green" value="수정 완료"/>
</span>
</div>
<!--  		<input type="button" onclick="location.href='./myPageList.do'" class="button-gray" value="수정 취소"/>
 		<input type="submit" id="myPageUpdate" class="button-green" value="수정 완료"/> -->
 		 </form>
 	<br></br>
 	<br></br>
 	</div>
 	</div>
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

//PW 일치 확인(재입력)
$('input[name="member_pwReChk"]').keyup(function(){
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


var myPageModNickOveraly = false;
$('#overlayNick').on('click',function(){
	var $nickName = $('input[name="member_nickName"]');
	console.log('member_nickName='+$nickName);

	$.ajax({
		type : 'post',
		url : 'overlayNick.do',
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


//닉네임 정규표현식
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
		console.log($('.nickValid').html());
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


//회원 가입
$('#myPageUpdate').on('click',function(){
	
	var member_pw=$('input[name="member_pw"]').val();
	var member_nickName=$('input[name="member_nickName"]').val();
	var member_phone=$('input[name="member_phone"]').val();	
	var member_roadAddr=$('input[name="member_roadAddr"]').val();
	var member_parcelAddr=$('input[name="member_parcelAddr"]').val();
	var member_detailAddr=$('input[name="member_detailAddr"]').val();
				

	// 비밀번호 검사
	if(member_pw == '') {
	    alert('비밀번호를 입력해 주세요');
	    $('input[name="member_pw"]').focus();
	    return false;
	}
	/* 
	if($('.pwValid').html() != '적합한 비밀번호 형식입니다.') {
	    alert('비밀번호를 정확히 입력해 주세요');
	    $('input[name="member_pw"]').focus();
	    return false;
	}
	*/
	if($('input[name="pwCheck"]').val() == '') {
	    alert('비밀번호 확인을 위해 재입력해 주세요');
	    $('input[name="pwCheck"]').focus();
	    return false;
	}
	
	if($('.pwReChk').html() != '비밀번호가 일치합니다.') {
	    alert('비밀번호를 정확히 입력해 주세요');
	    $('input[name="pwCheck"]').focus();
	    return false;

	}
	 
	// 전화번호 검사
	if(member_phone == '') {
	    alert('전화번호를 입력해 주세요');
	    $('input[name="member_phone"]').focus();
	    return false;
	}
/* 	if($('.phoneValid').html() != '적절한 전화번호 형식입니다.') {
	    alert('전화번호를 정확히 입력해 주세요');
	    $('input[name="member_phone"]').focus();
	    return false;
	} */

	// 닉네임 검사
	if(member_nickName == '') {
	    alert('닉네임을 입력해 주세요');
	    $('input[name="member_nickName"]').focus();
	    return false;
	}
	if($('.nickValid').html() == '닉네임이 형식에 어긋납니다.') {
	    alert('닉네임을 정확히 입력해 주세요');
	    $('input[name="member_nickName"]').focus();
	    return false;
	}
	if(overlayNickChk != true) {
	    alert('닉네임 중복체크를 진행해주세요');
	    return false;
	}

	// 주소 검사
	if(member_roadAddr == '') {
	    alert('주소를 입력해 주세요');
	    return false;
	}
			
	
});	


</script>

<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

$('#openAlarm').click(function (e) {
	   // JSP 파일을 가져와서 모달 창에 표시
	   $.get("./alarmList.go", function(data) {
	   	console.log(data);
	   	console.log("#alarmContent");
	       $("#alarmContent").html(data);
	   });
	});
</script>



</html>