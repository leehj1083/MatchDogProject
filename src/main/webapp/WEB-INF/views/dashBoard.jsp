<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/chattingList.css" type="text/css">
<!-- bootstrap 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- pretendard 폰트 -->
<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 처리를 위한 라이브러리 -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<style>


a, a:link, a:visited, a:active, a:hover {
	text-decoration: none;
	color: var(--black);
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

table, th, td{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

.salesGraph{
	height : 200px;
	width : 200px;
}

.subsStatistics{
	margin-top:50px;
	display:flex;
	width:800px;
	flex-direction: row;
    align-items: center;
    justify-content: center;
}

.dataTable{
	margin-left:40px;
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
				<a href="./dashBoard.go" class="btn_gnb home">
					<span class="bi bi-house-door-fill"></span>
					<span>관리자 페이지</span>
				</a>
		        <a href="./dashBoard.go" class="btn_gnb match">
		        	<span class="bi bi-list-ul"></span>
					<span>DASH BOARD</span>
		        </a>
		        <a href="./memberList.go" class="btn_gnb chatting">
		        	<span class="bi bi-chat-dots-fill"></span>
					<span>회원관리</span>
		        </a>
		        <a href="./authList.do" class="btn_gnb chatting">
	                <span class="bi bi-chat-dots-fill"></span>
	                <span>권한관리</span>
               </a>
		        <a href="./compList.go" class="btn_gnb board">
		        	<span class="bi bi-people-fill"></span>
					<span>신고관리</span>
		        </a>
		        <a href="./home.go" class="btn_gnb myPage">
		        	<span class="bi bi-person-circle"></span>
					<span>서비스페이지</span>
		        </a>
			</div>
		</div>
		<div class="content">		
		<h3>DASHBOARD</h3><hr/>
			<div class="visitorStatistics">
				<span id="today" name="today"></span>
				<select id="selection" name="selection">
					<option value="day">일</option>
					<option value="week">주</option>
					<option value="month">월</option>
				</select>
				<span>별 방문자 통계</span>
				<span id="todayCount"></span>
				<span id="totalCount"></span>
				<div class="visitDataGraph">
					<canvas id="visitorGraph"></canvas>
				</div>
			</div>
			<div class="subsStatistics">
				<div class="dataGraph">
					<canvas id="salesGraph" width="400px"></canvas>
				</div>
				<div class="dataTable">
					<table>
						<tr>
							<select id="month" name="month">
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
							</select>
							<span>월 통계</span>
						</tr>
						<tr>
							<th>총 구독자수</th>
							<td id="totalSubs"></td>
						</tr>
						<tr>
							<th>총 매출액</th>
							<td id="totalSales"></td>
						</tr>
						<tr>
							<th>이달의 신규 구독자수</th>
							<td id="monthlySubs"></td>
						</tr>
						<tr>
							<th>이달의 매출액</th>
							<td id="monthlySales"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>

/* 현재날짜 표기 */

function getDate(){
	var today = new Date();
	var year = today.getFullYear();
	var month = (today.getMonth()+1).toString().padStart(2,'0');
	var day = today.getDate().toString().padStart(2,'0');
	var dateString = year + '-' + month + '-' + day;
	return dateString;
}



$('#today').html(getDate());
var today = getDate();
var selection = $('#selection').val();
console.log("선택분류="+selection);

/* 방문자 통계 관련 ajax 및 그래프 */
visitorStatistic(selection, today);

function visitorStatistic(selection, today){	
	
	$.ajax({
		type:'get',
		url:'visitorStatistics.do',
		data : {'selection':selection,
					'today':today},
		dataType:'JSON',
		success : function(data){
			console.log(data);		
			$('#todayCount').html(data.todayCount +' 명');
			$('#totalCount').html(data.totalCount +' 명');	
		},
		error : function(e){
			console.log(e);
		}
	});	
	
}

$('#selection').on('change',function(){
	var selection = $('#dayWeekMonth').val();
	var visitorGraph = $('#visitorGraph');
	console.log("선택분류="+selection);
	resetSalesCanvas();
	salesStatistic(month);
})

var resetVisitorCanvas = function(){
	if(visitorGraph){
		visitorGraph.destroy();
	}	
	$('#visitorGraph').remove();
	$('.visitDataGraph').append('<canvas id="visitorGraph" width="400px"></canvas>');
}


/* 월 선택(현재 날짜의 월이 선택되어있게 하기) */
var date = new Date();
var currYear = date.getFullYear();
var currMonth = date.getMonth();
$('#month').val(currMonth+1).prop("selected", true);


/* 매출 통계 관련 ajax 및 그래프 부 */

salesStatistic(month);

var salesGraph;

function salesStatistic(month){
	var month = $('#month').val();
	console.log("해당 월="+month);

		$.ajax({
			type:'get',
			url:'subsStatistics.do',
			data : {'month':month},
			dataType:'JSON',
			success : function(data){
				console.log(data);		
				$('#totalSubs').html(data.totalSubscriber +' 명');
				$('#totalSales').html(data.totalSales +' 원');
				$('#monthlySubs').html(data.monthlySubscriber +' 명');
				$('#monthlySales').html(data.monthlySales +' 원');	
				drawSalesStatistic(data);
			},
			error : function(e){
				console.log(e);
			}		
		});		
}

function drawSalesStatistic(obj){
	/* 그래프 관련 */
	var canvas = document.getElementById('salesGraph');
	var ctx =canvas.getContext('2d');
	var salesGraph= new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ['총 매출액', '이달의 매출액'],
	        datasets: [{
	            label: '매칭하시개 매출 추이(총 매출액, 월 매출액)',
	            data: [obj.totalSales, obj.monthlySales],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	});
}

$('#month').on('change',function(){
	var month = $('#month').val();
	var salesGraph = $('#salesGraph');
	console.log("해당 월="+month);
	resetCanvas();
	salesStatistic(month);
})

var resetSalesCanvas = function(){
	if(salesGraph){
		salesGraph.destroy();
	}	
	$('#salesGraph').remove();
	$('.dataGraph').append('<canvas id="salesGraph" width="400px"></canvas>');
}




</script>
</html>