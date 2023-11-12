
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<meta charset="UTF-8">
<title>홈 화면</title>
<link rel="stylesheet" href="resources/css/home.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 처리를 위한 라이브러리 -->
<style>

.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 80px;
    color: #999999;
}

.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    width: 55px;
    height: 10px;
    margin-left: 10px;
    font-size: small;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}


#imgtable {
border: 1px solid black;
}
#imgtable td,tr{
border: 1px solid black;
}
#imgtable td{
width: 300px;
height: 200px;
}

textarea style ="resize: both ;"> </textarea>.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 500px;
	height: 500px;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	display: none;

}

.modal.active .modal-content {
	display: block;
	
}

.modal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 70%;
}


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



	a, a:link, a:visited, a:active, a:hover {
		text-decoration: none;
		color: var(--black);
	}
	
	
	/* 본인 페이지 것으로 변경하기  */
	.btn_gnb .bi-house-door-fill, .btn_gnb.home{
	    color: var(--white);
	    background-color: var(--green);
	}
	
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	/* .btn_gnb:hover .bi-house-door-fill, */
	.btn_gnb:hover .bi-chat-dots-fill,
	.btn_gnb:hover .bi-gear-fill,
	.btn_gnb:hover .bi-people-fill,
	.btn_gnb:hover .bi-person-circle,
	.btn_gnb:hover .bi-list-ul {
	    background-color: var(--light);
	}
	
	/* 본인 페이지를 제외한 나머지 hover 적용 */
	/* .btn_gnb.home:hover, */
	.btn_gnb.match:hover,
	.btn_gnb.chatting:hover,	
	.btn_gnb.board:hover,
	.btn_gnb.myPage:hover,
	.btn_gnb.admin:hover{
		background-color: var(--light);
	}
	    #modalContent{
	    	width: 500px;
	    	height: 500px;
	    	text-align: left; 
	}

	.sidebar {
        height: 100%;
        width: 250px;
        position: fixed;
        top: 0;
        left: 0;
        background-color: #255,255,255;
        padding-top: 20px;
    }

    .sidebar h2 {
        color: black;
        text-align: center;
    }

    .sidebar ul {
        list-style: none;
        padding: 0;
    }

    .sidebar ul li {
        padding: 10px;
        text-align: center;
    }

    .sidebar a {
        color: black;
        text-decoration: none;
    }

    .content {
        margin-left: 260px;
        padding: 20px;
        text-align: center; /* "우리 동네 리스트"를 가운데 정렬 */
    }
    #modalContent{
    	width: 500px;
    	height: 500px;
    	text-align: left; 
    }



</style>
</head>
<body>



<div class="container">
		<a href="./"><img src="./resources/img/maticon.PNG" src="매칭해주개메인" /></a>
	</div>




<div id="wrap">
	<div class="banner">
		<div class="header">
			<h1 class="logo">
				<!-- <a href="./"><img src="/photo/logo.png" class="logo_matchDog"/></a> -->
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

	


	<form action="profileSave.do" method="post" id="myForm">
	<div class="content">
         <input type="button" name="imgBtn" value="사진 선택">
       
         <div id="newModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeNewModal">&times;</span>
        <!-- 모달 내용 추가 -->
        <h3>사진 추가 팝업창 입니다.</h3>
        <table id = "imgtable">
        <tr>
        <td>
       <div id="imageContainer1"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file1">사진추가</label> 
    <input type="file" id="file1" name="photos">
</div>
        </td>
        <td>
       <div id="imageContainer2"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file2">사진추가</label> 
    <input type="file" id="file2" name="photos2">
</div>
        </td>
        <td>
       <div id="imageContainer3"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file3">사진추가</label> 
    <input type="file" id="file3" name="photos3">
</div>
        </td>
        </tr>        
        <tr>
        <td>
      <div id="imageContainer4"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file4">사진추가</label> 
    <input type="file" id="file4" name="photos4">
</div>
        </td>
        <td>
       <div id="imageContainer5"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file5">사진추가</label> 
    <input type="file" id="file5" name="photos5">
</div>
        </td>
        <td>
        <div id="imageContainer6"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file6">사진추가</label> 
    <input type="file" id="file6" name="photos6">
</div>
        </td>
        </tr>
        <tr>
        <td>
        <div id="imageContainer7"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file7">사진추가</label> 
    <input type="file" id="file7" name="photos7">
</div>
        </td>
        <td>
       <div id="imageContainer8"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file8">사진추가</label> 
    <input type="file" id="file8" name="photos8">
</div>
        </td>
        <td>
        <div id="imageContainer9"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file9">사진추가</label> 
    <input type="file" id="file9" name="photos9">
</div>
        </td>
        </tr>
        </table>
        <button type="button" id="selectComplete">선택 완료</button>
    </div>
