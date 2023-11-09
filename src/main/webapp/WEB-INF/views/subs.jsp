<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
 <style></style>
</head>
<body>
	<a href="logout">로그아웃</a>
	<br></br>
 	<br></br>
	<main>
		<c:if test="${myPage.subsType == 'standard'}">

			<div class="col">
				<input type="button" onclick="location.href='./myPageList.do'" value="x" />
				<div class="card mb-4 rounded-3 shadow-sm">
					<div class="card-header py-3">
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
						<input type="submit" id="plusSubs" value="PLUS 구독 시작하기" />
<!-- 						<button type="button" class="plus" name= "plus">구독 시작하기</button> -->

					</div>
				</div>
			</div>
				<br></br>
		<div class="col">
			<input type="button" onclick="location.href='./myPageList.do'"
				value="x" />
			<div class="card mb-4 rounded-3 shadow-sm border-primary">
				<div class="card-header py-3 text-bg-primary border-primary">
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
					<input type="submit" id="premiumSubs" value="PREMIUM 구독 시작하기" />
	<!-- 				<button type="button" class="w-100 btn btn-lg btn-primary">구독 시작하기</button> -->
				</div>
			</div>
		</div>
		</c:if>

	
		
		<c:if test="${myPage.subsType == 'plus'}">
			<div class="col">
				<input type="button" onclick="location.href='./myPageList.do'"
					value="x" />
				<div class="card mb-4 rounded-3 shadow-sm border-primary">
					<div class="card-header py-3 text-bg-primary border-primary">
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
						<input type="submit" id="premiumSubs" value="PREMIUM 구독 시작하기" />
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