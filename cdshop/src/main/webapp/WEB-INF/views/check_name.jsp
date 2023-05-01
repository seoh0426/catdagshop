<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<%	
		String chk = request.getParameter("chk");
		System.out.println("chk : "+chk);
		if(chk == null){
			
		}
		else if (chk.equals("1")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이 닉네임을 사용할 수 없습니다. 새로운 닉네임을 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");			
		}
		else if(chk.equals("2")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('해당 닉네임을 사용할 수 있습니다')");
			script.println("window.close()");
			script.println("</script>");
		}
	%>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복 체크</title>
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
        <h2>닉네임 중복 체크</h2>
        <form action="<c:url value="/chkname"/>" method="post">
            닉네임  <input type="text" name="name" class="name" value="${name }"required>        
            <input type="submit" value="중복확인" class="email_check">
            <br>
            <div>
            	<!-- <p class="chkemail_sussecs">해당 이메일을 사용할 수 있습니다</p> -->
            	
           	</div>
            
            <div class="email_check_box">
                <button onclick="popup_close()" class="email_close">닫기</button>
            </div>
        </form>
    </div>
</body>
</html>