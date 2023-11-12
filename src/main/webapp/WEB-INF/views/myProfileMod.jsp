<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.btn_gnb.myPageInfo:hover{
	background-color: var(--light);
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
				<a href="./alarmList.go" class="alarm"><span class="bi bi-bell-fill"></span></a>
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
			<div class="my_profile_h3">마이 페이지</div>
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
		
		<div class="content">


			<span class="my_profile_h4">${MyProfileMod.pro_dogName}</span>
			<span class="my_profile_h4 black">님의 프로필 페이지</span>
			
			<form action="myProfileModUpdate.do" method="post" enctype="multipart/form-data">
			<!-- 		<input type="file" name="photos" multiple="multiple" value="사진 선택"> -->
			<input type="hidden" name="pro_idx" value="${MyProfileMod.pro_idx}">
					<c:set var="minPhotoId" value="9999" />
						<c:set var="minFileName" value="" />
							<c:forEach items="${MyProfileMod.photoList}" var="photo" varStatus="loop">
			    				<c:if test="${photo.photo_id < minPhotoId}">
			       		 			<c:set var="minPhotoId" value="${photo.photo_id}" />
			       					<c:set var="minFileName" value="${photo.photo_fileName}" />
									<div><img src="/photo/${minFileName}" class="profilePhoto"/></div>
			    				</c:if>
							</c:forEach>
							
				
							<!-- 사진 선택  -->
							<div class="openPhotoModal">
								<span class="openPhotoModalIcon bi bi-plus-circle-fill"></span>
							</div>
							<!-- 사진 모달창 -->
							<div class="photoModalPopUp">

								<div class="photoModal">
									<div class="photoModal-content">
										<span class="photoTextSave">사진 등록</span>
										<span class="close">&times;</span>
											<div class="imgtable">
												
												<c:forEach begin="1" end="9" var="i">
												    <div id="imageContainer${i}" class="image-container"></div>
												    <div class="filebox">
												      <span class="fileContent">
												        <label for="file${i}">
												          <span class="bi bi-plus-circle-fill"></span>
												        </label>
												        <input type="file" class="input_img" id="file${i}" name="uploadFiles" data-index="${i}" accept="image/*" multiple>
												      </span>
												      <span class="bi bi-dash-circle-fill"></span>
												    </div>
												    <input type="hidden" name="dataIndex" value="${i}">
												  </c:forEach>
											
											<span class="photo_selected">선택 완료</span>
										</div>
									</div>
								</div>

							</div>
							
							
					
							<%-- <p>내 강아지 사진들</p>
						
						<c:forEach items="${MyProfileMod.photoList}" var="photo" varStatus="loop">
						   ${photo.photo_id} 
						   ${photo.photo_type}
						   ${photo.photo_idfNum}
						   ${photo.photo_fileName}
						   ${photo.photo_uploadDate}
						   <c:if test="${!loop.last}">, </c:if>
						</c:forEach> --%>
			
							<div class="myProfileContent">
							
								<div class="dogName menu">
									<div class="dog_text">내 강아지 이름</div>
									<input type="text" name="pro_dogName" value="${MyProfileMod.pro_dogName}" />
								</div>
								
								<div class="dogBreed menu">
									<div class="dog_text">내 강아지 견종</div>
									<select name="breedType_code">
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
								</div>
								
								<div class="dogAge menu">
									<div class="dog_text">내 강아지 나이</div>
									<select name="pro_dogAge">
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
									</select>
								</div>
								
								<div class="dogGender menu">
									<div class="dog_text">내 강아지 성별</div>
									<select name="pro_dogGender">
										<option value="남"
												${MyProfileMod.pro_dogGender eq '남' ? 'selected' : ''}>남아</option>
											<option value="여"
												${MyProfileMod.pro_dogGender eq '여' ? 'selected' : ''}>여아</option>
									</select>
								</div>
								
								<div class="dogCharType menu">
									<div class="dog_text">내 강아지 성향</div>
									<div id="re_selectedCharTypes">
				   						 <button type="button" id="openCharModal">선택하기</button>
									</div>
								</div>
								
								<div class="dogCharType menu">
									<div class="dog_text"> </div>
									<div id="selectedCharTypes">
										<c:forEach items="${MyProfileMod.charTypeList}" var="charType" varStatus="loop">
					        					${charType.charType}
					        				<input type="hidden" name="charTypeCodes" value="${charType.charType_code}" />
					        				<c:if test="${!loop.last}">&nbsp;&nbsp;</c:if>
				   						 </c:forEach>
									</div>
								</div>
								
								<div class="dogDesc menu">
									<div class="dog_text">내 강아지 소개</div>
									<textarea class="pro_dogDesc" name="pro_dogDesc" spellcheck="false">
										${MyProfileMod.pro_dogDesc}
									</textarea>
								</div>
								
							</div>

							<!-- 강아지 성향 팝업 -->
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

							<button class="cancelEdit" type="button" onclick="location.href='./myProfileList.do'">수정 취소</button>
					 		<button class="cancelComp">수정 완료</button>
					 		
			</form>
		</div>
	</div>
</div>	
	
</body>
<script>
//성향 모달 스크립트
var charModal = $(".charModal");
var openCharModal = $("#openCharModal");
var closeCharModal = $("#closeCharModal");

$('.photoModal').css('display','none');

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
        selectedCharTypes.html(selectedValues.join("&nbsp;&nbsp;"));
        // 선택된 성향값 확인
        //console.log("선택된 성향값: " + selectedValues.join(", "));
        charModal.css("display", "none");
    }
});





