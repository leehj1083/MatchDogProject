<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <style>

<textarea style="resize: both;"></textarea>
        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.7);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 70%;
        }

        /* 닫기 버튼 스타일 */
        .close {
            color: #888;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>



<form action="myProfileModUpdate.do" method="post">

    
    <input type="file" name="photos" multiple="multiple" value="사진 선택">
    
    <table>
        
        
        <tr>
            <th>내 강아지 이름</th>
            <th><input type="text" name="pro_dogName"/></th>
        </tr>
        
        <tr>
            <th>내 강아지 견종</th>
            <td>
                <select name="breedType">
                    <option value="코리안 믹스 도그">코리안 믹스 도그</option>
                    <option value="코리안 믹스 도그2">코리안 믹스 도그2</option>
                  
                </select>
            </td>
        </tr>
        
        <tr>
            <th>내 강아지 나이</th>
            <td>
                <select name="pro_dogAge">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </td>
        </tr>
        
        <tr>
            <th>내 강아지 성별</th>
            <td>
                <select name="pro_dogGender">
                    <option value="남아">남아</option>
                    <option value="여아">여아</option>
                </select>
            </td>
        </tr>
        <tr>
		<th>내 강아지 성향</th>
		<td><button id="openModal">성향 선택</button></td>
	</tr>
	<tr>
	<td colspan="2"><div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" id="closeModal">&times;</span>
            <!-- 모달 내용을 추가하세요 -->
            내 강아지 성향을 선택해주세요
            <p><input type = "checkbox" value = "활발함"/>활발함</p>
            
            <button>선택 완료</button>
            
            
        </div>
    </div></td>
	</tr>
	<tr>
	<th>내 강아지 소개 : </th>
	<td><textarea name="pro_dogDesc" spellcheck = "false">
	</textarea></td>
	</tr>
	<tr>
    </table>
    <br></br>
    <input type="button" onclick="location.href='./myProfileList.do'" value="수정 취소"/>
 		<input type="submit" value="수정 완료"/>
</form>

</body>
<script>
        // 모달 열기
        document.getElementById("openModal").onclick = function() {
            document.getElementById("myModal").style.display = "block";
        }

        // 모달 닫기
        document.getElementById("closeModal").onclick = function() {
            document.getElementById("myModal").style.display = "none";
        }

        // 모달 바깥 클릭 시 닫기
        window.onclick = function(event) {
            if (event.target == document.getElementById("myModal")) {
                document.getElementById("myModal").style.display = "none";
            }
        }
    </script>
</html>