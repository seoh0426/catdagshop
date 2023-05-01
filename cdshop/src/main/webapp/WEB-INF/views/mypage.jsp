<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/014e61e9c4.js" crossorigin="anonymous"></script>
<title>마이페이지</title>
<link rel="stylesheet" href="<c:url value="/resources/css/MyPage.css"/>">
<!-- 카카오 우편번호 API -->
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
    	console.log("찍힘");
    	let pw1 = document.getElementById("pw1").value;
    	let pw2 = document.getElementById("pw2").value;
    	
    	if(pw1 === pw2){
    		return true;	
    	}
    	alert("비밀번호가 일치하지 않습니다!. 다시 입력해주세요!")
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
                    <h2>개인정보 수정</h2>                    
                    <form:form action="./mypage" modelAttribute="member" method="post" onsubmit="return chkForm()">
                    	<input type="hidden" name="num" value="${member.num }">
                    	<input type="hidden" name="level" value="${member.level }">
                    	
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
                                <td class="td_left">비밀번호</td>
                                <td class="td_right">
                                    <form:input type="password" path="pw" class="inbox1" id="pw1" required="required"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_left">비밀번호확인</td>
                                <td class="td_right">
                                    <input type="password" name="pw2" class="inbox1" id="pw2" required="required">
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