<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
	<form action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="board_id" value="${board.board_id}"/>
	<input type="hidden" name="delphotoArray" value=""/>
	<table>
		<h2>글수정</h2>
		<hr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="member_nickName" value="${board.member_nickName}" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="board_subject" value="${board.board_subject}"/></td>
		</tr> 
		<tr>
			<th>내용</th>
			<td><textarea name="board_content">${board.board_content}</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="file" name="photos" multiple="multiple"/></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" id="cancel" value="취소"/>
				<input type="submit" value="수정저장"/>
			</th>
		</tr>
	</table>
		<p>사진</p>
        <c:if test="${photos.size() > 0}">
			<c:forEach items="${photos}" var="photo">               
				<div class="photo-item" style="display: inline;">
					<img src="/photo/${photo.photo_fileName}" width="100" height="100" alt="${photo.photo_fileName}"/>
					<button data-photo_id="${photo.photo_id}" class="delphoto">삭제</button>
				</div>
			</c:forEach>
        </c:if>
	</form>
</body>
<script>
var hidePhotoArray = [];

$('.delphoto').click(function() {
    event.preventDefault();
    var photoId = $(this).data('photo_id');
    var photoDiv = $(this).parent(); // 이미지를 감싸는 div 요소
	
    photoDiv.hide();
    hidePhotoArray.push(photoId);
    $('[name="delphotoArray"]').val(hidePhotoArray.join(','));
});

$('#cancel').click(function() {
    if (confirm('변경내용이 저장되지않습니다.')) {
        location.href = './detail?board_id=${board.board_id}';
    }
});

</script>
</html>