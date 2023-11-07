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
			<th width="50px">제목</th>
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
				<c:if test="${board.member_idx == sessionScope.loginInfo.member_idx}">
				    <input type="button" onclick="location.href='./del?board_id=${board.board_id}'" value="삭제"/>
				    <input type="button" onclick="location.href='./updateForm?board_id=${board.board_id}'" value="수정"/>
				</c:if>
				<input type="button" onclick="location.href='./compBoard?board_id=${board.board_id}'" value="신고"/>
			</th>
		</tr>
	</table>
	<form id="recommendLike">
		<div>
			<input type="hidden" name="member_idx" value="${sessionScope.loginInfo.member_idx}">
			<input type="button" id="likeButton" onclick="like('${board.board_id}')" value="좋아요"/>
			<span id="likeCount">0</span>
		</div>
	</form>
	<form id="recommendHate">
		<div>
			<input type="hidden" name="member_idx" value="${sessionScope.loginInfo.member_idx}">
			<input type="button" id="hateButton" onclick="hate('${board.board_id}')" value="싫어요"/>
			<span id="hateCount">0</span>
		</div>
	</form>

	</form>
	<h2>댓글</h2>
	<hr width="800px" align="left">
    <form id="replyForm">
    	<table>
    		<tr>
    			<td>
    				<input type="hidden" name="member_idx" value="${sessionScope.loginInfo.member_idx}">
        			<textarea id="reply_content" placeholder="댓글을 입력하세요"></textarea>
        		</td>
        		<td width="60px">
        			<input type="submit" value="댓글 작성"/>
        		</td>
        	</tr>
    	</table>
    </form>
    <div>
	    <table>
	    	</thead>
			<tbody id="replyList">		
			</tbody>
	    </table>
    </div>
</body>
<script>
loadReplyList();
recommendLike();
recommendHate();

var obj = {};

$('#replyForm').submit(function() {
	event.preventDefault(); // 기본 폼 제출 동작을 중지
	
	var memberIdx = $('[name="member_idx"]').val();
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
            $('#reply_content').val('');
        },
        error: function(e) {
            console.log('댓글 작성 실패:', e);
        }
    });
});

function loadReplyList() {
    $.ajax({
        type: 'GET',
        url: 'replyList',
        dataType: 'json',
        data: {'boardId': ${board.board_id}},
        success: function(data) {
            obj = data; // 불러온 데이터를 obj에 할당
            console.log(obj);
            drawList(obj);
        },
        error: function(e) {
            console.log(e);
        }
    });
}

function drawList(obj) {
    var replyList = '';

    if (obj) {
        obj.replyList.forEach(function(item, reply_id) {
            replyList += '<tr>';
            replyList += '<td width="80px">' + item.member_nickName + '</td>';
            if (item.editing) {
                replyList += '<td><textarea id="editContent' + item.reply_id + '">' + item.reply_content + '</textarea></td>';
                replyList += '<td><input type="button" onclick="saveEdit(' + item.reply_id + ')" value="저장" />';
                replyList += '<input type="button" onclick="cancelEdit(' + item.reply_id + ')" value="취소" /></td>';
            }else {
                replyList += '<td>' + item.reply_content;
                if (item.reply_modDate !== null) {
                    replyList += ' (수정됨)';
                }
                replyList += '</td>';
                replyList += '<td width="100px">' + item.reply_regDate + '</td>';
                if (item.member_idx === ${sessionScope.loginInfo.member_idx}) {
                    replyList += '<td width="40px"><input type="button" onclick="deleteReply(' + item.reply_id + ')" value="삭제"/></td>';
                    replyList += '<td width="40px"><input type="button" onclick="editReply(' + item.reply_id + ')" value="수정"/></td>';
                }else{            	
                	replyList += '<td colspan="2" width="40px"><input type="button" onclick="reportReply(' + item.reply_id + ')" value="신고"/></td>';
                }
            }
            replyList += '</tr>';
        });
    } else {
        replyList = '<tr><td colspan="5">댓글이 없습니다.</td></tr>';
    }

    $('#replyList').empty();
    $('#replyList').append(replyList);
}

function reportReply(reply_id) {
    var url = './compReply?reply_id=' + reply_id;
    location.href = url;
}

// 댓글 수정 함수
function editReply(reply_id) {
    var replyItem = obj.replyList.find(function(item) {
        return item.reply_id === reply_id;
    });

    if (replyItem) {
        replyItem.editing = true;
        drawList(obj);
    }
}

// 수정 저장
function saveEdit(reply_id) {
    var editedContent = $('#editContent' + reply_id).val();

    $.ajax({
        type: 'POST',
        url: 'replyUpdate',
        data: {
            reply_id: reply_id,
            editedContent: editedContent
        },
        dataType: 'json',
        success: function(data) {
            console.log('댓글 수정 성공:', data);
            loadReplyList();
        },
        error: function(e) {
            console.log('댓글 수정 실패:', e);
        }
    });
}

