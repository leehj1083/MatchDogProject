<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 --> <style>
 /* 추가한 CSS 스타일 */
.row {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around; /* 카드들을 가로로 나란히 정렬 */
}

.col {
    flex: 0 0 48%; /* 각 카드의 폭을 조절, 원하는 크기로 변경 가능 */
    margin-bottom: 20px; /* 각 카드 사이에 간격을 주기 위한 여백 */
}

/* .plusCard-header와 .premiumCard-header의 높이를 조절 */
.plusCard-header,
.premiumCard-header {
    height: 80px; /* 원하는 높이로 변경 가능 */
}
 
 
 body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f8f9fa;
            height: 200px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .card {
        	margin-top: 20px;
            width: 100%;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            height: 350px;
        }

		.plusCard-header {
            background-color: #FF6347;
            color: #fff;
            text-align: center;
            padding: 20px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }
        .premiumCard-header {
            background-color: #DAA520;
            color: #fff;
            text-align: center;
            padding: 20px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .card-body {
            padding: 20px;
            text-align: center;
        }

        .pricing-card-title {
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .list-unstyled {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .list-unstyled li {
            margin-bottom: 10px;
        }

        .plusSubsB {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #FF6347;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 53px;
        }
        .premiumSubsB {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #DAA520;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 25px;
        }
 
 </style>
</head>
<body>

	<main>

		<c:if test="${myPage.subsType == 'standard'}">

		<div class="row">
			<div class="col">
				<div class="card mb-4 rounded-3 shadow-sm">
					<div class="plusCard-header py-3">
						<h4 class="my-0 fw-normal">plus</h4>
					</div>
					<div class="card-body">
						<h1 class="card-title pricing-card-title">
							3,000원<small class="text-body-secondary fw-light">/월</small>
						</h1>
						<ul class="list-unstyled mt-3 mb-4">
							<li>내가 받은 요청을 무제한으로 볼 수 있어요!</li>
							<li>플러스 업그레이드로 더 많은 산책 요청을 받아보세요.</li>
						</ul>
						<input type="submit" id="plusSubs" class="plusSubsB" value="PLUS 구독 시작하기" />

					</div>
				</div>
			</div>
				<br></br>
		<div class="col">
			<div class="card mb-4 rounded-3 shadow-sm border-primary">
				<div class="premiumCard-header py-3 text-bg-primary border-primary">
					<h4 class="my-0 fw-normal">premium</h4>
				</div>
				<div class="card-body">
					<h1 class="card-title pricing-card-title">
						6,000원<small class="text-body-secondary fw-light">/월</small>
					</h1>
					<ul class="list-unstyled mt-3 mb-4">
						<li>플러스 혜택+</li>
						<li>채팅을 마음껏 보낼 수 있어요!</li>
						<li>프리미엄 업그레이드로 더 많은 대화를 나눠보세요.</li>
					</ul>
					<input type="submit" id="premiumSubs" class="premiumSubsB" value="PREMIUM 구독 시작하기" />
				</div>
			</div>
		</div>
		</div>
		</c:if>

	
		
		<c:if test="${myPage.subsType == 'plus'}">
			<div class="col">
				<div class="card mb-4 rounded-3 shadow-sm border-primary">
					<div class="premiumCard-header py-3 text-bg-primary border-primary">
						<h4 class="my-0 fw-normal">premium</h4>
					</div>
					<div class="card-body">
						<h1 class="card-title pricing-card-title">
							6,000원<small class="text-body-secondary fw-light">/월</small>
						</h1>
						<ul class="list-unstyled mt-3 mb-4">
							<li>플러스 혜택+</li>
							<li>채팅을 마음껏 보낼 수 있어요!</li>
							<li>프리미엄 업그레이드로 더 많은 대화를 나눠보세요.</li>
						</ul>
						<input type="submit" id="premiumSubs" class="premiumSubsB" value="PREMIUM 구독 시작하기" />
<!-- 						<button type="button" class="w-100 btn btn-lg btn-primary">구독 시작하기</button> -->
					</div>
				</div>
			</div>
		</c:if>
	</main>

</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

$('#plusSubs').click(function(){
        if(confirm('PLUS 구독하시겠습니까?')){
        	var currentTime = new Date();
            var year = currentTime.getFullYear();
            var month = (currentTime.getMonth() + 1).toString().padStart(2, '0');
            var day = currentTime.getDate().toString().padStart(2, '0');

            var formattedDate = year + '-' + month + '-' + day;
            console.log(formattedDate);
        	
        	$.ajax({
        		type : 'get',
        		url : 'plusSubs.do', // 서버로 요청을 보낼 엔드포인트를 지정
        		data : {
        			"subsStartTime" : formattedDate
        		},
        		success : function(data) {
        			console.log(data);
        			console.log("플러스 구독");
        			alert('PLUS 구독이 시작되었습니다.');
        			location.href = "./myPageList.do";
        			if (!data.login) {
        				alert('로그인이 필요한 서비스입니다.');
        				location.href = './';
        			}
        		},
        		error : function(e) {
        			console.log(e)
        		}
        	});
        	
        	
/*         	location.href="./plusSubs.do";
        	alert('PLUS 구독이 시작되었습니다.'); */
        }
    }); 
    
$('#premiumSubs').click(function(){
    	if(confirm('PREMIUM 구독하시겠습니까?')){
    		var currentTime = new Date();
            var year = currentTime.getFullYear();
            var month = (currentTime.getMonth() + 1).toString().padStart(2, '0');
            var day = currentTime.getDate().toString().padStart(2, '0');

            var formattedDate = year + '-' + month + '-' + day;
            console.log(formattedDate);
        	
        	$.ajax({
        		type : 'get',
        		url : 'premiumSubs.do', // 서버로 요청을 보낼 엔드포인트를 지정
        		data : {
        			"subsStartTime" : formattedDate
        		},
        		success : function(data) {
        			console.log(data);
        			console.log("프리미엄 구독");
        			alert('PREMIUM 구독이 시작되었습니다.');
        			location.href = "./myPageList.do";
        			if (!data.login) {
        				alert('로그인이 필요한 서비스입니다.');
        				location.href = './';
        			}
        		},
        		error : function(e) {
        			console.log(e)
        		}
        	});

/*         	location.href="./premiumSubs.do";
        	alert('PREMIUM 구독이 시작되었습니다.'); */
        }
    }); 

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>