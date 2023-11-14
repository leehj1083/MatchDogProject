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
<!-- chart.js 라이브러리 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<style>
.banner{
	width:1500px;
	display:inline-block;
	border-bottom: 1px solid var(--light);
}

.header{
	display:flex;
	width:1280px;
	height:72px;
	margin:0 110px;
	align-items:center;
}

.logo{
	position: relative;
	width:241px;
	height:70px;
}

.logo_matchDog{
	position: absolute;
	top:8px;
	left:20px;
	display:block;
	width:auto;
	height:44px;
}
.gnb{
	position:relative;
	top:2px;
	left:860px;
}
.logout{
	display: inline-block;
	position: relative;
	left: 24px;
	width: 120px;
	height: 32px;
	padding: 4px 15px 0 15px;
	border: 1px solid var(--light);
	background-color: #eceff1;
	border-radius: 8px;
	font-family:Pretendard;
	font-weight: 500;
	text-align: center;
}
.mainContainer{
	display:flex;
	width:1280px;
	margin:0 110px;
}
.side{
	width: 240px;
	padding-left:14px;
}

.side .menu{
	/* position: fixed; */
	padding: 32px 20px 24px 0;
}

a, a:link, a:visited, a:active, a:hover {
	text-decoration: none;
	color: var(--black);
}

/* admin페이지 side bar 메뉴 아이콘 */
.bi-gear-fill, .bi-reception-3,  .bi-people-fill, 
.bi-person-gear, .bi-person-x-fill, .bi-door-open-fill {
	position:relative;
	color: var(--black) ;
	font-size: 22px;
	margin-right:10px;
}

/* .btn_gnb.home, .btn_gnb.dash, .btn_gnb.user, 
.btn_gnb.auth, .btn_gnb.comp, .btn_gnb.service
 */
/* 본인 페이지 것으로 변경하기  */
.btn_gnb .bi-reception-3, .btn_gnb.dash{
    color: var(--white);
    background-color: var(--green);
}


/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb:hover .bi-gear-fill,
/* .btn_gnb:hover bi-reception-3, */
.btn_gnb:hover .bi-people-fill,
.btn_gnb:hover .bi-person-gear,
.btn_gnb:hover .bi-person-x-fill,
.btn_gnb:hover .bi-door-open-fill {
    background-color: var(--light);
}

/* 본인 페이지를 제외한 나머지 hover 적용 */
.btn_gnb.home:hover,
/* .btn_gnb.dash:hover, */
.btn_gnb.user:hover,
.btn_gnb.auth:hover,
.btn_gnb.comp:hover,
.btn_gnb.service:hover{
	background-color: var(--light);
}

