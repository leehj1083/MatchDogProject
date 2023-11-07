<%@page import="com.one.mat.member.dto.ProfileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<meta charset="UTF-8">
<title>관리자 화면</title>
<style>
	.whole{
		width:auto;
		height : 100%;
		margin :0px auto;
		padding : 20px;
		border : 1px solid black;
	}
	.header{
		height : 100px;
		padding : 20px;
		margin-bottom: 20px;
		border:1px solid black;
	}
	.headerRight{
		text-align: right;
	}
    .sidebar {
        width: auto;
        height : auto;
        float : left;
        margin-right : 20px;
        background-color: #255,255,255;
        padding-top: 20px;
        border : 1px solid black;
    }

    .sidebar h2, h3 {
        color: black;
        text-align: center;
    }

    .sidebar ul {
        list-style: none;
        padding: 0;
    }

    .sidebar ul li {
        padding: 10px;
        text-align: center;
    }

    .sidebar a {
        color: black;
        text-decoration: none;
    }

    .content {
    	width : auto;
        float: right;
    }
	
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		font-size: 15px;
	}	
	
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
</head>
<body>
	<div class="whole">
		<div class="header">
			<a href="./"><img src="./resources/img/maticon.PNG" src="매칭해주개메인" /></a>
			<div class ="headerRight">
				안녕하세요 ${sessionScope.loginInfo.member_nickName} 님&nbsp;&nbsp;&nbsp;&nbsp;		
				<a href="logout">로그아웃</a>
			</div>
		</div>
		<div class="sidebar">
	        <ul>
	            <li><h3 style="font-weight: bold; ">관리자 페이지</h3></li>
	            <li><a href="./dashBoard.go">DASH BOARD</a></li>
	            <li><a href="./memberList.go">회원관리</a></li>
	            <li><a href="./compList.go">신고관리</a></li>	         
	            <li><a href="./home.go">서비스 페이지</a></li>
	        </ul>
	    </div>
		<div class="content">
			<h3>DASHBOARD</h3><hr/>
			<div class="visitorStatistics">
				<canvas id="myChart"></canvas>
			</div>
			<div class="subsStatistics">
				<div class="dataGraph">
					<canvas></canvas>
				</div>
				<div class="dataTable">
					<table>
						<tr>
							<th>총 구독자수</th>
							<td></td>
						</tr>
						<tr>
							<th>총 매출액</th>
							<td></td>
						</tr>
						<tr>
							<th><span id="month"></span>월 신규 구독자수</th>
							<td></td>
						</tr>
						<tr>
							<th><span id="month"></span>월 매출액</th>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
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

</script>
</html>