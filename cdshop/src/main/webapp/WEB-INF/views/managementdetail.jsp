<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정팝업창</title>
<style>
    h2
    {
        margin-left: 20px;
    }
    table
    {
        border-collapse: collapse;
        border-spacing: 0;            
    }
    td
    {
        padding: 10px 20px;
        border-top: 1px solid #c9c9c9;
        border-bottom: 1px solid #c9c9c9;
    }
    .td_left
    {
        width: 100px;
        background-color: #f7f7f7;
        color: #333;
        font-weight: bold;            
    }
    .td_right
    {
        width: 350px;
        border-left: 1px solid #c9c9c9;
    }
    /* 인풋박스 */
    .inputbox
    {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
    }
    .btn{
        display:inline-block;
        color:#000;
        cursor: pointer;
        border:1px solid #333;
        border-radius:5px;
        margin-right: 10px;
        padding:10px;
    }
    .btn:hover {
        border:1px solid;
        background:#0084ff;
        color:#fff
    }
</style>
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
	
	function popup_close(){
		window.close();
   	}
	
	window.onload = function(){
		let msg ="${msg}";
		if(msg==1){
			alert("수정에 성공했습니다!");
			window.close();
		}
	}
</script>
</head>
<body>
    <h2>회원 정보</h2>
    <form:form action="./${member.num }" modelAttribute="member" method="post">
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
                <td class="td_right">
                    <form:input type="text" path="phone1" class="inboxnum read" readonly="true"/>
                    <span>-</span>
                    <form:input type="text" path="phone2" class="inboxnum" required="required"/>
                    <span>-</span>
                    <form:input type="text" path="phone3" class="inboxnum" required="required"/>
                </td>
            </tr>
            <tr>
                <td class="td_left">우편번호</td>
                <td class="td_right">
                    <form:input type="text" id="postcode" path="post" class="inboxpost read" readonly="true"/>
                    <input type="button" onclick="execDaumPostcode()" class="postbox" name="post" value="우편번호">
                </td>
            </tr>
            <tr>
                <td class="td_left">주소</td>
                <td class="td_right">
                    <form:input type="text" id="address" path="addr1" class="inbox2"/>
                </td>
            </tr>
            <tr>
                <td class="td_left">상세주소</td>
                <td class="td_right">
                    <form:input type="text" path="addr2" class="inbox2" placeholder="상세주소"/>
                </td>
            </tr>
            <tr>
                <td class="td_left">등급</td>
                <td class="td_right">
                    <form:input type="text" path="level" class="inbox2"/>
                </td>
            </tr>
        </table>
        <div class="inputbox">
            <input type="submit" class="btn" value="수정">
            <input type="button" class="btn" value="닫기" onclick="popup_close()">
        </div>
    </form:form>
</body>
</html>