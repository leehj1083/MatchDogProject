<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <style>
	/* 스타일을 추가할 부분 */
	body {
	    font-family: 'Arial', sans-serif;
	    margin: 0;
	    padding: 0;
	    text-align: center;
	}

	.modalcontainer {
		max-width: 800px;
		position: relative;
		top: -595px;
		left: 223px;
		z-index: 2;
		margin: 20px auto;
		background-color: #f4f4f4; /*모달 배경 색상변경*/
		padding: 20px;
		border-radius: 8px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}

	#image {
	    max-width: 300px;
	    height: 200px;
	    border-radius: 8px;
	    margin-bottom: 20px;
	}
	
	.text-overlay {
	    position: absolute;
	    top: 10px;
	    left: 10px;
	    background-color: rgba(255, 255, 255, 0.8);
	    color: black;
	    padding: 5px;
	    border-radius: 5px;
	}
	.closeButton {
	    float: right;
	    cursor: pointer;
	    font-size: 40px;
	}
    </style>
</head>
<body>
    <div class="modalcontainer">
        <span class="closeButton" onclick="closeModal()">&times;</span>
        <div>
            <img id="image">
            <div class="text-overlay">${map.member_dongAddr}</div>
        </div>
        <button id="prevImg" style="display:none;">이전</button>
        <button id="nextImg" style="display:none;">다음</button>
        <br>
		<div>		
			<p>강아지 이름: ${map.pro_dogName}</p>
			<p>견종: ${map.breed}</p>
        	<p id="ProdogAge"></p>
			<p id="ProdogGender"></p>
			<c:if test="${map.pro_dogScore > 5}"> <!-- 테스트를 위해 5이상이면 매너견!!과 함께 점수를 보여줌 -->
				<p>강아지 추천수: ${map.pro_dogScore} (매너견이에요!!)</p>
			</c:if>
			<p>강아지 성향: ${map.characteristics}</p>
			<hr>
			<p>견주 닉네임: ${map.member_nickName}</p>
			<p>견주 성별: ${map.member_gender}</p>
			<p>소개글: ${map.pro_dogDesc}</p>
		</div>
    </div>
</body>
<script>
	var matchingPtData = []; // 매칭 데이터 배열
	var currentPtIndex = 0; // 현재 표시 중인 데이터 인덱스
	var pro_idx = ""; 
	var currentPtMatch = "";
	var HiddenAge = "";
	var HiddenGnd = "";
	// 페이지 로딩 시 데이터 가져오기
	matchingPhoto();
	proOpen();
	
	// 모달창 닫기
    function closeModal() {
        $(".modalcontainer").hide();
    }
    
	// 매칭 리스트
	function matchingPhoto() {
		pro_idx = ${map.pro_idx}
	    $.ajax({
	        type: 'get',
	        url: 'memberDetailPhoto.do',
	        data: {pro_idx: pro_idx},
	        dataType: 'json',
	        success: function (data) {
	            console.log(data);
	            console.log("성공");
	            matchingPtData = data.list;
				console.log("matchingPtData : "+matchingPtData);
	            // 페이지 로딩 시 첫 번째 매칭 데이터 표시
				showmatchingPhotoData(currentPtIndex);	        
	        },
	        error: function (e) {
	            console.log(e);
	            console.log("실패");
	        }
	    });
	}
	
	function showmatchingPhotoData(index) {
		var currentPtMatch = matchingPtData[index];
	    // 데이터가 없는 경우 처리
	    if (!currentPtMatch) {
	        console.log("데이터가 아직 로드되지 않았습니다.");
	        return;
	    }
	    var matchingList = currentPtMatch;
		
	    // 각 데이터에 대한 처리
		$('#image').attr('src', '/photo/' + matchingList.photo_fileName);
	    $('#image').attr('alt', matchingList.photo_fileName);
	    console.log("사진들: " + currentPtMatch);
	    
        if (matchingPtData.length > 1) {
            $('#prevImg').show();
            $('#nextImg').show();
        }
	}
	
	// 다음 버튼 클릭 시 다음 매칭 데이터 표시
	$('#nextImg').click(function (e) {
		e.stopPropagation(); // 모달의 영향을 받지 않도록 이벤트 전파 막기
	    console.log("다음 버튼");
        currentPtIndex = (currentPtIndex + 1) % matchingPtData.length;
        showmatchingPhotoData(currentPtIndex);
	});

	// 이전 버튼 클릭 시 이전 매칭 데이터 표시
	$('#prevImg').click(function (e) {
		e.stopPropagation(); // 모달의 영향을 받지 않도록 이벤트 전파 막기
	    console.log("이전 버튼");
	    currentPtIndex = (currentPtIndex - 1 + matchingPtData.length) % matchingPtData.length;
	    showmatchingPhotoData(currentPtIndex);
	});
	
	function proOpen(){
		pro_idx = ${map.pro_idx}
		
		$.ajax({
		    type: 'get',
		    url: 'MatchingProOpen.do',
		    data: {pro_idx: pro_idx},
		    dataType: 'json',
		    success: function (data) {
		        console.log(data);
		        if (data.list && data.list.length > 0){    	
		            console.log("첫번째 숨김여부"+data.list[0].open_hide);
		            HiddenAge = data.list[0].open_hide;
			        console.log("두번째 숨김여부"+data.list[1].open_hide);
			        HiddenGnd = data.list[1].open_hide;
		        }else{
		        	console.log("데이터가 없습니다");
		        	HiddenAge = "";
		        	HiddenGnd = "";
		        }
		        if (HiddenAge !== "") {
		            if (HiddenAge == 'N') {
		                $('#ProdogAge').text('강아지 나이: ' + ${map.pro_dogAge});
		            } else {
		                $('#ProdogAge').text('강아지 나이: ' + '(비공개)');
		            }
		        } else {
		            $('#ProdogAge').text('강아지 나이: ' + ${map.pro_dogAge});
		        }
		        if (HiddenGnd !== "") {
		            if (HiddenGnd == 'N') {
		                $('#ProdogGender').text('강아지 성별: ' + ${map.pro_dogGender});
		            } else {
		                $('#ProdogGender').text('강아지 성별: ' + '(비공개)');
		            }
		        } else {
		            $('#ProdogGender').text('강아지 성별: ' + ${map.pro_dogGender});
		        }
		    },
		    error: function (e) {
		        console.log(e);
		        console.log("실패");
		    }
		});
	}
	
</script>
</html>
