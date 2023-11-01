<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<meta charset="UTF-8">
<title>메인 화면</title>
<style>
    .sidebar {
        height: 100%;
        width: 250px;
        position: fixed;
        top: 0;
        left: 0;
        background-color: #255,255,255;
        padding-top: 20px;
    }

    .sidebar h2 {
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
        margin-left: 260px;
        padding: 20px;
        text-align: center; /* "우리 동네 리스트"를 가운데 정렬 */
    }
</style>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
 <!-- Sidebar -->
    <div class="sidebar">
        <h2>매칭해주개</h2>
        <ul>
            <li><a href="">홈</a></li>
            <li><a href="#">매칭리스트</a></li>
            <li><a href="#">채팅</a></li>
            <li><a href="#">커뮤니티</a></li>
            <li><a href="#">마이페이지</a></li>
            <li><a href="#">관리자페이지</a></li>
        </ul>
    </div>

    <!-- Page Content -->
    <div class="content">
        <h3>우리 동네 리스트</h3>
        <a href="#">매칭리스트 img</a>
        <table>
        <tbody id="matchinglist"></tbody>
				</table>
        <input type="button" value="매칭리스트 삭제">
        <input type="button" value="매칭요청 보내기">
    </div>
</body>
<script>
// 페이지 로딩 시 데이터 가져오기
matchinglist();

// 매칭 리스트 ajax
function matchinglist() {
    $.ajax({
        type: 'get',
        url: 'MatchingList.do',
        data: {},
        dataType: 'json',
        success: function (data) {
            console.log(data);
            console.log("성공");
            drawList(data.list);
        },
        error: function (e) {
            console.log(e);
       			console.log("실패");
        }
    });
}

function drawList(list) {
    console.log(list);
    var content = '';
    list.forEach(function (item, idx) {
   	 		/* 견주 성별, 동 주소 */
        content += '<tr>';
      	content += '<td>';
        content += '<td>' + item.member_gender + '</td>';
        content += '<td>' + item.member_dongAddr + '</td>';
        content += '</tr>';
        
        /* 강아지 이름, 견종, 강아지 나이, 강아지 성별 */
        content += '<tr>';
        content += '<td>' + item.pro_dogName + '</td>';
        content += '<td>' + item.breedType + '</td>';
        content += '<td>' + item.pro_dogAge + '</td>';
        content += '<td>' + item.pro_dogGender + '</td>';
        content += '</tr>';
        
        /* 소개글 */
        content += '<tr>';
        content += '<td>' + item.pro_dogDesc + '</td>';
        content += '</td>';
    });
    $('#matchinglist').empty();
    $('#matchinglist').append(content);
}


var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>