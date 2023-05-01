<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="<c:url value="/resources/css/management.css"/>">
<script src="https://kit.fontawesome.com/014e61e9c4.js" crossorigin="anonymous"></script>
<script >
    function updatemember(num){            
        location.href="./mgnview/"+num;
    }
    function deletemember(num){
        let i = confirm("정말 삭제하시겠습니까?\n삭제한 회원은 복원하실 수 없습니다.");
        if(i == true){
            location.href = "./mgndelete/"+num;
        }
    }
</script>
</head>
<body>
	<jsp:include page="./header.jsp"/>
 	<section> 		
        <div class="cart_head">
            <h1>관리자페이지</h1>
        </div>
        <div class="container">
            <div class="mypagebox">
                <ul class="my_left">
                    <li class="my_left_li1">
                        <h2><a href="<c:url value="/mypage"/>">관리자 페이지</a></h2>
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
                        <a href="<c:url value="/mypage/mgncommu"/>">
                            <label for="msb2">
                                <span>커뮤니티 관리</span>
                                <i class="fas fa-chevron-right"></i>
                            </label>
                        </a>
                    </li>
                    <li class="my_left_li4">
                        <a href="<c:url value="/mypage/mgnnotice"/>">
                            <label for="msb3">
                                <span>캣독마당 관리</span>
                                <i class="fas fa-chevron-right"></i>
                            </label>
                        </a>
                    </li>
                    <li class="my_left_li5">                            
                        <a href="<c:url value="/mypage/mgnhos"/>">
                            <label for="msb4">
                                <span>우리동네병원 관리</span>
                                <i class="fas fa-chevron-right"></i>
                            </label>
                        </a>
                    </li>
                    <li class="my_left_li5">                            
                        <a href="<c:url value="/mypage/mgnmember"/>">
                            <label for="msb4">
                                <span>회원 관리</span>
                                <i class="fas fa-chevron-right"></i>
                            </label>
                        </a>
                    </li>
                    <li class="my_left_li5">                            
                        <a href="<c:url value="/mypage/mgnshop"/>">
                            <label for="msb4">
                                <span>SHOP 관리</span>
                                <i class="fas fa-chevron-right"></i>
                            </label>
                        </a>
                    </li>
                </ul>
                <div class="my_right">
                    <h2>회원관리</h2>
                    <table class="my_table">
                        <tr class="title">
                            <td>번호</td>
                            <td>이메일</td>
                            <td>닉네임</td>
                            <td>연락처</td>
                            <td>등급</td>
                            <td>수정</td>
                            <td>삭제</td>
                        </tr>
                        <c:forEach items="${memberlist }" var="member">
                        <tr class="content">
                            <td id="num">${member.num }</td>
                            <td id="email">${member.email }</td>
                            <td id="name">${member.name }</td>
                            <td id="phone">${member.phone1 } - ${member.phone2 } - ${member.phone3 }</td>
                            <td id="level">${member.level }</td>
                            <td><button id="update" onclick="updatemember(${member.num})">수정</button></td>
                            <td><button id="delete" onclick="deletemember(${member.num})">삭제</button></td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </section>
</body>
</html>