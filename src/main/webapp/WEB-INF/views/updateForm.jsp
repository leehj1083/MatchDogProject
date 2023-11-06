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
			<th>사진</th>
		    <td>
		        <input type="file" name="photos" multiple="multiple"/>
		        <c:if test="${photos.size() > 0}">
		            <div id="photo-container">
		                <c:forEach items="${photos}" var="photo">
		                    <div class="photo-item">
		                        <img src="/photo/${photo.photo_fileName}" width="100" height="100" alt="${photo.photo_fileName}"/>
		                        <button data-photo-id="${photo.photo_id}" class="delphoto">삭제</button>
		                    </div>
		                </c:forEach>
		            </div>
		        </c:if>
		    </td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" id="cancel" value="취소"/>
				<input type="submit" value="수정저장"/>
			</th>
		</tr>
	</table>
	</form>
</body>
<script>

// 삭제 버튼 클릭 시 사진 삭제 처리
$('.delphoto').click(function() {
    var photoId = $(this).data('photo-id');
    deletePhoto(photoId);
});
$('#cancel').click(function() {
    if (confirm('변경내용이 저장되지않습니다.')) {
        location.href = './detail?board_id=${board.board_id}';
    }
});
function deletePhoto(photoId) {
    $.ajax({
        type: 'POST',
        url: 'delphoto', // 삭제 처리를 수행하는 서버 경로
        data: { photo_id: photoId },
        dataType: 'json',
        success: function(data) {
            if (data.success) {
                // 사진 삭제 후 해당 사진 요소를 제거
                location.reload();
            } else {
                alert('사진 삭제에 실패했습니다.');
            }
        },
        error: function(e) {
            console.log(e);
        }
    });
}

</script>
</html>