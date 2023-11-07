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

.PhotoModal {
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

/* .PhotoModal.active .modal-content {
	display: block;
	
} */

.PhotoModal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 70%;
}




</style>
</head>
<body>
<h3>${MyProfileMod.pro_dogName} 님의 프로필 페이지</h3>
<c:url value="/logout" var="logoutUrl" />
<a href="${logoutUrl}">로그아웃</a>
<br></br>
<c:url value="/myPage" var="myPageUrl" />
<a href="${myPageUrl}">회원정보</a>
<br></br>
	<a href="./myProfile">프로필</a>
	<br></br>
	<a href="./myPageMod">수정하기</a>
	<br></br>
 	<br></br>

	<form action="myProfileModUpdate.do" method="post">
<!-- 		<input type="file" name="photos" multiple="multiple" value="사진 선택"> -->
<input type="hidden" name="pro_idx" value="${MyProfileMod.pro_idx}">
		<c:set var="minPhotoId" value="9999" />
			<c:set var="minFileName" value="" />
				<c:forEach items="${MyProfileMod.photoList}" var="photo" varStatus="loop">
    				<c:if test="${photo.photo_id < minPhotoId}">
       		 			<c:set var="minPhotoId" value="${photo.photo_id}" />
       					 <c:set var="minFileName" value="${photo.photo_fileName}" />
    				</c:if>
				</c:forEach>
		<p>photo_id가 가장 낮은 photo_fileName(대표 사진): ${minFileName}</p>

		<input type="button" name="imgBtn" id="openPhotoModal" value="사진 선택">
		<div id="PhotoModal" class="PhotoModal">
    <div class="PhotoModal-content">
  	  <span id="closePhotoModal" style="float: right; cursor: pointer;">&times;</span>
        <!-- 모달 내용 추가 -->
        <h3>사진 수정 팝업창</h3>
        <table id = "imgtable">
        <tr>
        <td>
       <div id="imageContainer1" class="image-container"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file1">사진추가</label> 
    <input type="file" id="file1" name="photos">
</div>
        </td>
        <td>
       <div id="imageContainer2" class="image-container"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file2">사진추가</label> 
    <input type="file" id="file2" name="photos2">
</div>
        </td>
        <td>
       <div id="imageContainer3" class="image-container"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file3">사진추가</label> 
    <input type="file" id="file3" name="photos3">
</div>
        </td>
        </tr>        
        <tr>
        <td>
      <div id="imageContainer4" class="image-container"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file4">사진추가</label> 
    <input type="file" id="file4" name="photos4">
</div>
        </td>
        <td>
       <div id="imageContainer5" class="image-container"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file5">사진추가</label> 
    <input type="file" id="file5" name="photos5">
</div>
        </td>
        <td>
        <div id="imageContainer6" class="image-container"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file6">사진추가</label> 
    <input type="file" id="file6" name="photos6">
</div>
        </td>
        </tr>
        <tr>
        <td>
        <div id="imageContainer7" class="image-container"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file7">사진추가</label> 
    <input type="file" id="file7" name="photos7">
</div>
        </td>
        <td>
       <div id="imageContainer8" class="image-container"></div>
<div class="filebox">
    <input class="upload-name" value="image name" placeholder="image name">
    <label for="file8">사진추가</label> 
    <input type="file" id="file8" name="photos8">
</div>
        </td>
        <td>
        <div id="imageContainer9" class="image-container"></div>
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
<p>내 강아지 사진들</p>
			
			<c:forEach items="${MyProfileMod.photoList}" var="photo" varStatus="loop">
   ${photo.photo_id} 
   ${photo.photo_type}
   ${photo.photo_idfNum}
   ${photo.photo_fileName}
   ${photo.photo_uploadDate}
   <c:if test="${!loop.last}">, </c:if>
</c:forEach>


		<table>
			<tr>
				<th>내 강아지 이름</th>
				<th><input type="text" name="pro_dogName"
					value="${MyProfileMod.pro_dogName}" /></th>
			</tr>

			<tr>
				<th>내 강아지 견종</th>
				<td>