// 수정 취소하는 함수
function cancelEdit(reply_id) {
    var replyItem = obj.replyList.find(function(item) {
        return item.reply_id === reply_id;
    });

    if (replyItem) {
        replyItem.editing = false;
        drawList(obj);
    }
}

function deleteReply(reply_id) {
    if (confirm("댓글을 삭제하시겠습니까?")) {
        $.ajax({
            type: 'POST',
            url: 'replyDel',
            data: {
                reply_id: reply_id
            },
            dataType: 'json',
            success: function(data) {
                loadReplyList();
            },
            error: function(e) {
                console.log('댓글 삭제 요청 실패:', e);
            }
        });
    }
}

var one = "1";
var two = "2";

// 좋아요 버튼 요청시(회원이 이미 추천을 눌렀었나 DB에서 확인, if Count>0 이면 삭제 else면 추가)
function like(board_id, member_idx) {
	
	document.getElementById("likeButton").disabled = true;
	document.getElementById("hateButton").disabled = true;

	var member_idx = $('[name="member_idx"]').val();
	$.ajax({
		type: 'GET',
		url: 'checkRec',
		dataType: 'JSON',
		data: {
			board_id: board_id,
			member_idx: member_idx,
		},
		success: function(data){		
			console.log(data);
			if(data && data.checkRec > 0){
				console.log("삭제요청");
				deleteRec(board_id, member_idx, one);
				recommendLike();
				recommendHate();
			}else{
				console.log("좋아요 insert 요청");
				$.ajax({
					type: 'POST',
					url: 'like',
					data: {
						board_id: board_id,
						member_idx: member_idx
					},
					dataType: 'JSON',
					success: function(data){
						console.log(data);
						recommendLike();
						recommendHate();
					},
					error: function(e){
						console.log(e);
					}
				});
			}
		},
		error: function(e){
			console.log(e);
		}
	});	
	// 4초후 다시 버튼 활성화
	setTimeout(function() {
        document.getElementById("likeButton").disabled = false;
    }, 4000);
	setTimeout(function() {
        document.getElementById("hateButton").disabled = false;
    }, 4000);
}

// 싫어요 버튼 함수
function hate(board_id, member_idx) {
	
	document.getElementById("likeButton").disabled = true;
	document.getElementById("hateButton").disabled = true;

	var member_idx = $('[name="member_idx"]').val();
	var two = "2";
	$.ajax({
		type: 'GET',
		url: 'checkRec',
		dataType: 'JSON',
		data: {
			board_id: board_id,
			member_idx: member_idx,
		},
		success: function(data){
			console.log("checkRec 요청값");
			console.log(data);
			if(data && data.checkRec > 0){
				console.log("삭제요청");
				deleteRec(board_id, member_idx, two);
				recommendLike();
				recommendHate();
			}else{
				console.log("싫어요 insert 요청");
				$.ajax({
					type: 'POST',
					url: 'hate',
					data: {
						board_id: board_id,
						member_idx: member_idx
					},
					dataType: 'JSON',
					success: function(data){
						console.log(data);
						recommendLike();
						recommendHate();
					},
					error: function(e){
						console.log(e);
					}
				});
			}
		},
		error: function(e){
			console.log(e);
		}
	});	
	// 4초후 다시 버튼 활성화
	setTimeout(function() {
        document.getElementById("likeButton").disabled = false;
    }, 4000);
	setTimeout(function() {
        document.getElementById("hateButton").disabled = false;
    }, 4000);
}

// 좋아요 갯수 보여주는 함수
function recommendLike() {
    $.ajax({
        type: 'GET',
        url: 'recommendLike',
        dataType: 'json',
        data: { 'board_id': ${board.board_id} },
        success: function (data) {
            // console.log(data);
            $('#likeCount').text(data.likeCount);
        },
        error: function (e) {
            console.log(e);
        }
    });
}

// 싫어요 갯수 보여주는 함수
function recommendHate() {
    $.ajax({
        type: 'GET',
        url: 'recommendHate',
        dataType: 'json',
        data: { 'board_id': ${board.board_id} },
        success: function (data) {
            // console.log(data);
            $('#hateCount').text(data.hateCount);
        },
        error: function (e) {
            console.log(e);
        }
    });
}

// 추천 삭제 함수
function deleteRec(board_id, member_idx, rec_type) {
	
    $.ajax({
        type: 'POST',
        url: 'deleteRec',
        data: {
            board_id: board_id,
            member_idx: member_idx,
            rec_type: rec_type
        },
        dataType: 'JSON',
        success: function (data) {
        	// console.log(data);
        },
        error: function (e) {
            console.log(e);
        }
    });
}

</script>
</html>