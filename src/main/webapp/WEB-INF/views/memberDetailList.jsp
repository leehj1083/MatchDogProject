<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <style>
        /* 스타일을 추가할 부분 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #image {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        .text-overlay {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: rgba(255, 255, 255, 0.8);
            color: black;
            padding: 5px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="image-container">
            <img id="image" src="/photo/${pho.photo_fileName}" alt="/photo/${pho.photo_fileName}">
            <div class="text-overlay">${map.member_dongAddr}</div>
        </div>
        <table>
            <tr>
                <td>${map.pro_dogName}</td>
                <td>${map.breedType}</td>
            </tr>
            <tr>
                <td>${map.pro_dogAge}살</td>
                <td>${map.pro_dogGender}</td>
            </tr>
            <tr>
                <td>강아지 성향</td>
            </tr>
            <tr>
                <td> 성향들...</td>
            </tr>
            <tr>
                <td>견주 닉네임&nbsp&nbsp&nbsp${map.member_nickName}</td>
            </tr>
            <tr>
                <td>소개글</td>
            </tr>
            <tr>
                <td>${map.pro_dogDesc}</td>
            </tr>
        </table>
    </div>
</body>
<script>
    // 추가적인 스크립트가 필요하다면 여기에 작성
</script>
</html>
