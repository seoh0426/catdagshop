<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<c:url value="/resources/css/board.css"/>">
<title>동물병원 후기 게시판</title>
</head>
<body>
	<jsp:include page="./header.jsp"/>
    <div class ="com_name">
		<h1><a href="<c:url value="/hospital"/>">우리동네동물병원</a></h1>
		<h1><a href="<c:url value="/hospital/reviews"/>" style="color: #090909; border-bottom: 4px solid #fcd11e;">후기에요</a></h1>
    </div>
    <div class="container">
        <div class="midbox">
            <div class="seabox">
                <div class="search">
                    <form action="<c:url value="/board/search"/>"  method="post" style="width:70%">
	                    <input type="text" name="content" placeholder="찾으시는 글이 있으신가요?" maxlength="130" class="com_search" enterkeyhint="search" value="">
	                    <button class="button" type="submit" >
	                        <img src="<c:url value="/resources/img/seabut.png"/>" alt="search">
	                    </button>
                    </form>
                </div>
            </div>
        </div>
        <hr class="borderline">
        <div class="loungebox">
            <div class="filterbox">
                <div class="writebox">
                    <a href="./commuwrite.action" class="write">글쓰기</a>
                </div>
            </div>
            <div class="loungelist">
                <div class="conlist">
                	<c:forEach items="${boardlist }" var="board">
                    <div class="content">
                    	<div class="content_2">
                    		<div>
		                        <div class="colist">
		                        	<div class="colup">
		                                <div class="colbt">
		                                    <img src="${tag_src }" >
		                                    <div class="cattext1">${tag_value }</div>
		                                </div>
		                            	<div class="colhit">조회수 : ${board.hit }</div>
	                                </div>
	                                <div>
		                                <a href="./reviews/view?num=${board.num }&pageNum=" class="coltitle">${board.title }</a>
		                                <a href="./reviews/view?num=${board.num }&pageNum=" class="coltext">${board.content }</a>	                                
		                            </div>
	                            </div>
	                       	    <div class="coreply">
		                            <div class="core1">
		                                답변 : 
		                            </div>
		                            <div class="renickname">${board.name }</div>
		                            <div class="retime">조회수 : ${regist_day }</div>
		                        </div>
	                        </div>
                        	<c:if test="${board.filename != null }">
		                        <div class="colbox">
		                        	<a href="./reviews/view?num=${board.num }&pageNum=" class="imgbox">
										<img class="listimg" src="./resources/img/${board.filename }">
									</a>
	                        	</div>	
                        	</c:if>                     
                        </div>                        
                        <hr class="listgard">
                    </div>
					</c:forEach>
                    <div class="content">
                    	<div class="content_2">
                    		<div>
		                        <div class="colist">
		                        	<div class="colup">
		                                <div class="colbt">
		                                    <img src="<c:url value="/resources/img/board/dogface.png" />" alt="아이콘" >
		                                    <div class="cattext1">강아지</div>
		                                </div>
		                            	<div class="colhit">조회수 : 0</div>
	                                </div>
	                                <div>
		                                <a href="./reviews/view?num=${board.num }&pageNum=" class="coltitle">반려동물 침대에서 함께자나요?</a>
		                                <a href="./reviews/view?num=${board.num }&pageNum=" class="coltext">안녕하세요. 3년차 강아지 키우고 있는 아빠입니다. 처음 데려올 땐 "사람과 동물이 어디 한 침대야~" 라며 절대불가를 외쳤지만 지금은 잘때 한 방에 없으면 서운하고 꼭  불러서 침대로 오게 만드는 라이프를 살고 있습니다. 워낙 첨엔 숙면을 잘 못취하기도 하고, 불편했는데 그냥 매번 올라오는 강아지를 떨쳐낼 수가 없어 고민을 해결하다 못해 이런 가구는 어떨까 하며 여기까지 생각이 오게 되었습니다 ^^ 그냥 거창한 설문 조사는 아니고, 주변 반려인들께서는 어떤 잠자리를 하고 계실까 다른 반려동물들은 어떻게 침대에서 생활할까 궁금하기도 하고 자료가 필요하기도 하여 서투른 질문지들을 작성하여 이렇게 요청을 드립니다. 가벼운 마음으로, 작성해주시면 정말 감사하겠습니다. 추첨 통해 스타벅스 기프티콘 드려요! </a>	                                
		                            </div>
	                            </div>
	                       	    <div class="coreply">
		                            <div class="core1">
		                                답변 : 0
		                            </div>
		                            <div class="renickname">봉봉</div>
		                            <div class="retime">2시간전</div>
		                        </div>
	                        </div>
                        	<%-- <c:if test="${board.filename != null }"> --%>
		                        <div class="colbox">
		                        	<a href="./reviews/view?num=${board.num }&pageNum=" class="imgbox">
										<img class="listimg" src="<c:url value="/resources/img/ggimu.jpg"/>">
									</a>
	                        	</div>	
                        	<%-- </c:if> --%>                     
                        </div>                        
                        <hr class="listgard">
					</div>
                </div>
            </div>
        </div>
        <ul class="pagebutton">
            <li class="leftbt">
                <a href="#" aria-label="Go to befor page">‹</a>
            </li>
            <li class="active">
                <a class="undefined" href="#" aria-label="Go to page number 1">1</a>
            </li>
            <li class>
                <a href="#" aria-label="Go to page number 2">2</a>
            </li>
            <li class>
                <a href="#" aria-label="Go to page number 3">3</a>
            </li>
            <li class>
                <a href="#" aria-label="Go to page number 4">4</a>
            </li>
            <li class>
                <a href="#" aria-label="Go to page number 5">5</a>
            </li>
            <li class>
                <a href="#" aria-label="Go to after number ">›</a>
            </li>
        </ul>
    </div>
	<jsp:include page="footer.jsp"/>
</body>
</html>