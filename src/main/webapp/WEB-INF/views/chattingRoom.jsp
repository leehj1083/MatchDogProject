<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/chattingRoom.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>

#input_img{
	display:none;
}

/* 본인 페이지 것으로 변경하기  */
.btn_gnb .bi-chat-dots-fill, .btn_gnb.chatting{
    color: var(--white);
    background-color: var(--green);
}


/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb:hover .bi-house-door-fill,
/* .btn_gnb:hover .bi-chat-dots-fill, */
.btn_gnb:hover .bi-gear-fill,
.btn_gnb:hover .bi-people-fill,
.btn_gnb:hover .bi-person-circle,
.btn_gnb:hover .bi-list-ul {
    background-color: var(--light);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb.home:hover,
.btn_gnb.match:hover,
/* .btn_gnb.chatting:hover, */
.btn_gnb.board:hover,
.btn_gnb.myPage:hover,
.btn_gnb.admin:hover{
	background-color: var(--light);
}

</style>
</head>
<body>

<div id="wrap">
	<div class="banner">
		<div class="header">
			<h1 class="logo">
				<a href="./"><img src="/photo/logo.png" class="logo_matchDog"/></a>
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
				<a href="./" class="btn_gnb home">
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
		<div class="content">
			<div class="container">
        		<div class="right">
		            <a href="/" class="review bi-hand-thumbs-up-fill"></a>
		            <a href="/" class="chatComp bi bi-exclamation-triangle-fill"></a>
	            	<div class="top">
	            	</div>
	            	<div class="chat active-chat">
	            	</div>
            
		            <!-- 파일 전송하기 전 모달창 띄우기 -->
					<div id="myModal" class="modal">
						<div class="modal-content">
							<span class="close" id="closeModal">&times;</span>
							<!-- 사진과 파일명 -->
							<div class="modalInfo"></div>
							<input class="modalSend" type="button" value="전송하기" />
						</div>
					</div>
					<!-- 채팅 입력창 -->
		            <div class="write">
		            	<label for="input_img">
		            		<span class="write-link attach bi bi-image"></span>
		                </label>
		            	<input type="file" id="input_img" name="uploadFile" multiple accept="image/*" />
		                <input type="text" class="text" name="content" />
		                <button type="button" class="write-link send bi bi-send"></button>
		                <div class="clearfix"></div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</div>
</body>
<script>



	var chat_idx = ${chat_idx};

	function longPolling(){
			$.ajax({
				type:'post',
				url:'chatRoomList.do',
				data:{'chat_idx' : chat_idx},
				dataType:'JSON',
				success:function(data){
					drawList(data);
					//setTimeout(longPolling, 3000);
				},
				timeout:3000,
				error:function(e){
					console.log(e);
					//setTimeout(longPolling, 3000);
				}
			});
		}

	/* $('#chatlist').scrollTop(('#chatlist'))[0].scrollheight);
	
	function getInfiniteChat(){
		setInterval(function(){
			chatListFunction(lastID);
		}, 3000); 함수 만들고 
		$(document).ready(function(){
			chatListFunction(ten);
			getInfiniteChat()
			}))
	} */
	
	function drawList(obj){
		var top = '';
		var content = '';
		var date = new Date();
		
		top += '<span>'
		top += 'To : <span class="name">'+obj.dogName+'</span>'
		top += '</span>'
		$('.top').empty();
		$('.top').append(top);
		
		if(obj.totalMsg.length == 0){
			$('.review').css("color", "var(--grey)");
			$('.review').css("cursor", "auto");
			$('.review').on('click',function(e){
				e.preventDefault();
			});
		}else{
			$('.review').css("color", "var(--blue)");
		}
		
		if(obj.totalMsg.length == 0){
			$('.chatComp').css("color", "var(--grey)");
			$('.chatComp').css("cursor", "auto");
			$('.chatComp').on('click',function(e){
				e.preventDefault();
			});
		}else{
			$('.chatComp').css("color", "var(--red)");
		}
		


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
 						content += '<div>';
						content += item.regDate;
						content += '</div>';
					}else{
						content += '<div class="bubble me">';
						content += '<img src="/photo/'+item.photo_fileName+'" width="200" />';
						content += '</div>';

					}
				}else if(obj.toFrom.pro_me != item.pro_sendIdx){
					if(item.photo_fileName == ''){
						content +='<div class="bubble you">';
						content +=item.chatMsg_msg;
						content +='</div>';

					}else{
						content += '<div class="bubble you">';
						content += '<img src="/photo/'+item.photo_fileName+'" width="200" />';
						content += '</div>';

					}
				}
			});
		}
		$('.chat').empty();
		$('.chat').append(content);
	}
	
	// 채팅내용 보내기
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
	
	longPolling();
	
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