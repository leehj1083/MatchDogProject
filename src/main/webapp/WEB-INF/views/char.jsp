<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>char 입니다</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
.filebox .upload-name {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 80px;
	color: #999999;
}

.filebox label {
	display: inline-block;
	padding: 10px 20px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	width: 55px;
	height: 10px;
	margin-left: 10px;
	font-size: small;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

#imgtable {
	border: 1px solid black;
}

#imgtable td, tr {
	border: 1px solid black;
}

#imgtable td {
	width: 300px;
	height: 200px;
}

textarea style ="resize: both ;"> </textarea>.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 500px;
	height: 500px;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
	display: none;
}

.modal.active .modal-content {
	display: block;
}

.modal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 70%;
}

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

<div id="charModal" class="modal">
		<div class="charModal-content">
			<span class="close" id="closeCharModal ">&times;</span> 내 강아지 성향을 선택해주세요
			<c:forEach items="${charTypeList}" var="charTypeList">
				<p>
					<input type="checkbox" value="${charTypeList.charType_code}" />
					${charTypeList.charType}
				</p>
			</c:forEach>
			<button type="button" id="submitForm">선택 완료</button>
		</div>
	</div>

</body>
<script>

</script>
</html>