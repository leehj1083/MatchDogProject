<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- bootstrap 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<!-- pretendard 폰트 -->
	<link rel="stylesheet" type="text/css" href='https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css'>
    <style>
        .alarmModal {
			display: inline-block;
        	position:absolute;
           	background-color: var(--white);
			top: 46px;
			left: 808px;
			z-index: 9999;
			width: 420px;
			height: 600px;
			font-family:pretendard;
			font-size: 12px;
			border: 1px solid var(--light);
			box-shadow: 0 0 8px 1px var(--light);
			border-radius:10px;
			overflow-y: auto;
        }
        
        .alram_top{
        	display:inline-block;
        }
        
        .alarm_line{
        	width:100%;
        	height:1px;
        	background-color:var(--light);
        }
        
        .alarm_subject{
        	display:inline-block;
			position:relative;
			margin: 20px 40px;
			top:5px;
			width: 200px;
			height:30px;
			font-size:20px;
			font-family:Pretendard;
			font-weight: 600;
			color:var(--green);
			cursor:auto;
        }
        
        .alarmTable {
        	display:flex;
        	align-items: center;
        	margin : 20px auto;
            width: 90%;
            border-bottom:1px solid var(--light);
        }
        
        .alarmTable img{
        	display:inline-block;
        	border: 1px solid var(--light);
        	box-shadow: 0 0 2px 1px var(--light);
        	width:100px;
        	height:100px;
        	object-fit: cover;
        	margin: 8px;
        	border-radius: 50%;
        	
        }
        
        .alarm_part{
        	display:flex;
        	flex-direction: column;
    		margin-left: 20px;
        }
        
        .alarm_text{
        	display:inline-block;
        	font-size:16px;
			font-family:Pretendard;
			color:var(--dark);
			font-weight: 600;
			width:220px;
			word-break: break-all;
        	
        }
        
        .closeButton {
            position: absolute;
			left: 370px;
			top: 10px;
			cursor: pointer;
			font-size: 32px;
			color:var(--grey);
        }
        
        .noneAlarm {
        	margin : 190px 30px;
        }
    	.noneAlarm span{
    		font-size: 30px;
    		margin-right:16px;
    	}
    	.noneAlarm div{
    		font-size: 18px;
    	}
    </style>
</head>
<body>
<div class="alarmModal">
    <span class="closeButton" onclick="closeModal()">&times;</span>
    <div class="alram_top">
    	<div class="alarm_subject">알람</div>
    </div>
    <div class ="alarm_line"></div>
    <c:choose>
        <c:when test="${not empty alarmList}">
            <c:forEach var="alarm" items="${alarmList}">
                <div class="alarmTable">
                           <img src="${alarm.photo_fileName}" alt="min_photo_fileName" class="noBorder">
                	<div class="alarm_part">
                            <c:if test="${alarm.alarm_type == 1}">
                                <span class="alarm_text bold">${alarm.member_nickName}&nbsp${alarm.alarm_msg}</span>
                                <p>${alarm.alarm_genDate}</p>
                            </c:if>
                            <c:if test="${alarm.alarm_type == 2}">
                                <div class="alarm_text bold">${alarm.member_nickName}&nbsp${alarm.alarm_msg}😊</div>
                                <p>${alarm.alarm_genDate}</p>
                            </c:if>
					</div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
        <div class = "noneAlarm">
        <span class="bi bi-bell"></span>
            <div class="alarm_text bold">새로운 소식이 없습니다.</div>
         </div>
        </c:otherwise>
    </c:choose>
</div>

</body>
<script>

    function closeModal() {
        $(".alarmModal").hide();
    }
</script>
</html>
