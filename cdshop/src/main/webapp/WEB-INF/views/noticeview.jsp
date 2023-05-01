<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/commuboardview.css"/>">
<script src="https://kit.fontawesome.com/014e61e9c4.js" crossorigin="anonymous"></script>
<script>
	let value = false;
	let re = 0;
	function chat_show(){
	    let show = document.getElementById('chat');
	    if(show.style.display == 'none'){
        	show.style.display = 'block';
    	}
    	else{
	        show.style.display = 'none';
	    }
	}
       
	function write_update(){
		location.href='<c:url value="/notice/view/${pageNum}/updatenotice/${num}"/>';
	}
      
	function write_delete(){
		location.href='<c:url value="/notice/view/${pageNum}/deletenotice/${num}"/>';
	}
</script>
    
<title>공지사항 게시글</title>
</head>
<body>
	<jsp:include page="./header.jsp"/>
    <div class="view_head">
        <h1><a href="<c:url value="/notice/1"/>" style="color: #090909; border-bottom: 4px solid #fcd11e;">공지사항</a></h1>
        <h1><a href="<c:url value="/notice/event/1"/>">이벤트</a></h1>
    </div>
    <div class="container">
        <div class="view_tag">
            <div>공지사항</div>
        </div>
    </div>
    <div class="container">
        <div>
            <div class="write_head">
                <h2>${board.title }</h2>                  
                <c:if test="${board.name == name || level == 2 }">                                       
                <div>
                    <button class="btn" onclick="write_update()">수정</button>
                    <button class="btn" onclick="write_delete()">삭제</button>
                </div>
                </c:if>
            </div>
            <hr>
            <div class="write_postbox">
                <div class="postbox_user">
                    <button onclick="chat_show()">
                        ${board.name }                        
                        <div id="chat" class="chat">
                            <a onclick="window.open('<c:url value="/mypage/chatting" />','_blank','width=500,height=500,top=200,left=200')">1:1 채팅하기</a>
                        </div>
                    </button>
                    <p class="postbox_date">${board.regist_day }</p>
                </div>
                <p class="postbox_text">${board.content }</p>
                <c:if test="${board.files != null && !empty board.files}">
                <div class="postbox_imgbox">
                    <c:forEach items="${board.files }" var="file">
                    <div class="postbox_img">
                        <img src="<c:url value="/resources/img/notice/${file.filename }"/>">
                    </div>
                    </c:forEach>
                </div>
                </c:if>            
            </div>
        </div>
    </div>
</body>
</html>