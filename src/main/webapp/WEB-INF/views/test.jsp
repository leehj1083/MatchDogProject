<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/test.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>

#input_img{
	display:none;
}

</style>
</head>
<body>
	<div class="wrapper">
    <div class="container">
        <div class="right">
            <div class="top">
            	<span>
            		To: <span class="name">Dog Woofson</span>
            	</span>
            </div>
            <div class="chat active-chat">
            </div>
            
            <!-- 파일 전송하기 전 모달창 띄우기 -->
			<div id="myModal" class="modal">
				<div class="modal-content">
					<span class="close" id="closeModal">&times;</span>
					<!-- 사진과 파일명 -->
					<div class="modalInfo">
					</div>
					<input class="modalSend" type="button" value="전송하기" />
				</div>
			</div>
			<!-- 채팅 입력창 -->
            <div class="write">
            	<label for="input_img">
            		<span class="write-link attach"></span>
                </label>
            	<input type="file" id="input_img" name="uploadFile" multiple accept="image/*" />
                <input type="text" class="text" name="content" />
                <button type="button" class="write-link send"></button>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
</body>
<script>

	var chat_idx = ${chat_idx};
	
	// 채팅방 내용 뿌리기
	$.ajax({
		type:'post',
		url:'chatRoomList.do',
		data:{'chat_idx' : chat_idx},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			drawList(data);
		},
		error:function(e){
			console.log(e);
		}
	});
	
	$('.send').on('click',function(){
		var content = $('input[name="content"]').val();
		
		$.ajax({
			type:'post',
			url:'chatSave.do',
			data:{'content':content,'chat_idx' : chat_idx},
			dataType:'JSON',
			success:function(data){
				console.log(data);
			},
			error:function(e){
				console.log(e);
			}
		});
	});
	
	
	function drawList(obj){
		var content = '';
		
		if(obj.totalMsg.length == 0){
			console.log('채팅방이 생성되었습니다.');
			content += '<div class="conversation-start">';
			content += '<span> 채팅방이 생성되었습니다 </span>';
			content += '</div>';
		}else{
			obj.totalMsg.forEach(function(item,idx){
				console.log("photo_fileName : "+item.photo_fileName);
				if(obj.toFrom.pro_me == item.pro_sendIdx){
					if(item.photo_fileName == ''){
						content +='<div class="bubble me">';
						content +=item.chatMsg_msg;
						content +='</div>';
					}else{
						content += '<div class="bubble me">';
						content += '<img src="/photo/'+item.photo_fileName+'" width="200" />'
						content += '</div>'
					}
				}else if(obj.toFrom.pro_me != item.pro_sendIdx){
					if(item.photo_fileName == ''){
						content +='<div class="bubble you">';
						content +=item.chatMsg_msg;
						content +='</div>';
					}else{
						content += '<div class="bubble you">';
						content += '<img src="/photo/'+item.photo_fileName+'" width="200" />'
						content += '</div>'
					}
				}
			});
		}
		$('.chat').empty();
		$('.chat').append(content);
	}
	
	// --------------------------사진 전송 -----------------------------
	// 사진 전송 전 모달창에 전송할 사진과 파일명 띄우기
	$('#input_img').on('change', photoReview);
	
	function photoReview() {
	    var files = this.files;
	    var filesArr = Array.prototype.slice.call(files);
	    var hasNonImage = false; // 초기에는 이미지가 아닌 파일이 없다고 가정
	    
	    // forEach 돌려서 파일 보여주기
	    filesArr.forEach(function (f) {
	        if (!f.type.match("image.*")) {
	            alert("이미지만 가능합니다.");
	            hasNonImage = true; // 이미지가 아닌 파일이 있는 경우 true로 설정
	            return;
	        }
	        
	        var reader = new FileReader();
			// 이미지가 있을 시 모달창에 사진 정보가 뜸
	        reader.onload = function (e) {
	            var content = '';
	            content += '<div class="image-container">';
	            content += '<img id="image-preview" src="' + e.target.result + '" />';
	            content += '</div>';
	            content += '<div class="file-info">';
	            content += '<p class="file-name">' + f.name + '</p>';
	            content += '</div>';
	            $('.modalInfo').append(content); 
	        }; 	        
	        reader.readAsDataURL(f);
	    });

	    if (hasNonImage) {
	        // 이미지가 아닌 파일이 있으면 모달창을 닫습니다
	        $('#myModal').css('display', 'none');
	    } else {
	        $('#myModal').css('display', 'flex');
	    }

	}	
	
	
	// 사진업로드 수행
	$(".modalSend").on("click",photoUpload);
	
	// 모달창 닫을때
	$('#closeModal').on('click', function () {
	    resetInputFile(); // 파일 선택 상자를 초기화하기 위해 함수를 호출
	    $('.modalInfo').empty();
	    $('#myModal').css('display', 'none');
	    
	    
	});
	
	function resetInputFile() {
	    var inputFile = $("input[name='uploadFile']");
	    inputFile.val(''); // 파일 선택 상자의 값을 초기화
	}
	
	
	function photoUpload(){
		    $('.modalInfo').empty();
		    $('#myModal').css('display', 'none');
	        //FormData : 가상의 <form>태그
	        //Ajax를 이용하는 파일 업로드는 FormData를 이용해서
	        var formData = new FormData();
	        //<input type="file" name="uploadFile" multiple /> 찾아가기
	        var inputFile = $("input[name='uploadFile']");
	        //<input type="file"> 요소 내의 이미지들
	        var files = inputFile[0].files;
	        
		    //console.log("inputFile");
		    //console.log(inputFile.val);
	        
	        for(var i=0; i<files.length; i++){
	        	formData.append("photo", files[i]);
	        }
	        
	        formData.append("chat_idx", chat_idx);
  
	        //processData, contentType은 반드시 false여야 전송됨
	        $.ajax({
	        	type: 'post',
	        	url : 'chatPhoto.do',
	            data : formData,
	            processData : false,
	            contentType : false,
	            success : function(data){
	            	console.log(data);
	            },
	            error: function(e){
	            	console.log(e);
	            }
	        });
	}
	
	
/* let friends = {
    list: document.querySelector('ul.people'),
    all: document.querySelectorAll('.left .person'),
    name: ''
  },
  chat = {
    container: document.querySelector('.container .right'),
    current: null,
    person: null,
    name: document.querySelector('.container .right .top .name')
  }

friends.all.forEach(f => {
  f.addEventListener('mousedown', () => {
    f.classList.contains('active') || setAciveChat(f)
  })
});

function setAciveChat(f) {
  friends.list.querySelector('.active').classList.remove('active')
  f.classList.add('active')
  chat.current = chat.container.querySelector('.active-chat')
  chat.person = f.getAttribute('data-chat')
  chat.current.classList.remove('active-chat')
  chat.container.querySelector('[data-chat="' + chat.person + '"]').classList.add('active-chat')
  friends.name = f.querySelector('.name').innerText
  chat.name.innerHTML = friends.name
}; */
</script>
</html>