//포토 모달 스크립트
$('.openPhotoModal').on('click',function () {

	var pro_idx = ${MyProfileMod.pro_idx};
	
	console.log(pro_idx);
	
	$.ajax({
        type: 'post',
        url: 'photoUpload.do',
        data: {"pro_idx":pro_idx},
        dataType:'JSON',
        success: function (data) {
			
        	var photos = data.photos;
        	var index = [];
        	
			for (var i = 0; i < photos.length; i++) {
	            var parts = photos[i].split('_'); // "_"를 기준으로 문자열을 나눕니다
	            console.log(parts);
	            if (parts.length >= 2) {
	                var indices = parts[1].split('.')[0]; // 첫 번째 부분을 가져오고 확장자 부분을 제거합니다
	                index.push(indices);
	            } else {
	                index.push(null); // 적절한 형식이 아닐 경우 null을 배열에 추가
	            }
	        }
			
			for (var i = 0; i < photos.length; i++) {
	        	console.log("찾으려는거!"+photos[i]);
	        	console.log("찾으려는거!"+index[i]);
	        	
	        	var parentContainer = $('#file'+index[i]).closest('.filebox').prev('.image-container');
				var content = '';
				content += '<img class="photoList" src="/photo/' + photos[i] + '" />';
				parentContainer.html(content);  
	        }
			
			var fileInput = $('#file' + index[i]);
			console.log(fileInput);
			handleFilePhotoChange(fileInput);
				
	
			    
            // 가져온 정보를 기반으로 모달에 이미지 추가
 /*            if (data && data.length > 0) {
                data.forEach(function (photo) {
                    var imageContainer = $('#imageContainer' + photo.index);

                    // 이미지를 생성하고 추가
                    var img = document.createElement('img');
                    img.src = '/path/to/your/photo/folder/' + photo.fileName; // 이미지 경로를 수정하세요.
                    imageContainer.empty().append(img);

                    // 기존 파일 입력 상자 업데이트
                    var fileInput = $('#file' + photo.index)[0];
                    fileInput.value = ''; // 파일 선택 초기화
                    handleFileInputChange(fileInput);
                });
            } */
        },
        error: function (e) {
        	console.log(e);
            console.log('서버에서 사진 정보를 가져오지 못했습니다.');
        }
    });
	
	$('.photoModal').css('display','inline-block');
});

function handleFilePhotoChange(input) {
    var filebox = $(input).closest('.filebox');
    var label = filebox.find('.fileContent');
    var dashIcon = filebox.find('.bi-dash-circle-fill');

    label.css('display', 'none');
    dashIcon.css('display', 'inline-block');

	}


var fileInputIds = ['#file1', '#file2', '#file3', '#file4', '#file5', '#file6', '#file7', '#file8', '#file9'];

fileInputIds.forEach(function (inputId) {
    $(inputId).on('change', function () {
        photoReview(this); // 해당 input 요소를 인자로 전달하여 photoReview 함수 호출
        handleFileInputChange(this);
    });
});

// 파일 선택 전에는 + 고 파일 선택 시 삭제하게 만드는 버튼 나타나게...
function handleFileInputChange(input) {
	  var label = $(input).closest('.filebox').find('.fileContent');
	  var plusIcon = label.find('.bi-plus-circle-fill');
	  var dashIcon = $(input).closest('.filebox').find('.bi-dash-circle-fill');

	  if (input.files.length > 0) {
	    label.css('display', 'none');
	    dashIcon.css('display', 'inline-block');
	  } else {
	    label.css('display', 'inline-block');
	    dashIcon.css('display', 'none');
	  }
	}
	
