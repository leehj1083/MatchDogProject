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
    <form id="commentForm">
    	<table>
    		<tr>
    			<td>	
        			<textarea id="commentContent" placeholder="댓글을 입력하세요"></textarea>
        		</td>
        		<td>
        			<input type="submit" value="댓글 작성">
        		</td>
        	</tr>
    	</table>
    </form>
    <div id="commentList">
        <ul>
            <c:forEach var="comment" items="${comments}">
                <li>${comment.reply_content}</li>
            </c:forEach>
        </ul>
    </div>
</body>
<script>
<script>
$(document).ready(function() {
    // 댓글 폼 제출 시 Ajax를 사용하여 댓글 추가
    $("#commentForm").submit(function(e) {
        e.preventDefault(); // 기본 폼 제출 동작 막기
        var commentContent = $("#commentContent").val();
        var boardId = ${board.board_id}; // 게시물 ID

        $.ajax({
            type: "POST",
            url: "AddCommentServlet", // 댓글 추가 서블릿 URL
            data: {
                boardId: boardId,
                replyContent: commentContent
            },
            dataType: "json",
            success: function(data) {
                if (data.success) {
                    // 댓글 추가 성공 시 화면에 추가
                    var comment = data.comment;
                    $("#commentList ul").append("<li>" + comment.reply_content + "</li>");
                    $("#commentContent").val(""); // 댓글 입력 필드 비우기
                } else {
                    alert("댓글 추가에 실패했습니다.");
                }
            },
            error: function(err) {
                console.log(err);
            }
        });
    });
});
</script>
</script>
</html>