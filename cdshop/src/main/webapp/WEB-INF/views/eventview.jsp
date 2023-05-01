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
		location.href='<c:url value="/notice/event/view/${pageNum}/updateboard/${num}"/>';
	}
      
	function write_delete(){
		location.href='<c:url value="/notice/event/view/${pageNum}/deleteboard/${num}"/>';
	}
      
	function recom() {
		let rc = document.getElementById('recom');
		let i = rc.querySelector('i');
		let span = rc.querySelector('span'); // span 엘리먼트 찾기
		rc.addEventListener("click", function(){
			value = !value;
	
	    	if(value){
	        	re = re+1;
	        	i.classList.remove('far');
	        	i.classList.add('fas');
	        	location.href='<c:url value="/notice/event/view/${pageNum}/${num}/true"/>';
	    	}
	    	else{
		        re = re-1;
		        i.classList.remove('fas');
	    	    i.classList.add('far');
	    	    location.href='<c:url value="/notice/event/view/${pageNum}/${num}/false"/>';
	    	}	
	    	span.innerText = re; // span 내용 업데이트
		})
    }
</script>
    
<title>이벤트 게시글</title>
</head>
<body>
	<jsp:include page="./header.jsp"/>
    <div class="view_head">
        <h1><a href="<c:url value="/notice/1"/>">공지사항</a></h1>
        <h1><a href="<c:url value="/notice/event/1"/>" style="color: #090909; border-bottom: 4px solid #fcd11e;">이벤트</a></h1>
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
                        <img src="<c:url value="/resources/img/event/${file.filename }"/>">
                    </div>
                    </c:forEach>
                </div>
                </c:if>
                <c:choose>
                <c:when test="${name != null }">
                    <div>
                        <button class="recom" id="recom"  onclick="recom()">
                            <i class="far fa-thumbs-up"></i>
                            <span>${board.recom }</span>
                        </button>
                    </div>
                </c:when>
                <c:otherwise>
                    <div>
                        <button class="recom" id="recom">
                            <i class="far fa-thumbs-up"></i>
                            <span>${board.recom }</span>
                        </button>
                    </div>
                </c:otherwise>
                </c:choose>                
            </div>
            <div class="replybox">
                <h2>댓글</h2>
                <ul>
                    <li>
                        <div class="re_user_id">
                            <div>찌무맘</div>
                            <div class="rechat">
                                <a onclick="window.open('<c:url value="/mypage/chatting" />','_blank','width=500,height=500,top=200,left=200')">1:1 채팅하기</a>
                            </div>
                        </div>
                        <div class="re_content">고양이가 너무 귀엽네요~~에구궁 ㅎ</div>
                        <div class="re_date">2022/02/07 11:12</div>
                        <div class="re_btn">
                            <button><img src="<c:url value='/resources/img/board/comment-pen.png'/>"></button>
                            <c:if test="${name == board.name || level == 2}">
                                <button><img src="<c:url value='/resources/img/board/comment-xmark.png'/>" ></button>
                            </c:if>
                        </div>
                        <div class="hr"></div>
                    </li>
                </ul>
                <div>
                    <form action="#" method="post">
                        <!-- 아래 input에 유저아이디를 담아야됨 -->
                        <input type="hidden" name="user_id">
                        <div class="reply_input_box">
                            <textarea >댓글내용</textarea>
                            <div class="inputbox">
                                <input type="submit" value="등록">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>