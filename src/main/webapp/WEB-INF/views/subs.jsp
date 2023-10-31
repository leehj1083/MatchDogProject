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
	<input type="button" onclick="location.href='./myPageList.do'" value="마이페이지"/>
	<br></br>
 	<br></br>
	<main>
		<c:if test="${myPage.subsType == 'standard'}">

			<div class="col">
				<input type="button" onclick="location.href='./myPageList.do'"
					value="x" />
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
						<button type="button" class="w-100 btn btn-lg btn-primary">구독
							시작하기</button>
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
					<button type="button" class="w-100 btn btn-lg btn-primary">구독
						시작하기</button>
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
						<button type="button" class="w-100 btn btn-lg btn-primary">구독
							시작하기</button>
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
</script>
</html>