<%-- 					<input type="text" name="bon_breedType_code" value="${MyProfileMod.breedType}"> --%>
					<%-- ${MyProfileMod.breedType} --%> <select name="breedType_code">
						<c:forEach items="${breedTypeList}" var="breed">
							<c:choose>
								<c:when test="${MyProfileMod.breedType == breed.breedType}">
									<option value="${MyProfileMod.breedType_code}" selected="selected">${MyProfileMod.breedType}</option>
								</c:when>
								<c:otherwise>
									<option value="${breed.breedType_code}">${breed.breedType}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<th>내 강아지 나이</th>
				<td><select name="pro_dogAge">
						<c:forEach var="i" begin="0" end="30">
							<c:choose>
								<c:when test="${i == MyProfileMod.pro_dogAge}">
									<option value="${i}" selected="selected">${i}</option>
								</c:when>
								<c:otherwise>
									<option value="${i}">${i}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</select></td>
			</tr>

			<tr>
				<th>내 강아지 성별</th>
				<td><select name="pro_dogGender">
						<option value="남"
							${MyProfileMod.pro_dogGender eq '남' ? 'selected' : ''}>남아</option>
						<option value="여"
							${MyProfileMod.pro_dogGender eq '여' ? 'selected' : ''}>여아</option>
				</select></td>
			</tr>
			<tr>
				<th>내 강아지 성향</th>
				<td id="selectedCharTypes"><c:forEach items="${MyProfileMod.charTypeList}" var="charType" varStatus="loop">
        ${charType.charType} (${charType.charType_code})
        <input type="text" name="charTypeCodes" value="${charType.charType_code}" />
        <c:if test="${!loop.last}">, </c:if>
    </c:forEach>
					
					</td>
					
					<td><button type="button" id="openCharModal">선택하기</button>
					</td>

			</tr>
			
			<tr>
			<td colspan="2">
				<div id="charModal" class="charModal" >
					<div class="charModal-content">
						<span id="closeCharModal" style="float: right; cursor: pointer;">&times;</span>
						내 강아지 성향을 선택해주세요
						<c:forEach items="${charTypeList}" var="charTypeList">
						<p>
							<input type="checkbox" name="selectedCharTypesCode" value="${charTypeList.charType_code}" data-char-type="${charTypeList.charType}" charType_code="${charTypeList.charType_code}" />
							${charTypeList.charType}
						</p>
				</c:forEach>
			<button type="button" id="submitForm">선택 완료</button>
		</div>
	</div>
			</td>
			</tr>
			
			<tr>
				<th>내 강아지 소개 :</th>
				<td><textarea name="pro_dogDesc" spellcheck="false">${MyProfileMod.pro_dogDesc}
				</textarea></td>
			</tr>
			<tr>
			<!-- 			<input type="hidden" name="charType_code" id="charType_code" value="" /> -->
		</table>
		<input type="button" onclick="location.href='./myProfileList.do'" value="수정 취소"/>
 		<input type="submit" value="수정 완료"/>
	</form>
	
	
 
<!-- <input type="hidden" name="selectedCharTypes" id="selectedCharTypesInput" value=""> -->
	

	
	
	
	
	
</body>
<script>
//성향 모달 스크립트
var charModal = $(".charModal");
var openCharModal = $("#openCharModal");
var closeCharModal = $("#closeCharModal");

$('select[name="breedType_code"]').on('change',function(){
	var i = $('option[selected="selected"]').val();
	console.log("선택한 강아지 : "+i);
	
});



openCharModal.click(function() {
	charModal.css("display", "block");

});

closeCharModal.click(function() {
	charModal.css("display", "none");
});

// "선택 완료" 버튼을 클릭했을 때 필요한 작업 후 모달 창 닫기
var submitFormButton = $("#submitForm");
submitFormButton.on("click", function (e) {
    var selectedOptions = $('input[type="checkbox"]:checked');
    var selectedValues = [];
    var selectedValuesCode = [];
    console.log(selectedValues);
    console.log(selectedValuesCode);
    
    selectedOptions.each(function () {
        var charType = $(this).data("char-type");
        selectedValues.push(charType);

        var charType_code = $(this).attr("charType_code");
        selectedValuesCode.push(charType_code);
    });
    
    if (selectedValues.length !== 4) {
        alert("성향을 4개 선택해주세요");
    } else {
        
		// 선택한 성향 값 html 에 대응하기
        var selectedCharTypes = $("#selectedCharTypes");
        selectedCharTypes.html(selectedValues.join(", "));
        // 선택된 성향값 확인
        console.log("선택된 성향값: " + selectedValues.join(", "));
        charModal.css("display", "none");
    }
});




//사진 모달 스크립트
var PhotoModal = $(".PhotoModal");
var openPhotoModal = $("#openPhotoModal");
var closePhotoModal = $("#closePhotoModal");

openPhotoModal.click(function() {
    PhotoModal.css("display", "block");

    <c:forEach items="${MyProfileMod.photoList}" var="photo" varStatus="loop">
        var container = document.querySelector(`#imageContainer${loop.index + 1}`);
        
        var photo_id = "${photo.photo_id}";
        console.log(photo_id);
        var photo_type = "${photo.photo_type}";
        console.log(photo_type);
        var photo_idfNum = "${photo.photo_idfNum}";
        console.log(photo_idfNum);
        var photo_fileName = "${photo.photo_fileName}";
        console.log(photo_fileName);
        var photo_uploadDate = "${photo.photo_uploadDate}";
        console.log(photo_uploadDate);
        // 이미지 파일 이름을 이미지 컨테이너에 표시합니다
        var infoText =
            `Photo ID: ${photo_id}<br>
            Type: ${photo_type}<br>
            IDfNum: ${photo_idfNum}<br>
            File Name: ${photo_fileName}<br>
            Upload Date: ${photo_uploadDate}`;
            container.innerHTML = infoText;
        </c:forEach>
    });





closePhotoModal.click(function() {
	PhotoModal.css("display", "none");
});


</script>
</html>