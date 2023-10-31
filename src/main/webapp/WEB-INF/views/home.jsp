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
    </div>
        <input type="button">삭제</>
        <input type="button">매칭요청보내기</>
</body>
<script>
// 페이지 로딩 시 데이터 가져오기
listcall();

// 매칭 리스트 ajax
function matchinglist() {
    $.ajax({
        type: 'get',
        url: '/HomeMatchingList.do',
        data: {},
        dataType: 'json',
        success: function (data) {
            console.log(data);
            location.href="home";
            drawList(data.list);
        },
        error: function (e) {
            console.log(e);
        }
    });
}

function drawList(list) {
    console.log(list);
    var content = '';
    list.forEach(function (item, idx) {
        content += '<tr>';
        content += '<td>' + item.member_dongAddr + '</td>';
        content += '<td>' + item.breedTypes + '</td>';
        content += '<td>' + item.charTypes + '</td>';
        content += '<td>' + item.pro_dogName + '</td>';
        content += '<td>' + item.pro_dogAge + '</td>';
        content += '<td>' + item.pro_dogGender + '</td>';
        content += '<td>' + item.pro_dogDesc + '</td>';
        content += '</tr>';
    });
    $('#matchinglist').empty();
    $('#matchinglist').append(content);
}

</script>
</html>