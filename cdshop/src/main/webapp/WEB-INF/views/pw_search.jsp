<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>비밀번호 찾기 팝업창</title>
    <style>
        body
        {
            background-color: #fec6ca;
        }
        .email
        {
            height: 20px;
        }
        .email_check
        {
            border: none;
            background-color: #e4e4e6;
            padding: 4px;
            cursor: pointer;
        }
        .email_check_box
        {
            display: flex;
            justify-content: end;
            margin-top: 10px;
            margin-right: 20px;
        }
        .email_submit
        {
            border: 1px solid;
            border-radius: 5px;
            background-color: #ff8ea3;
            padding: 3px 10px;
        }
        .email_close
        {
            border: 1px solid;
            border-radius: 5px;
            background-color: #ff8ea3;
            padding: 3px 10px;
            margin-left: 10px;
        }
    </style>
    <script>
        function popup_close(){
            window.close();
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>비밀번호 찾기</h2>
        <form action="#">
            이메일  <input type="email" name="email" class="email" required>        
            <input type="button" value="이메일 확인" class="email_check">
            <br>
            <div class="email_check_box">
                <input type="submit"  value="전송" onclick="confirm('입력한 주소로 임시 비밀번호 발급했음')"  class="email_submit">
                <button onclick="popup_close()" class="email_close">닫기</button>
            </div>
        </form>
    </div>
</body>
</html>