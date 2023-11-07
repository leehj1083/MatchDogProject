<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap : 디자인을 위한 프레임워크 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 페이징 처리를 위한 라이브러리 -->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
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
	
	table{
		width : 500px;
	}
	
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		font-size: 15px;
	}	
	
	select{
		margin: 5px 0px;
	}
</style>
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
	            <li><a href="./compList.go">신고관리</a><br><hr/>	            
	            <li><a href="./home.go">서비스 페이지</a></li>
	        </ul>
	    </div>
		<div class="title">
		  <h2>회원 구독 이력 보기(${list[0].member_id}님)</h2><hr/>
		</div>
		<div class="content">	
		<table>			
			<tr>
				<th>번호</th>			
				<th>구독권 종류</th>
				<th>구독 시작일</th>
				<th>구독 만료일</th>
			</tr>
			<c:if test="${list.size()==0}">
				<tr><td colspan="4">구독 이력이 없습니다.</td></tr>
			</c:if>
			<c:forEach items="${list}" var="subs">
				<tr>
					<th>${subs.member_id}</th>			
					<th>${subs.subsType}</th>
					<th>${subs.subsHistory_start}</th>
					<th>${subs.subsHistory_exp}</th>
				</tr>
			</c:forEach>				
		</table>
		<input type="button" onclick="location.href='./memberList.go'" value="회원 목록으로"/>
		</div>
	</div>	
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}


</script>
</html>