</div>
         
		

		<table>





			<tr>
				<th>내 강아지 이름</th>
				<th><input type="text" name="pro_dogName" /></th>
			</tr>

			<tr>
				<th>내 강아지 견종</th>
				<td><select name="breedType_code">
						<c:forEach items="${list2}" var="breed">
							<option value="${breed.breedType_code}">${breed.breedType}</option>
						</c:forEach>
				</select></td>
			</tr>

			<tr>
				<th>내 강아지 나이</th>
				<td><select name="pro_dogAge">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
				</select></td>
			</tr>

			<tr>
				<th>내 강아지 성별</th>
				<td><select name="pro_dogGender">
						<option value="남">남</option>
						<option value="여">여</option>
				</select></td>
			</tr>
			<tr>
				<th>내 강아지 성향</th>
				<td>
					<button type="button" id="openModal">성향 선택</button>

				</td>

			</tr>

			<tr>
				<td colspan="2">

					<div id="myModal" class="modal">
						<div class="modal-content">
							<span class="close" id="closeModal">&times;</span> 내 강아지 성향을
							선택해주세요
							<c:forEach items="${list}" var="myChar">
								<p>
									<input type="checkbox" value="${myChar.charType_code}" />
									${myChar.charType}
								</p>
							</c:forEach>
							<button type="button" id="submitForm">선택 완료</button>
						</div>
					</div>

				</td>
			</tr>
			<tr>
				<td><div id="selectedOptions"></div></td>
				
			</tr>
			<tr>
				<th>내 강아지 소개 :</th>
				<td><textarea name="pro_dogDesc" spellcheck="false">
	</textarea></td>
			</tr>
			<tr>
			<tr>
				<th><button id="submitBtn">등록 완료</button></th>
			</tr>
			<input type="hidden" name="charType_code" id="charType_code" value="" />
			
		</table>
</div>
	</form>

