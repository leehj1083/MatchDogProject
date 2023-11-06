<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
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

/* p {
	margin:0px;
	display:inline-block;
	font-size:15px;
	font-weight:bold;
} */
</style>
</head>
<body>

	<a href="logout">로그아웃</a>
	<br></br>
	<a href="myPageList.do">회원정보</a>
	<br></br>
	<a href="myProfileList.do">프로필</a>
<br></br>
<hr style=color:blue>
<br></br>

<c:forEach items="${myProfile}" var="Profile">
	<c:if test="${Profile.pro_quit == 'N'}">
	<!-- style="display: none" -->
<%-- <form action="pro_idx.do">
	<input type="text" name="pro_idx" value="${Profile.pro_idx}"/>
</form> --%>
 <!--   <input type="file" name="photos" multiple="multiple" value="사진 선택">     -->
    <h3>${Profile.pro_dogName} 프로필</h3>
    <hr>
    ${Profile.pro_idx}
     <c:if test="${myProfile.size() <= 1 }">
    	 <button id='regProfileGo'>+</button>
    	 <div id="regProfileGoModal" class="regProfileGoModal">
  		  <div class="regProfileGoModal-content">
        	<h2>프로필을 추가로<br/>생성하시겠습니까?</h2>
        	<button id="regProfileGoConfirmYes" value="${Profile.member_idx}">예</button>
        	<button id="regProfileGoConfirmNo">아니오</button>
   		 </div>
		</div>
<!-- 		<input type="button" onclick="location.href='./regProfile.go'" value="+" /> -->
	</c:if>
	<c:if test="${myProfile.size() == 2 }">
<!-- 		<input type="button" onclick="location.href='./regProfile.go'" value="+" /> -->
		<button class='regProfileGo' value="${Profile.member_idx}">+</button>
    	 <div class="regProfileGoModal">
  		  <div class="regProfileGoModal-content">
       		 <h2>프로필을 추가로<br/>생성하시겠습니까?</h2>
     	   <button class="regProfileGoConfirmYes" value="${Profile.member_idx}">예</button>
        	<button class="regProfileGoConfirmNo">아니오</button>
   		 </div>
		</div>
		
		<!-- 프로필 삭제 버튼  -->
		<button class='profileDelDo' value="${Profile.pro_idx}">-${Profile.pro_idx}</button>
    	 



<%-- 		<input type="button" onclick="location.href='./myProfileDel.do?idx=${Profile.pro_idx}'" value="-" /> --%>
		
	</c:if>
	<c:if test="${myProfile.size() >= 3}">
		<input type="button" onclick="location.href='./myProfileDel.do?idx=${Profile.pro_idx}'" value="-" />
	</c:if>
	
    <hr>
    
    <c:if test="${Profile.pro_rep == 'Y'}">
    <h2>☆대표프로필임☆</h2>
    </c:if>
    <c:if test="${Profile.pro_rep == 'N'}">
    <button id='myProfileRepdo'>대표프로필 지정${Profile.pro_idx}</button>
    <div id="RepdoModal" class="RepdoModal">
    <div class="RepdoModal-content">
        <h2>대표 프로필로<br/>지정하시겠습니까?</h2>
        <button id="RepdoConfirmYes" value="${Profile.pro_idx}">예</button>
        <button id="RepdoConfirmNo">아니오</button>
    </div>
	</div>
	</c:if>
    <form action="myProfileMod.go" method="post">
    <table pro_idx="${Profile.pro_idx}">
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
<!-- 			<td>나이오픈여부</td>     -->
			<td><c:if test="${Profile.pro_dogAgeOpen == 'Y'}">
							<label class="switch"> <input type="checkbox"
								id="ageOpen" checked> <span class="slider round"></span>
							</label>
						</c:if>
						<c:if test="${Profile.pro_dogAgeOpen != 'Y'}">
							<label class="switch"> <input type="checkbox"
								id="ageOpen"> <span class="slider round"></span>
							</label>
						</c:if>
			</td>
		</tr>
        <tr>
			<th>내 강아지 성별</th>
			<td>${Profile.pro_dogGender}</td>
<!-- 			<td>성별오픈여부</td>    --> 
			<td><c:if test="${Profile.pro_dogGenderOpen == 'Y'}">
							<label class="switch"> <input type="checkbox"
								id="genderOpen" checked> <span class="slider round"></span>
							</label>
						</c:if>
						<c:if test="${Profile.pro_dogGenderOpen != 'Y'}">
							<label class="switch"> <input type="checkbox"
								id="genderOpen"> <span class="slider round"></span>
							</label>
						</c:if>
			</td>
		</tr>
		<tr>
			<th>내 강아지 성향</th>
<!-- 			<td id="charList"></td> -->
 			<td>${Profile.charTypeList}</td>
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
<!-- 	<input type="submit" id="myProfileMod" value="수정하기"/> -->
<!-- 	<input type="button" onclick="location.href='./myProfileMod.go'" value="수정하기"/> -->
<a href="./myProfileMod.go?pro_idx=${Profile.pro_idx}">수정하기</a>
	<br></br>
</form>
</c:if>
</c:forEach>

<div id="profileDelDoModal" class="profileDelDoModal">
  	<div class="profileDelDoModal-content">
       	<h2>정말 프로필을<br/>삭제하시겠습니까?</h2>
     	 <button class="profileDelDoConfirmYes" value="Y">예</button>
        <button class="profileDelDoConfirmNo">아니오</button>
   	</div>
</div>

</body>
<script>
var profileDelDoModal = $(".profileDelDoModal");
var profileDelDo = $(".profileDelDo");
var profileDelDoConfirmYes = $(".profileDelDoConfirmYes");
var profileDelDoConfirmNo = $(".profileDelDoConfirmNo");
var pro_idx = null;

