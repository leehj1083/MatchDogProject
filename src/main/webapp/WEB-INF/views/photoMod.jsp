<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/chattingRoom.css"
	type="text/css">
<!-- bootstrap 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css"
	href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<!-- 페이징 처리를 위한 라이브러리 -->
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<style>
.input_img {
	display: none;
}

a, a:link, a:visited, a:active, a:hover {
	text-decoration: none;
	color: var(--black);
}

/* 본인 페이지 것으로 변경하기  */
.btn_gnb .bi-chat-dots-fill, .btn_gnb.chatting {
	color: var(--white);
	background-color: var(--green);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb:hover .bi-house-door-fill,
	/* .btn_gnb:hover .bi-chat-dots-fill, */ .btn_gnb:hover .bi-gear-fill,
	.btn_gnb:hover .bi-people-fill, .btn_gnb:hover .bi-person-circle,
	.btn_gnb:hover .bi-list-ul {
	background-color: var(--light);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb.home:hover, .btn_gnb.match:hover,
	/* .btn_gnb.chatting:hover, */ .btn_gnb.board:hover, .btn_gnb.myPage:hover,
	.btn_gnb.admin:hover {
	background-color: var(--light);
}

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

.write-link.attach{
  display: inline-block;
  position:relative;
  top:100px;
  right:20px;
  cursor: pointer;
  color:var(--green);
}

.bi-plus-circle-fill{
	font-size:33px;
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

.image-container img{
	display:inline-block;
	right:10px;
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
}

</style>
</head>
<body>
	<div class="photoModal">
		<div class="photoModal-content">
			<span class="photoTextSave">사진 등록</span>
			<span class="close">&times;</span>
				<div class="imgtable">
					
					<div id="imageContainer1" class="image-container"></div>
					<div class="filebox">
						<label for="file1">
							<span class="write-link attach bi bi-plus-circle-fill"></span>
						</label>
						<input type="file" class="input_img" id="file1" name="uploadFile" data-index="1" accept="image/*" multiple>
					</div>
	
					<div id="imageContainer2" class="image-container"></div>
					<div class="filebox">
						 <label for="file2">
							<span class="write-link attach bi bi-plus-circle-fill"></span>								 
						 </label>
						<input type="file" class="input_img" id="file2" name="uploadFile" data-index="2" accept="image/*" multiple>
					</div>
	
					<div id="imageContainer3" class="image-container"></div>
					<div class="filebox">
						<label for="file3">
							<span class="write-link attach bi bi-plus-circle-fill"></span>
						</label>
						<input type="file" class="input_img" id="file3" name="uploadFile" data-index="3" accept="image/*" multiple>
					</div>
	
					<div id="imageContainer4" class="image-container"></div>
					<div class="filebox">
						<label for="file4">
							<span class="write-link attach bi bi-plus-circle-fill"></span>
						</label>
						<input type="file" class="input_img" id="file4" name="uploadFile" data-index="4" accept="image/*" multiple>
					</div>
	
					<div id="imageContainer5" class="image-container"></div>
					<div class="filebox">
						<label for="file5">
							<span class="write-link attach bi bi-plus-circle-fill"></span>
						</label>
						<input type="file" class="input_img" id="file5" name="uploadFile" data-index="5" accept="image/*" multiple>
					</div>
	
					<div id="imageContainer6" class="image-container"></div>
					<div class="filebox">
						<label for="file6">
							<span class="write-link attach bi bi-plus-circle-fill"></span>
						</label>
						<input type="file" class="input_img" id="file6" name="uploadFile" data-index="6" accept="image/*" multiple>
					</div>
	
					<div id="imageContainer7" class="image-container"></div>
					<div class="filebox">
						<label for="file7">
							<span class="write-link attach bi bi-plus-circle-fill"></span>
						</label>
						<input type="file" class="input_img" id="file7" name="uploadFile" data-index="7" accept="image/*" multiple>
					</div>
	
					<div id="imageContainer8" class="image-container"></div>
					<div class="filebox">
						<label for="file8">
							<span class="write-link attach bi bi-plus-circle-fill"></span>
						</label>
						<input type="file" class="input_img" id="file8" name="uploadFile" data-index="8" accept="image/*" multiple>
					</div>
					
					<div id="imageContainer9" class="image-container"></div>
					<div class="filebox">
						<label for="file9">
							<span class="write-link attach bi bi-plus-circle-fill"></span>
						</label>
						<input type="file" class="input_img" id="file9" name="uploadFile" data-index="9" accept="image/*" multiple >
					</div>
				
				<a href="#"><span class="photo_selected">선택 완료</span></a>
			</div>
		</div>
	</div>
</body>

<script>

//  var photo_idfNum =${pro_idx};

var fileInputIds = ['#file1', '#file2', '#file3', '#file4', '#file5', '#file6', '#file7', '#file8', '#file9'];

fileInputIds.forEach(function (inputId) {
    $(inputId).on('change', function () {
        photoReview(this); // 해당 input 요소를 인자로 전달하여 photoReview 함수 호출
    });
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
	        	// console.log(files[i]);
	        	selectedFiles.push({ file: files[i], index: index });
	        }
	    });
	    
	    if (selectedFiles.length > 0) {
	        uploadFilesToDB(selectedFiles);
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
	            // console.log(data);
	        },
	        error: function (e) {
	            console.log(e);
	        }
	    });
	}

</script>
</html>