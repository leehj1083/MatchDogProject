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
<
textarea style ="resize: both ;"> </textarea> /* 모달 스타일 */ .modal {
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
</style>
</head>
<body>



	<form action="writemyProfile" method="post" id="myForm">


		<input type="file" name="photos" multiple="multiple" value="사진 선택">

		<table>
		
		
		


			<tr>
				<th>내 강아지 이름</th>
				<th><input type="text" name="pro_dogName" /></th>
			</tr>

			<tr>
				<th>내 강아지 견종</th>
				<td><select name="breedType">
						<option value="1">코리안 믹스 도그</option>
						<option value="2">코리안 믹스 도그2</option>

				</select></td>
			</tr>

			<tr>
				<th>내 강아지 나이</th>
				<td><select name="pro_dogAge">
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
						<option value="남아">남아</option>
						<option value="여아">여아</option>
				</select></td>
			</tr>
			<tr>
				<th>내 강아지 성향</th>
				<td>
					<button type="button" id="openModal">성향 선택</button>
						
				</td>

			</tr>
			
			<tr>
				<td colspan="2"><div id="myModal" class="modal">
						<div id="myModal" class="modal">
							<div class="modal-content">
								<span class="close" id="closeModal">&times;</span> 내 강아지 성향을
								선택해주세요
								<p>
									<input type="checkbox" value="1" />활발함
								</p>
								<p>
									<input type="checkbox" value="2" />장난끼
								</p>
								<p>
									<input type="checkbox" value="3" />기운없음
								</p>
								<p>
									<input type="checkbox" value="4" />겁쟁이
								</p>
								<p>
									<input type="checkbox" value="5" />극소심
								</p>
								<p>
									<input type="checkbox" value="6" />핵인싸
								</p>
								<p>
									<input type="checkbox" value="7" />애교많음
								</p>
								<p>
									<input type="checkbox" value="8" />낯가림
								</p>
								<p>
									<input type="checkbox" value="9" />공놀이
								</p>
								<p>
									<input type="checkbox" value="10" />독립적
								</p>
								<p>
									<input type="checkbox" value="11" />밀당천재
								</p>
								<p>
									<input type="checkbox" value="12" />잘 짖음
								</p>
							<button type="button" id="submitForm">선택 완료</button>
							</div>
						</div>
						
						</td>
			</tr>
			<tr>
			<td><div id="selectedOptions"></div></td>
			<div id="imageContainer"></div>
			</tr>
			<tr>
				<th>내 강아지 소개 :</th>
				<td><textarea name="pro_dogDesc" spellcheck="false">
	</textarea></td>
			</tr>
			<tr>
			<tr>
				<th><button>등록 완료</button></th>
			</tr>
			<input type="hidden" name="CharType" id="CharType" value="" />
		</table>
		
	</form>

</body>
<script>
document.addEventListener("DOMContentLoaded", function () {
    var openModalButton = document.getElementById("openModal");
    var closeModalButton = document.getElementById("closeModal");
    var imageInput = document.getElementById("imageInput");
    var selectedOptionsDiv = document.getElementById("selectedOptions"); // 추가: 선택된 성향을 표시할 div

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
        var charTypeInput = document.getElementById("CharType");
        charTypeInput.value = selectedOptions.length > 0 ? selectedOptions.map(option => option.value).join(", ") : "";
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
            var charTypeInput = document.getElementById("CharType");
            charTypeInput.value = selectedOptions.length > 0 ? Array.from(selectedOptions).map(option => option.value).join(",") : "";

            // 추가: 선택된 성향의 내용을 selectedOptions div에 표시
            var selectedLabels = Array.from(selectedOptions).map(option => option.parentElement.textContent.trim());
            selectedOptionsDiv.innerHTML = "선택된 성향: " + selectedLabels.join(",");

            document.getElementById("myModal").style.display = "none";
        }
    });

    // 이미지 업로드 변경 시 이미지를 화면에 표시
    var imageInput = document.querySelector('input[name="photos"]');
    imageInput.addEventListener("change", function () {
        var imageContainer = document.getElementById("imageContainer");
        imageContainer.innerHTML = ""; // 이미지 컨테이너 초기화

        var files = imageInput.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var imageElement = document.createElement("img");
            imageElement.src = URL.createObjectURL(file); // 이미지 파일을 URL로 변환하여 표시
          
            imageElement.style.maxWidth = "250px";
            imageElement.style.maxHeight = "250px";
            
            imageContainer.appendChild(imageElement);
        }
    });
});
</script>
</html>