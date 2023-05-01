<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/MyPagechat.css"/>">
<script src="https://kit.fontawesome.com/014e61e9c4.js" crossorigin="anonymous"></script>
<title>Document</title>
</head>
<body>
	<jsp:include page="./header.jsp"/>
    <section>
        <div class="cart_head">
            <h1>마이페이지</h1>
        </div>
        <div class="container">
            <div class="mypagebox">
                 <ul class="my_left">
                    <li class="my_left_li1">
                        <h2><a href="<c:url value="/mypage"/>">MyPage</a></h2>
                    </li>
                    <li class="my_left_li2">
                        <a href="<c:url value="/mypage/barrier"/>">
                            <label for="msb1">
                                <span>개인정보수정</span>
                                <i class="fas fa-chevron-right"></i>
                            </label>
                        </a>
                    </li>
                    <li class="my_left_li3">
                        <a href="<c:url value="/mypage/order"/>">
                            <label for="msb2">
                                <span>주문목록</span>
                                <i class="fas fa-chevron-right"></i>
                            </label>
                        </a>
                    </li>
                    <li class="my_left_li4">
                        <a href="<c:url value="/mypage/cart"/>">
                            <label for="msb3">
                                <span>장바구니</span>
                                <i class="fas fa-chevron-right"></i>
                            </label>
                        </a>
                    </li>
                    <li class="my_left_li5">                            
                        <a href="<c:url value="/mypage/chat"/>">
                            <label for="msb4">
                                <span>1:1 채팅창</span>
                                <i class="fas fa-chevron-right"></i>
                            </label>
                        </a>
                    </li>
                </ul>
                <div class="my_right">
                    <h2>1:1 채팅창</h2>
                    <div class="mr_sub_box">
                        <ul>
                            <li>
                                <a onclick="window.open('<c:url value="/mypage/chatting" />','_blank','width=500,height=500,top=200,left=200')" style="cursor:pointer">
                                    <div class="chat_num">1</div>
                                    <div class="chat_cont">짜무님과의 채팅</div>
                                    <div class="chat_date">2022/02/07</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>