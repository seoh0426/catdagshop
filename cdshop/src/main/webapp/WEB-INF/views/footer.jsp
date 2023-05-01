<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    /* footer */
    footer{
        background-color: #161619;
    }
    .footerbox{
        display: flex; 
        flex-direction: column;
        align-items: center;
        text-align: center;
        line-height: 32px;
        padding: 20px 0;
    }
    .footertxt{
        font-size: 13px;
    }
    .footerbox p{
        color: white;
    }
    .footerbox a{
        color: white;
        font-size: 14px;
        margin-left: 20px;
    }
    .footerbox a:hover{
        color: #eebb1c;
        transition: 600ms;
    }
</style>
<title>Footer</title>
</head>
<body>
    <!-- 하단 -->
    <footer>
        <div class="container">
            <div class="footerbox">
                <div class="footertxt">
                    <p>CDC © Copylight 2023, All Rights Reserved</p>
                    <p>경상남도 창원시 마산합포구 양덕동 15-27 KR 번지 경민인터빌 407호 </p>
                    <p>반려동물커뮤니티</p>
                    <p>책임자 : 김서현, 이영석</p>
                    <p>문의 : 055-716-1771, itedunet.com</p>
                </div>
                <div>
                    <a href="#">이용약관</a>
                    <a href="#">개인정보활용</a>
                </div>                
            </div>
        </div>
    </footer>
</body>
</html>