<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/commuboardview.css"/>">
<script src="https://kit.fontawesome.com/014e61e9c4.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
		location.href='<c:url value="/board/commu/view/${pageNum}/updateboard/${num}"/>';
	}
      
	function write_delete(){
		location.href='<c:url value="/board/commu/view/${pageNum}/deleteboard/${num}"/>';
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
	        	location.href='<c:url value="/board/commu/view/${pageNum}/${num}/true"/>';
	    	}
	    	else{
		        re = re-1;
		        i.classList.remove('fas');
	    	    i.classList.add('far');
	    	    location.href='<c:url value="/board/commu/view/${pageNum}/${num}/false"/>';
	    	}	
	    	span.innerText = re; // span 내용 업데이트
		})
    }
</script>
    
    
<title>커뮤니티 게시판의 게시글</title>
</head>
<body>
	<jsp:include page="./header.jsp"/>
    <div class="view_head">
        <h1><a href="<c:url value="/board/1"/>" >전체</a></h1>
        <h1><a href="<c:url value="/board/commu/1"/>" style="color: #090909; border-bottom: 4px solid #fcd11e;">자랑해요</a></h1>
        <h1><a href="<c:url value="/board/qna/1"/>">Q&A</a></h1>
        <h1><a href="<c:url value="/board/recom"/>">추천해요</a></h1>
    </div>
    <div class="container">
        <div class="view_tag">
            <img src="<c:url value="/resources/img/board/${board.tagsrc }"/>">
            <div>${board.tagvalue }</div>
        </div>
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
                        <img src="<c:url value="/resources/img/board/${file.filename }"/>">
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
                <h2>댓글 <span id="cnt"></span></h2>
                <ul id="comments">
                </ul>
                <div>
                    <form id="commentForm" method="post">
                        <!-- 아래 input에 유저아이디를 담아야됨 -->
                        <input type="hidden" name="name" value="${name}">
                        <input type="hidden" id="cb_num" name="bnum" value="${board.num}">
                        <input type="hidden" name="board_type" value="${board.board_type}">
                        <div class="reply_input_box">
                            <textarea id="comment" name="comment" placeholder="댓글 내용을 입력해주세요"></textarea>
                            <div class="inputbox">
                                <c:if test="${name != null}">
                                    <input type="button" onclick="in_comment()" value="등록">
                                </c:if>
                                <c:if test="${name == null}">
                                    <input type="button" value="등록">
                                </c:if>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        function in_comment(){
            //jquery 있어야됨
            $.ajax({
                //데이터 보내기
                type:'POST',
                url:"<c:url value='/board/addcomment'/>",
                data:$("#commentForm").serialize(),
                //보내기에 성공하면 할 행동
                success:function(data){
                    getcommentlist();
                },
                //보내기 실패하면 할 행동
                error:function(request,status,error){
                    alert("에러발생"+request+"\n"+status+"\n"+error);
                }
            })
        }
        //초기 페이지 로딩시 댓글목록 불러오기
        $(function(){
            getcommentlist();
        });
        function getcommentlist(){
            $.ajax({
                type:'GET',
                url:"<c:url value='/board/getcommentlist'/>",
                data: { "bnum": "<c:out value='${board.num}' />" },
                dataType:"json",
                success : function(data){
					//ul 셀렉트
					let comments = document.getElementById('comments');
					comments.textContent="";
					document.getElementById('comment').value="";
					let cnt = document.getElementById('cnt');
					cnt.innerHTML = data.length;
					let username = '${name}';
					let level = '${level}';
                    if(data.length > 0){
                        for(let i=0;i<data.length;i++){
                           let chkname = data[i].name;
                            let commentNode = document.createElement('li');
                            if (username === null || username === undefined) {
                               commentNode.innerHTML =
                                   `<div class="re_user_id">
                                        <input type="hidden" name="num" value="`+data[i].num+`"/>
                                        <input type="hidden" name="bnum" value="`+data[i].bnum+`"/>
                                        <div>`+data[i].name+`</div>
                                    </div>
                                    <div class="re_content">`+data[i].comment+`</div>
                                    <div class="re_date">`+data[i].regist+`</div>
                                    <div class="re_btn">
                                        <button><img src="<c:url value='/resources/img/board/comment-pen.png'/>"></button>
                                    </div>`;
                                comments.appendChild(commentNode);
                            }
                            if(username != chkname){
                               commentNode.innerHTML =
                                   `<div class="re_user_id">
                                        <input type="hidden" name="num" value="`+data[i].num+`"/>
                                        <input type="hidden" name="bnum" value="`+data[i].bnum+`"/>
                                        <div>`+data[i].name+`</div>
                                    </div>
                                    <div class="re_content">`+data[i].comment+`</div>
                                    <div class="re_date">`+data[i].regist+`</div>
                                    <div class="re_btn">
                                        <button><img src="<c:url value='/resources/img/board/comment-pen.png'/>"></button>
                                    </div>`;
                                comments.appendChild(commentNode);
                            }
                            if(username == chkname || level == 2){
                               commentNode.innerHTML =
                                   `<form id="commentForm2" method="POST">
                                        <div class="re_user_id">
                                            <input type="hidden" name="num" value="`+data[i].num+`"/>
                                            <input type="hidden" name="bnum" value="`+data[i].bnum+`"/>
                                            <div>`+data[i].name+`</div>
                                        </div>
                                        <div class="re_content">`+data[i].comment+`</div>
                                        <div class="re_date">`+data[i].regist+`</div>
                                        <div class="re_btn">
                                            <button><img src="<c:url value='/resources/img/board/comment-pen.png'/>"></button>
                                            <button type="button" onclick="deletecomment()"><img src="<c:url value='/resources/img/board/comment-xmark.png'/>" ></button>
                                        </div>
                                    </form>`;
                                comments.appendChild(commentNode);
                            }
                        }
                    }
                },
                error:function(request,status,error){
                    alert("댓글목록 불러오기 실패!");
                }
            })
        }
            function deletecomment(){
                    let delcm = confirm("정말로 댓글을 삭제하시겠습니까?")
                    if(delcm){
                        $.ajax({
                            type:'POST',
                            url:"<c:url value='/board/deletecomment'/>",
                            data:$("#commentForm2").serialize(),
                            //보내기에 성공하면 할 행동                        
                            success : function(data){
                                getcommentlist();
                            },
                            //보내기 실패하면 할 행동
                            error:function(request,status,error){
                                alert("에러발생"+request+"\n"+status+"\n"+error);
                            }
                        })
                    }
                    else{
                        return false;
                    }
                    
            }
    </script>
   	<jsp:include page="footer.jsp"/>
</body>
</html>