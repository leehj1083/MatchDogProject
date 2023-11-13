<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .alarmModal {
           	background-color: #C2E9E2;
           	/* z-index: 9999; */
			/* position: relative; */
			top: -960px;
			left: 30px;
			z-index: 2;
			display: inline-block;
			width: 420px;
			height: 600px;
			font-size: 12px;
			overflow-y: auto;
        }

        .alarmTable {
            width: 80%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .alarmTable 	img{
        		border: none;
        }

        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }

        .alarmTable img {
            max-width: 100px;
            max-height: 100px;
            border: none;
        }

        .closeButton {
            cursor: pointer;
            position: absolute;
            top: 5px;
            right: 10px;
            font-size: 16px;
        }
        .noneAlarm {
        		margin-top: 190px;
        		}
    		.noneAlarm span{
    			font-size: 60px;
    		}
    		.noneAlarm p{
    			font-size: 17px;
    		}
    </style>
</head>
<body>
<div class="alarmModal">
    <span class="closeButton" onclick="closeModal()">&times;</span>
    <h2>알람</h2>
    <hr>
    <c:choose>
        <c:when test="${not empty alarmList}">
            <c:forEach var="alarm" items="${alarmList}">
                <table class="alarmTable">
                    <tr>
                        <td>
                    <img src="${alarm.photo_fileName}" alt="min_photo_fileName" class="noBorder"> 
                        </td>
                        <td>
                            <c:if test="${alarm.alarm_type == 1}">
                                <h3>${alarm.member_nickName}&nbsp${alarm.alarm_msg}</h3>
                                <p>${alarm.alarm_genDate}</p>
                            </c:if>
                            <c:if test="${alarm.alarm_type == 2}">
                                <h3>${alarm.member_nickName}&nbsp${alarm.alarm_msg}😊</h3>
                                <p>${alarm.alarm_genDate}</p>
                            </c:if>
                        </td>
                    </tr>
                </table>
            </c:forEach>
        </c:when>
        <c:otherwise>
        <div class = "noneAlarm">
        <span class="bi bi-bell"></span>
            <p>새로운 소식이 없습니다.</p>
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
