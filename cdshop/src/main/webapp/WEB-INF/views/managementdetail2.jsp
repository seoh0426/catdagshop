<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="<c:url value="/resources/css/MyPage.css"/>">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				document.querySelector("#postcode").value = data.zonecode;
            	document.querySelector("#address").value = data.address
        	}
    	}).open();
	}
	function chkForm(){
		let i = confirm("정말로 회원정보를 수정하시겠습니까?")
		if(i == true){		
			return true;
		}
		return false;		
	}
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
                    <h2>회원정보 수정</h2>                    
                    <form:form action="./${member.num }" modelAttribute="member" method="post" onsubmit="return chkForm()">
                    	<form:input type="hidden" path="pw"/>
                        <table class="my_table">
                            <tr>
                                <td class="td_left">이메일</td>
                                <td class="td_right">
                                    <form:input type="text" path="email" class="inbox1 read" readonly="true"/>
                                </td>
                            </tr>
                            <tr>
                            	<td class="td_left">닉네임</td>
                            	<td class="td_right">
                            		<form:input type="text" path="name" class="inbox1 read" readonly="true" />
                           		</td>
                            </tr>
                            <tr>
                                <td class="td_left">전화번호</td>
                                <td>
                                    <form:input type="text" path="phone1" class="inboxnum read" readonly="true"/>
                                    <span>-</span>
                                    <form:input type="text" path="phone2" class="inboxnum" required="required"/>
                                    <span>-</span>
                                    <form:input type="text" path="phone3" class="inboxnum" required="required"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_left">주소</td>
                                <td>
                                    <form:input type="text" id="postcode" path="post" class="inboxpost read" readonly="true"/>
                                    <input type="button" onclick="execDaumPostcode()" class="postbox" name="post" value="우편번호">
                                </td>
                            </tr>
                            <tr>
                                <td class="td_left"></td>
                                <td>
                                    <form:input type="text" id="address" path="addr1" class="inbox2"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_left"></td>
                                <td>
                                    <form:input type="text" path="addr2" class="inbox2" placeholder="상세주소"/>
                                </td>
                            </tr>
                            <tr>
                            	<td class="td_left">등급</td>
                            	<td>
                            		<form:input type="text" path="level" class="inbox2"/>
                            	</td>
                            </tr>
                        </table>
                        <div class="my_inputbox">
                            <input type="reset" value="취소" class="reset">
                            <input type="submit" value="확인" class="submit">
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>