// 파일객체 삭제하는 버튼 누르면 삭제
$('.bi-dash-circle-fill').on('click', function () {
    var fileInput = $(this).closest('.filebox').find('.input_img')[0];
    fileInput.value = ''; // 파일 선택을 초기화
    handleFileInputChange(fileInput);
    
    var parentContainer = $(fileInput).closest('.filebox').prev('.image-container');
    parentContainer.html('');
});


// 함수들....
 function photoReview(input) {
	 	var files = input.files;
	    var filesArr = Array.prototype.slice.call(files);
	    var hasNonImage = false; // 초기에는 이미지가 아닌 파일이 없다고 가정
	    
	    // 현재 선택된 input의 부모 요소를 찾음
	    var parentContainer = $(input).closest('.filebox').prev('.image-container');
	    
	    // forEach 돌려서 파일 보여주기
	    filesArr.forEach(function (f) {
	        if (!f.type.match("image.*")) {
	            alert("이미지만 가능합니다.");
	            hasNonImage = true; // 이미지가 아닌 파일이 있는 경우 true로 설정
	            return;
	        }
	        
	        // 파일이 1개만 선택되도록 함
	        if (files.length !== 1) {
	            alert("하나의 이미지만 선택해주세요.");
	            return;
	        }
	        
	        var reader = new FileReader();
	        // 이미지가 있을 시 모달창에 사진 정보가 뜸
	        $(reader).on('load', function (e) {
			    var content = '';
			    content += '<img src="' + e.target.result + '" />';
			    parentContainer.html(content); // 해당 input에 대한 이미지 컨테이너에 이미지 추가
			});
	        reader.readAsDataURL(f); // 파일을 데이터 URL로 읽기.
	    });

	    if (hasNonImage) {
	        // 이미지가 아닌 파일이 있으면 모달창을 닫습니다
	        $('.photoModal').css('display', 'none');
	    } else {
	        $('.photoModal').css('display', 'inline-block');
	    }
	}
	
 $('.photo_selected').on('click', function () {
	    var selectedInput = $(this).closest('.photoModal-content').find('input[type="file"]');
	    var selectedFiles = [];
	    
	    selectedInput.each(function () {
	        // 각 파일 상자에서 선택된 파일들을 가져와 배열에 추가
	        var files = this.files;
	        var index = $(this).data('index');
	        for (var i = 0; i < files.length; i++) {
	        	console.log("찾으려는거!"+files[i]);
	        	console.log("찾으려는거!"+index);
	        	selectedFiles.push({ file: files[i], index: index });
	        }
	    });
	   
	    if (selectedFiles.length > 0) {
	        //uploadFilesToDB(selectedFiles);
		    $('.photoModal').css('display', 'none');
	    } else {
	        alert('사진은 1개 이상 무조건 선택해주세요!');
	    }
	    
	});
	
	
// 모달창 닫을때
$('.close').on('click', function () {
    resetInputFile(); // 파일 선택 상자를 초기화하기 위해 함수를 호출
    $('.image-container').empty();
    $('.photoModal').css('display', 'none');
});

function resetInputFile() {
    var inputFile = $("input[name='uploadFile']");
    console.log(inputFile.val());
    inputFile.val(''); // 파일 선택 상자의 값을 초기화
}


/* var sendData = [];

 function uploadFilesToDB(selectedFiles) {
	 
	    $('.photoModal').css('display', 'none');
	    
	    var formData = new FormData();
	    
	    for (var i = 0; i < selectedFiles.length; i++) {
	        var file = selectedFiles[i].file;
	        var index = selectedFiles[i].index;
	        
	        console.log("파일"+file);
	        console.log("인덱스 : "+index);

	        formData.append("files", file); // "file" 키로 파일 추가
	        formData.append("index", index); // "index" 키로 인덱스 추가
	    }
	    
	    $.ajax({
	        type: 'post',
	        url: 'photoUpload.do',
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function (data) {
	            console.log(data);
	            data.newFileName.forEach(function(item,idx){
	            	sendData.push(item);
	            });
	        },
	        error: function (e) {
	            console.log(e);
	        }
	    });
	}*/




</script>
</html>