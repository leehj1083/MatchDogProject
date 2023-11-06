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

<textarea style="resize: both;"></textarea>
        /* 모달 스타일 */
        .modal {
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

<form action="myProfileModUpdate.do" method="post">
${myPage.pro_idx}
    <input type="file" name="photos" multiple="multiple" value="사진 선택">
    
		<table>

			<tr>
				<th>내 강아지 이름</th>
				<th><input type="text" name="pro_dogName" value="${myPage.pro_dogName}"/></th>
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
				<th><button>등록 완료</button></th>
			</tr>
			<input type="hidden" name="charType_code" id="charType_code" value="" />
			
		</table>

	</form>

</body>
<script>
/* 
document.addEventListener("DOMContentLoaded", function () {
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

}); */
    </script>
</html>