</body>
<script>
document.addEventListener("DOMContentLoaded", function () {
	
	var submitBtn = document.getElementById("submitBtn");
    var openModalButton = document.getElementById("openModal");
    var closeModalButton = document.getElementById("closeModal");
    var imageInput = document.getElementById("imageInput");
    var selectedOptionsDiv = document.getElementById("selectedOptions"); // 추가: 선택된 성향을 표시할 div

    
    
    var newModal = document.getElementById("newModal");
    var openNewModalButton = document.getElementsByName("imgBtn")[0];
    var closeNewModalButton = document.getElementById("closeNewModal");
    
    
    // 새로운 모달을 열기, 닫기 위한 이벤트 핸들러 추가
   openNewModalButton.addEventListener("click", function () {
	   document.getElementById("newModal").style.display = "block";
    
});

    closeNewModalButton.addEventListener("click", function () {
    	 document.getElementById("newModal").style.display = "none";
    	 
    	 // 모든 이미지 컨테이너들을 초기화
         var imageContainers = document.querySelectorAll(".modal-content div[id^='imageContainer']");
         imageContainers.forEach(function (container) {
             container.innerHTML = "";
         });

         // 이미지 업로드 입력 필드도 초기화
         var imageInputs = document.querySelectorAll(".modal-content input[type='file']");
         imageInputs.forEach(function (input) {
             input.value = "";
         });
    	 
    		 var fileInputs = document.querySelectorAll('input[type="file"]');
         for (var i = 0; i < fileInputs.length; i++) {
             fileInputs[i].value = "";
         }
        
    	 
    });
    
    var selectCompleteButton = document.getElementById("selectComplete");
    selectCompleteButton.addEventListener("click", function () {
        document.getElementById("newModal").style.display = "none";
    });
    
    // "성향 선택" 버튼을 클릭했을 때 모달 창 열기
    
    openModalButton.addEventListener("click", function () {
        document.getElementById("myModal").style.display = "block";
    });

    // 모달 창 닫기 버튼 클릭 시 모달 창 닫기
    closeModalButton.addEventListener("click", function () {
        document.getElementById("myModal").style.display = "none";
        
        
        // 선택된 체크박스 항목들을 가져와서 화면에 표시
        var selectedOptions = document.querySelectorAll('input[type="checkbox"]:checked');
        var selectedLabels = Array.from(selectedOptions).map(option => option.parentElement.textContent.trim());
        selectedOptionsDiv.innerHTML = "선택된 성향: " + selectedLabels.join(", ");
        
        // 추가: 선택된 성향의 value 값을 CharType에 설정
        var charTypeInput = document.getElementById("charType_code");
        charTypeInput.value = selectedOptions.length > 0 ? selectedOptions.map(option => option.value).join(", ") : "";
    });
    
    openNewModalButton.addEventListener("click", function () {
        document.getElementById("newModal").classList.add('active');
    });

    // 모달을 숨기려면 .modal 요소에서 'active' 클래스를 제거합니다.
    closeNewModalButton.addEventListener("click", function () {
        document.getElementById("newModal").classList.remove('active');
    });
    
    
    
 // 모달을 표시하려면 .modal 요소에 'active' 클래스를 추가합니다.
    openModalButton.addEventListener("click", function () {
        document.getElementById("myModal").classList.add('active');
    });

    // 모달을 숨기려면 .modal 요소에서 'active' 클래스를 제거합니다.
    closeModalButton.addEventListener("click", function () {
        document.getElementById("myModal").classList.remove('active');
    });

    // "선택 완료" 버튼을 클릭했을 때 모달 창 닫기
    var submitFormButton = document.getElementById("submitForm");
    submitFormButton.addEventListener("click", function () {
        var selectedOptions = document.querySelectorAll('input[type="checkbox"]:checked');

        if (selectedOptions.length < 4) {
            alert("성향을 4개 선택해주세요");
        } else if (selectedOptions.length > 4) {
            alert("성향을 4개 선택해주세요");
        } else {
            // 추가: 선택된 성향의 value 값을 CharType에 설정
            var charTypeInput = document.getElementById("charType_code");
            charTypeInput.value = selectedOptions.length > 0 ? Array.from(selectedOptions).map(option => option.value).join(",") : "";

            // 추가: 선택된 성향의 내용을 selectedOptions div에 표시
            var selectedLabels = Array.from(selectedOptions).map(option => option.parentElement.textContent.trim());
            selectedOptionsDiv.innerHTML = "선택된 성향: " + selectedLabels.join(",");

            document.getElementById("myModal").style.display = "none";
        }
    });
    
    submitBtn.addEventListener("click", function () {
        // 선택된 옵션을 담고 있는 div 가져오기
        var selectedOptionsDiv = document.getElementById("selectedOptions");

        // 선택된 옵션이 있는지 확인
        if (selectedOptionsDiv.innerHTML.trim() === "") {
            alert("성향을 선택해주세요!");
          
            event.preventDefault();
        } 
        
        var dogNameInput = document.getElementsByName("pro_dogName")[0]
        ;
        if (dogNameInput.value.trim() === "") {
            // 강아지 이름이 없으면 alert 창을 띄우고 폼 제출을 막기
            alert("강아지 이름을 입력해주세요!");
            event.preventDefault();  // 폼 제출 막기
        }
    });
    
    
 //-----------------------------------------여기서 부터 이미지 파일 관련 script 문 입니다...-------------------------------------------------   

 // 이미지 및 파일 업로드 입력 필드 초기화 함수

 
 
    // 이미지 업로드 변경 시 이미지를 화면에 표시

    var imageInput1 = document.getElementById("file1");
    var imageContainer1 = document.getElementById("imageContainer1");

    imageInput1.addEventListener("change", function () {
        imageContainer1.innerHTML = ""; 

        var files = imageInput1.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer1.appendChild(imageElement);
        }
    });
 
    var imageInput2 = document.getElementById("file2");
    var imageContainer2 = document.getElementById("imageContainer2");

    imageInput2.addEventListener("change", function () {
        imageContainer2.innerHTML = ""; 

        var files = imageInput2.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer2.appendChild(imageElement);
        }
    });
    
    var imageInput3 = document.getElementById("file3");
    var imageContainer3 = document.getElementById("imageContainer3");

    imageInput3.addEventListener("change", function () {
        imageContainer3.innerHTML = ""; 

        var files = imageInput3.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer3.appendChild(imageElement);
        }
    });
    var imageInput4 = document.getElementById("file4");
    var imageContainer4 = document.getElementById("imageContainer4");

    imageInput4.addEventListener("change", function () {
        imageContainer4.innerHTML = "";

        var files = imageInput4.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer4.appendChild(imageElement);
        }
    });
    
    var imageInput5 = document.getElementById("file5");
    var imageContainer5 = document.getElementById("imageContainer5");

    imageInput5.addEventListener("change", function () {
        imageContainer5.innerHTML = ""; 

        var files = imageInput5.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer5.appendChild(imageElement);
        }
    });
    
    var imageInput6 = document.getElementById("file6");
    var imageContainer6 = document.getElementById("imageContainer6");

    imageInput6.addEventListener("change", function () {
        imageContainer6.innerHTML = ""; 

        var files = imageInput6.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer6.appendChild(imageElement);
        }
    });
    var imageInput7 = document.getElementById("file7");
    var imageContainer7 = document.getElementById("imageContainer7");

    imageInput7.addEventListener("change", function () {
        imageContainer7.innerHTML = ""; 

        var files = imageInput7.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer7.appendChild(imageElement);
        }
        
    });
    
    var imageInput8 = document.getElementById("file8");
    var imageContainer8 = document.getElementById("imageContainer8");

    imageInput8.addEventListener("change", function () {
        imageContainer8.innerHTML = ""; 

        var files = imageInput8.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer8.appendChild(imageElement);
        }
    });
    
    var imageInput9 = document.getElementById("file9");
    var imageContainer9 = document.getElementById("imageContainer9");

    imageInput9.addEventListener("change", function () {
        imageContainer9.innerHTML = ""; 

        var files = imageInput9.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file);
            imageElement.style.maxWidth = "150px";
            imageElement.style.maxHeight = "150px";
            imageContainer9.appendChild(imageElement);
        }
    });
    
});
</script>
</html>