table, th, td{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

.visitorStatistics{
	display:block;
	width:800px;
	flex-direction: row;
    align-items: center;
    justify-content: center;
    font-family: pretendard;
}

.visitorGraph{
	height : 250px;
	width : 600px;
}

.subsStatistics{
	margin-top:50px;
	display:flex;
	width:800px;
	flex-direction: row;
    align-items: center;
    justify-content: center;
    align-content: center;
    font-family: pretendard;
}

.salesGraph{
	height : 250px;
	width : 250px;
}

.dataTable{
	margin-left:60px;
}


</style>
</head>
<body>
<div id="wrap">
	<div class="banner">
		<div class="header">
			<h1 class="logo">
				<a href="./"><img src="./resources/img/logo.png" class="logo_matchDog"/></a>
			</h1>
			<div class="gnb">
				<a id="openAlarm" class="alarm"><span class="bi bi-bell-fill"></span></a>
				<a href="./logout.do"><span class="logout">로그아웃</span></a>
			</div>
		</div>
	</div>
	<div class="mainContainer">
		<div class="side">
			<div class="menu">
				<span class="btn_gnb admin">
					<span class="bi bi-gear-fill"></span>
					<span>관리자 페이지</span>
				</span>
		        <a href="./adminList.go" class="btn_gnb dash">
		        	<span class="bi bi-reception-3"></span>
					<span>DASH BOARD</span>
		        </a>
		        <a href="./memberList.go" class="btn_gnb user">
		        	<span class="bi bi-people-fill"></span>
					<span>회원관리</span>
		        </a>
		        <a href="./authList.do" class="btn_gnb auth">
	                <span class="bi bi-person-gear"></span>
	                <span>권한관리</span>
               </a>
		        <a href="./compList.go" class="btn_gnb comp">
		        	<span class="bi bi-person-x-fill"></span>
					<span>신고관리</span>
		        </a>
		        <a href="./HomeMatchingList.do" class="btn_gnb service">
		        	<span class="bi bi-door-open-fill"></span>
					<span>서비스페이지</span>
		        </a>
			</div>
		</div>
		<div class="content">		
		<div id="alarmContent"></div>
		<h2 style="font-family:pretendard">DASHBOARD</h2><hr/>
			<div class="visitorStatistics">
				<div class="noticeToday" style="font-size:medium; display: flex; align-content:center;">
					<span id="today"></span>&nbsp;기준&nbsp;&nbsp;
					<select id="selection" name="selection">
						<option value="day">일</option>
						<option value="week">주</option>
					</select>
					<span>별 방문자 통계</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오늘 방문자 수 : &nbsp;<span id="todayCount"></span>
					&nbsp;/&nbsp;전체 방문자 수 : &nbsp;<span id="totalCount"></span>
				</div><p>
				<div class="visitDataGraph">
					<canvas id="visitorGraph" width="800px" height="250px"></canvas>
				</div>
			</div>
			<div class="subsStatistics">
				<div class="dataGraph">
					<canvas id="salesGraph" width="400px" height="250px"></canvas>
				</div>
				<div class="dataTable">
					<table style="width: 300px; height: 200px;">
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
							<th style="background-color: #FDF5E6;">현재 총 구독자수</th>
							<td id="totalSubs"></td>
						</tr>
						<tr>
							<th style="background-color: #FDF5E6;">총 매출액</th>
							<td id="totalSales"></td>
						</tr>
						<tr>
							<th style="background-color: #FDF5E6;">이달의 신규 구독자수</th>
							<td id="monthlySubs"></td>
						</tr>
						<tr>
							<th style="background-color: #FDF5E6;">이달의 매출액</th>
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
/* 오늘 날짜 삽입 */
 
var today = new Date();
var Year = today.getFullYear();
var Month = today.getMonth() + 1;
var Day = today.getDate();
Month = Month>=10 ? Month : '0'+Month;
Day = Day >=10 ? Day : '0'+Day;

var Today = Year + '-' + Month + '-' + Day;
$('#today').html(Today);



/* 페이지 상단 방문자 통계 관련 파트(ajax, graph) */

var selection = $('#selection').val();
console.log("선택분류="+selection);

/* 방문자 통계 관련 ajax */
var visitorGraph;
visitorStatistic(selection);

function visitorStatistic(selection){	
	
	var timeList = [];
	var countList = [];
	
	$.ajax({
		type:'get',
		url:'visitorStatistics.do',
		data : {'selection':selection},
		dataType:'JSON',
		success : function(data){
			console.log(data);		
			$('#todayCount').html(data.todayCount +' 명');
			$('#totalCount').html(data.totalCount +' 명');	
			if(selection === 'day'){
				var dataArray = data.weekCount || [];
				for(var i = 0; i<dataArray.length; i++){	
					timeList.push(dataArray[i].visit_date);
					countList.push(dataArray[i].visit_count);
				};				
				console.log(timeList);
				console.log(countList);
				drawVisitorStatistic(timeList, countList);				
			}else if(selection === 'week'){
				var weekDataArray = data.sevenWeekCount || [];
				for(var i = 0; i<weekDataArray.length; i++){	
					timeList.push(weekDataArray[i].visit_week);
					countList.push(weekDataArray[i].visit_count);
				};
				console.log(timeList);
				console.log(countList);
				drawSevenWeekVisitorStatistic(timeList, countList);		
			}
		},
		error : function(e){
			console.log(e);
		}
	});		
}

/* 방문자 그래프 관련 */
function drawVisitorStatistic(timeList, countList){
	
	var canvas = document.getElementById('visitorGraph');
	var ctx =canvas.getContext('2d');
	var visitorGraph = new Chart(ctx, {
	    type: 'line',
	    data: {
	        labels: timeList,
	        datasets: [{
	            label: '매칭하시개 방문객 추이',
	            data: countList,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	        	x: {
	                beginAtZero: true
	            },
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	});
}

function drawSevenWeekVisitorStatistic(timeList, countList){
	
	var canvas = document.getElementById('visitorGraph');
	var ctx =canvas.getContext('2d');
	var visitorGraph = new Chart(ctx, {
	    type: 'line',
	    data: {
	        labels: ['6주전','5주전','4주전','3주전','2주전','1주전','이번주' ],
	        datasets: [{
	            label: '매칭하시개 7주간 방문객 추이',
	            data: countList,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)'
	            ],            
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	        	x: {
	                beginAtZero: true
	            },
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	});
}

/* 방문자 통계 기준 일/주 변경시 */
$('#selection').on('change',function(){
	var selection = $('#selection').val();
	var visitorGraph = $('#visitorGraph');
	console.log("선택분류="+selection);
	resetVisitorCanvas();
	visitorStatistic(selection);
})

/* 방문자 그래프 다시 그리기 */
var resetVisitorCanvas = function(){
	if(visitorGraph){
		visitorGraph.destroy();
	}	
	$('#visitorGraph').remove();
	$('.visitDataGraph').append('<canvas id="visitorGraph" width="800px" height="250px"></canvas>');
}



/* 페이지 하단 매출 통계 관련 파트(ajax, graph) */

/* 월 선택(현재 날짜의 월이 선택되어있게 하기) */
var date = new Date();
var currYear = date.getFullYear();
var currMonth = date.getMonth();
$('#month').val(currMonth+1).prop("selected", true);


/* 매출 통계 관련 ajax */
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

/* 매출 그래프 관련 */
function drawSalesStatistic(obj){
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

/* 월 바꿨을때 그래프 지우기 */
$('#month').on('change',function(){
	var month = $('#month').val();
	var salesGraph = $('#salesGraph');
	console.log("해당 월="+month);
	resetSalesCanvas();
	salesStatistic(month);
})

/* 매출 그래프 다시 그리기 */
var resetSalesCanvas = function(){
	if(salesGraph){
		salesGraph.destroy();
	}	
	$('#salesGraph').remove();
	$('.dataGraph').append('<canvas id="salesGraph" width="400px" height="250px"></canvas>');
}

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

$('#openAlarm').click(function (e) {
	   // JSP 파일을 가져와서 모달 창에 표시
	   $.get("./alarmList.go", function(data) {
	   	console.log(data);
	   	console.log("#alarmContent");
	       $("#alarmContent").html(data);
	   });
	});


</script>
</html>