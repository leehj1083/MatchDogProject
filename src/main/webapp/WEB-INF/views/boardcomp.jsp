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
textarea{
	resize: none;
}

.w-btn {
	position: relative;
	border: none;
	display: inline-block;
	padding: 15px 30px;
	border-radius: 15px;
	font-family: pretendard;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
	margin: 20px auto;
	width:300px;
}

.w-btn-green {
	background-color:var(--green);
	color: var(--white);
}

.w-btn-green-outline:hover {
	background-color: var(--green);
	color: var(--white);
}

.w-btn:hover {
	letter-spacing: 2px;
	transform: scale(1.2);
	cursor: pointer;
}

.w-btn:active {
	transform: scale(1.5);
}

.compModal{
	display: inline-block;
	position:absolute;
	background-color: var(--white);
	top: 180px;
	left: 660px;
	z-index: 9999;
	width: 480px;
	height: 670px;
	font-family:pretendard;
	font-size: 12px;
	border: 1px solid var(--light);
	box-shadow: 0 0 8px 1px var(--light);
	border-radius:10px;
	overflow-y: auto;
}

.closeButton {
    position: absolute;
	left: 416px;
	top: 16px;
	cursor: pointer;
	font-size: 32px;
	color:var(--grey);
}

.comp_top{
	display:inline-block;
}

.comp_subject{
	display:inline-block;
	position:relative;
	margin: 20px 40px;
	top:5px;
	width: 200px;
	height:30px;
	font-size:20px;
	font-family:Pretendard;
	font-weight: 600;
	color:var(--green);
	cursor:auto;
}

.text{
    display:inline-block;
    font-size:14px;
	font-family:Pretendard;
	color:var(--dark);
	font-weight: 400;
	width:220px;
	word-break: break-all;
  }
  
  .text.reSelect{
  	margin: 20px 0 20px 20px;
  	font-size:20px;
  	font-weight:600;
  	
  }
  
 .comp_reason{
 	display:flex;
 	flex-direction: column;
 	border : 1px solid var(--light);
 	border-radius:4px;
 }
 
 .comp_content {
	align-items: center;
	margin : 20px auto;
    width: 90%;
}

.comp_list{
	display:flex;
	margin:16px;
}

.ckb{
	margin-right:20px;
}

.line{
	width:100%;
	height:1px;
	background-color:var(--light);
}

.comp_deReason{
	display:flex;
	flex-direction: column;
}

.comp_photo{
	display:flex;
	align-items: center;
    justify-content: space-between;
}
</style>
</head>
<body>


	<form action="boardcompSave.do" method="post" id="myForm">
	<div class="compModal">
	<span class="closeButton" onclick="closeModal()">&times;</span>
    <div class="comp_top">
    	<div class="comp_subject">신고하기</div>
    </div>
    <div class ="line"></div>
    <div class="comp_content">
		<div class="comp_reason">
			<div class="text reSelect">사유선택</div>
		    <div class ="line"></div>
			<c:forEach items="${compList}" var="myComp">
			<div class="comp_list">
				<div><input class="ckb" type="checkbox" value="${myComp.compType_code}" /></div>
				<div class="text">${myComp.compType}</div>
			</div>
			</c:forEach>
		</div>
		<div class="comp_deReason">
		<div class="text reSelect">신고사유(자세히)</div>
		<textarea name="comp_content" spellcheck="false" rows="8" cols="50">내용을입력해주세요</textarea>
		<div class="comp_photo">
		<div class="text">사진 첨부</div>
			<div id="fileNameDisplay"></div>
		    <label for="compFile">
		        <img src="resources/img/compPhoto.png" alt="Comp Photo" style="cursor: pointer; width: 30px; height: 30px;">
		    </label>
		    <input type="file" id="compFile" name="photo" style="display: none;" onchange="displayFileName(this)">
		</div>
			<input type="hidden" id="compType_code" name="compType_code" value="">
			<button id="reportButton" class="w-btn w-btn-green">신고하기</button>
		</div>

	</div>
	</div>
	</form>

</body>

<script>



function displayFileName(input) {
    var fileNameDisplay = document.getElementById("fileNameDisplay");
    var fileName = input.value.split('\\').pop(); // 파일 경로에서 파일 이름만 추출
    fileNameDisplay.innerHTML = fileName;
}



document.addEventListener("DOMContentLoaded", function () {
    var checkboxes = document.querySelectorAll("input[type='checkbox']");
    
    checkboxes.forEach(function (checkbox) {
        checkbox.addEventListener("click", function () {
        	document.getElementById("compType_code").value = checkbox.value;
        	// 다른 체크박스들을 모두 선택 해제합니다.
            checkboxes.forEach(function (otherCheckbox) {
                if (otherCheckbox !== checkbox) {
                    otherCheckbox.checked = false;
                }
            });
        });
    });
    var reportButton = document.getElementById("reportButton");

    reportButton.addEventListener("click", function () {
        var confirmation = confirm("정말 신고하시겠습니까?");
        
        if (confirmation) {
            // 여기에 확인을 눌렀을 때 Controller로 요청을 보내는 코드를 추가합니다.
            document.getElementById("myForm").submit();
        } else {
            alert("신고가 취소되었습니다.");
            event.preventDefault();
        }
    });
    
    function closeModal() {
        $("#myModal").removeClass('active');
    }
    
    
    
});
</script>
</html>