//프로필 삭제(숨김) 스크립트

profileDelDo.on("click", function (e) {
	console.log("삭제");
	pro_idx = $(this).attr("value");
	console.log(pro_idx);
	profileDelDoModal.css("display", "block");
});


profileDelDoConfirmYes.on('click', function(e) {
	var yes = $(this).attr("value");
	console.log(yes);
		// '예'를 선택한 경우, 서버로 전송하는 코드
console.log(pro_idx);
	if (yes == "Y") {
        // pro_idxToDelete 변수에 저장된 pro_idx 값을 서버로 전송
        $.ajax({
            type: 'GET',
            url: 'myProfileDel.do', // 서버 엔드포인트 URL을 지정
            data: {
                "pro_idx": pro_idx
            },
            success : function(data) {
				console.log(data);
				console.log("프로필 삭제 완료");
				location.href = './myProfileList.do';
				if (!data.login) {
					alert('로그인이 필요한 서비스입니다.');
					location.href = './';
				}
			},
            error: function(e) {
                console.log(e);
                // 오류 처리
            }
        });

		profileDelDoModal.css("display", "none");

	};
});

	profileDelDoConfirmNo.click(function() {
		// '아니오'를 선택한 경우, 모달 창 닫기
		profileDelDoModal.css("display", "none");
	});

	/*     $.ajax({
	 type: 'get',
	 url: 'myProfileDel.do', // 서버로 요청을 보낼 엔드포인트를 지정
	 data: { "pro_idx": pro_idx},
	 success: function (data) {
	 console.log(data);
	 console.log("프로필 데이터가 삭제되었습니다.");
	 if(!data.login){
	 alert('로그인이 필요한 서비스입니다.');
	 location.href='./';
	 }
	 },
	 error: function (e) {
	 console.log(e)
	 } 
	 });
	
	 RepdoModal.css("display", "none");
	
	 });

	 RepdoConfirmNo.click(function() {
	 // '아니오'를 선택한 경우, 모달 창 닫기
	 RepdoModal.css("display", "none"); */

	/* 프로필 생성 이동 스크립트 */

	var regProfileGoModal = $(".regProfileGoModal");
	$('.regProfileGo').on("click", function(e) {
		console.log("생성");
		var member_idx = $(this).attr("value");
		console.log(member_idx);
		regProfileGoModal.css("display", "block");
	});

	$('.regProfileGoConfirmYes').click(function(e) {
		// '예'를 선택한 경우, 서버 전송 후 모달 창 닫기
		var member_idx = $(this).attr("value");
		console.log(member_idx);
		location.href = "./regProfile";
		regProfileGoModal.css("display", "none");
	});

	$('.regProfileGoConfirmNo').click(function() {
		// '아니오'를 선택한 경우, 모달 창 닫기
		regProfileGoModal.css("display", "none");
	});

	// 대표 프로필 설정 스크립트
	var RepdoModal = $("#RepdoModal");
	var myProfileRepdo = $("#myProfileRepdo");
	var RepdoConfirmYes = $("#RepdoConfirmYes");
	var RepdoConfirmNo = $("#RepdoConfirmNo");

	myProfileRepdo.click(function() {
		// 대표 프로필 설정 모달 표시
		RepdoModal.css("display", "block");
	});

	RepdoConfirmYes.click(function(e) {

		var pro_idx = $(this).attr("value");
		console.log(pro_idx);
		// '예'를 선택한 경우, 서버로 전송하는 코드
		$.ajax({
			type : 'get',
			url : 'myProfileRep.do', // 서버로 요청을 보낼 엔드포인트를 지정
			data : {
				"pro_idx" : pro_idx
			},
			success : function(data) {
				console.log(data);
				console.log("대표프로필로 저장되었습니다.");
				location.href = './myProfileList.do';
				if (!data.login) {
					alert('로그인이 필요한 서비스입니다.');
					location.href = './';
				}
			},
			error : function(e) {
				console.log(e)
			}
		});
		/*     location.href='./myProfileRep.do'; */
		// 모달 닫기
		RepdoModal.css("display", "none");

	});

	RepdoConfirmNo.click(function() {
		// '아니오'를 선택한 경우, 모달 창 닫기
		RepdoModal.css("display", "none");
	});

	$('input[type="checkbox"]').on("change", function(e) {
		var pro_idx = $(this).closest('table').attr('pro_idx');
		console.log(pro_idx);
		var isChecked = $(this).is(":checked");
		console.log(isChecked);
		var checkboxId = $(this).attr("id");
		var openType_code = '';

		if (checkboxId == 'ageOpen') {
			openType_code = 1;
		} else if (checkboxId == 'genderOpen') {
			openType_code = 2;
		}
		console.log(openType_code);
		console.log(checkboxId);
		var toggleValue = isChecked ? "Y" : "N";
		console.log(toggleValue);

		$.ajax({
			type : 'get',
			url : 'myProfileOpen.do', // 서버로 요청을 보낼 엔드포인트를 지정
			data : {
				"pro_idx" : pro_idx,
				"openType_code" : openType_code,
				"toggleValue" : toggleValue
			},
			success : function(data) {
				console.log(data);
				console.log("데이터가 서버에 저장되었습니다.");
				if (!data.login) {
					alert('로그인이 필요한 서비스입니다.');
					location.href = './';
				}
			},
			error : function(e) {
				console.log(e)
			}
		});

	});

	$('#myProfileMod').on('click', function() {
		location.href = './myProfileMod.go';
	});
</script>
</html>