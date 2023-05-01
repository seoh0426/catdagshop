<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/chat.css"/>">
<title>채팅창</title>
<script>
    function chat_close(){
        window.close();
    }
</script>
</head>
<body>
    <section>
            <div class="chat_head">
                <h2>1:1 채팅창</h2>
                <button onclick="chat_close()">닫기</button>                
            </div>
            <div class="chat_sub">
                <h2>(회원아이디)</h2>
            </div>
            <div class="chat_contbox">
                <ul>
                    <li class="you">
                        <div class="y_id">
                            <h3>상대방아이디</h3>
                        </div>
                        <div class="y_cht">채팅내용</div>                    
                        <div class="y_dat">2022/02/07 11:10</div>
                    </li>
                    <li class="me">
                        <div class="m_id">
                            <h3>내아이디</h3>
                        </div>
                        <div class="m_cht">채팅내용</div>
                        <div class="m_dat">2022/02/07 11:11</div>
                    </li>
                </ul>    
            </div>
            <div class="writebox">
                <form action="" method="post">
                    <input type="text" class="inbox" placeholder="메세지를 입력하세요.">
                    <input type="submit" class="send">
                </form>
            </div>
    </section>
</body>
</html>
