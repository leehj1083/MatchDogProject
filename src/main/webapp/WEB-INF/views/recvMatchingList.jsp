<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<meta charset="UTF-8">
<title>홈 화면</title>
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
            <li><a href="joinAgree.go">회원가입</a>
            <li><a href="login.go">로그인</a></li>
            <li><a href="logout.do">로그아웃</a></li>
            <li><a href="chattingList.go">채팅</a></li>
            <li><a href="recvMatchingList.go">매칭리스트</a></li>
            <li><a href="boardList.go">커뮤니티</a></li>
            <li><a href="myProfileList.do">마이프로필</a>
            <li><a href="alarmList.go">알람</a></li>
            
            <li><a href="adminList.go">관리자페이지</a></li>
        </ul>
    </div>

    <div class="content">
    <h3>나에게 온 요청 리스트</h3>
    <a href="#">매칭리스트 img</a>
    <div id="firstMatchData">
        <p id="member_nickName"></p>
        <p id="pro_dogName"></p>
        <p id="pro_dogAge"></p>
        <p id="pro_dogGender"></p>
        <p id="pro_dogDesc"></p>
    </div>
    <table>
        <tbody id="matchingList"></tbody>
    </table>
    <!-- <div id="charList"></div> -->
    <button id="nextButton">다음</button>
    <button id="prevButton">이전</button>
    <button id="matchingdel">매칭리스트 삭제</button>
    <button id="matchingreq" >매칭요청 보내기</button>
    <button id="openModal">모달 열기</button>
    <button id="closeModal">모달 닫기</button>
    <!-- 모달을 불러올 위치 -->
    <div id="modalContainer"></div>
</div>
</body>
<script></script>
</html>