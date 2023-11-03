<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="resources/css/boardd.css" type="text/css">
</head>
<body>
	<form action="detail" method="post">
	<table>
		<tr>
			<th>제목</th>
			<td>${board.board_subject}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.member_nickName}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${board.board_regDate}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.board_bHit}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${board.board_content}</td>
		</tr>
		<c:if test="${photos.size()>0}">
			<tr>
				<th>사진</th>
				<td>
				<c:forEach items="${photos}" var="photo">
					<img src="/photo/${photo.photo_fileName}" width="100" height="100" alt="${photo.photo_fileName}"/>
				</c:forEach>
				</td>
			</tr>
		</c:if>
		<tr>
			<th colspan="2">
				<input type="button" onclick="location.href='./board'" value="리스트"/>
				<input type="button" onclick="location.href='./del?board_id=${board.board_id}'" value="삭제"/>
				<input type="button" onclick="location.href='./updateForm?board_id=${board.board_id}'" value="수정"/>
			</th>
		</tr>
	</table>
	</form>
	<h2>댓글</h2>
	<hr width="500px" align="left">
    <form id="replyForm">
    	<table>
    		<tr>
    			<td>
    				<input type="hidden" name="member_idx" value="${sessionScope.loginInfo.member_idx}">
        			<textarea id="reply_content" placeholder="댓글을 입력하세요"></textarea>
        		</td>
        		<td>
        			<input type="submit" value="댓글 작성">
        		</td>
        	</tr>
    	</table>
    </form>
    <div id="replyList">
        <ul>
            <c:forEach var="reply" items="${replys}">
                <li>${reply.reply_content}</li>
            </c:forEach>
        </ul>
    </div>
</body>
<script>
loadReplyList();

/*
$('#replyForm').submit(function() {
	
    var memberIdx = $('#member_idx').val();
    var replyContent = $('#reply_content').val();
    var boardId = '${board.board_id}';

    $.ajax({
        type: 'POST',
        url: 'replyWrite', // 실제 서버 URL로 대체해야 합니다.
        data: {
            member_idx: memberIdx,
            reply_content: replyContent,
            board_id: boardId
        },
        dataType: 'json',
        success: function(data) {
            console.log('댓글 작성 성공:', data);
            // 댓글 작성 후, 댓글 목록을 다시 불러오는 함수 호출
            loadReplyList();
        },
        error: function(e) {
            console.log('댓글 작성 실패:', e);
        }
    });
});
*/

function loadReplyList() {
    $.ajax({
        type: 'GET',
        url: 'replyList',
        dataType: 'json',
        data: {'boardId': ${board.board_id}},
        success: function(data) {
            console.log('댓글 목록 불러오기 성공:', data);

            // 댓글 목록을 표시하는 부분
            var replyList = $('#replyList ul');
            replyList.empty(); // 기존 목록을 지우고 새로운 목록을 생성
            $.each(data, function(index, reply_id) {
            	replyList.append('<li>' + index.member_nickName + '</li>');
                replyList.append('<li>' + index.reply_content + '</li>');
            });
        },
        error: function(e) {
            console.log('댓글 목록 불러오기 실패:', e);
        }
    });
}

</script>
</html>