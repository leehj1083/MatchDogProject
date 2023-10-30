<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        <tbody id="list"></tbody>
		</table>
    </div>
</body>
<script>
list();

function list(){
	$.ajax({
		type:'get',
		url:'HomeMatchingList.do',
		data:{},
		dataType:'json',
		success:function(data){
			console.log(data);
			drawList(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});	
}


function drawList(list){
	console.log(list);
	/*for(var i=0;i<list.length;i++){}*/
	// 배열의 값을 하나씩 빼서 함수를 실행(개별값,인덱스)
	var content = '';
	list.forEach(function(list, idx){
		content += '<tr>';
		content += '<td>'+idx.member_dongAddr+'</td>';
		content += '<td>'+idx.breedType+'</td>';
		content += '<td>'+idx.charType+'</td>';
		content += '<td>'+idx.pro_dogName+'</td>';
		content += '<td>'+idx.pro_dogAge+'</td>';
		content += '<td>'+idx.pro_dogGender+'</td>';
		content += '<td>'+idx.pro_dogDesc+'</td>';
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
	
}
</script>
</html>