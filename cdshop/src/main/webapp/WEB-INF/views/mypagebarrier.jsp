<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 검증</title>
<script src="https://kit.fontawesome.com/014e61e9c4.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/MyPageveri.css"/>">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
		let msg = ${msg}
		if(msg==null){			
		}
		else if(msg==-1){
			alert("비밀번호가 일치하지 않습니다! 다시 입력해주세요.")
		}
	});
</script>
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
                        <a href="<c:url value="/order/list"/>">
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
                    <h2>개인정보 수정</h2>
                    <p>${name }님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 입력해주시기 바랍니다.</p>
                    <c:url var="url" value="/mypage/barrier"/>
                    <form:form modelAttribute="member" action="${url }" method="post">
                    	<form:input type="hidden" path="pw"/>
                        <table class="my_table">
                            <tr>
                                <td class="td_left">이메일</td>
                                <td class="td_right">${member.email }</td>
                            </tr>
                            <tr>
                                <td class="td_left">비밀번호</td>
                                <td class="td_right">
                                    <input type="password" name="chkpw" size="10" required="required" class="my_pw"/>
                                </td>
                            </tr>
                        </table>
                        <p><i class="fas fa-info-circle"></i>타인에게 노출되지 않도록 주의하세요.</p>
                        <div class="my_inputbox">
                            <input type="submit" value="확인" class="submit">
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>