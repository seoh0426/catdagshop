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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>커뮤니티 게시판</title>
	<script>
	    $(document).ready(function(){
	        let sort = '${sort}';
	        if(sort != null){
	        	document.getElementById(sort).checked=true;
	        }
	        if(sort == 'newest'){
	            document.getElementById('newest').checked=true;
	        }
	    });
	</script>
	<script>
		function newest(){
			location.href='<c:url value="/board/qna/newest/1"/>';
		}
		function popular(){
			location.href='<c:url value="/board/qna/popular/1"/>';
		}
		function viewed(){
			location.href='<c:url value="/board/qna/viewed/1"/>';
		}
	</script>
	
</head>
<body>
	<jsp:include page="./header.jsp"/>
    <div class ="com_name">
		<h1><a href="<c:url value="/board/1"/>" >전체</a></h1>
		<h1><a href="<c:url value="/board/commu/1"/>">자랑해요</a></h1>
		<h1><a href="<c:url value="/board/qna"/>" style="color: #090909; border-bottom: 4px solid #fcd11e;">Q&A</a></h1>
		<h1><a href="<c:url value="/board/recom"/>">추천해요</a></h1>
    </div>
    <div class="container">
        <div class="midbox">
            <div class="seabox">
                <div class="search">
                    <form action="<c:url value="/board/qna/search"/>"  method="post" style="width:70%">
	                    <input type="text" name="content" placeholder="찾으시는 글이 있으신가요?" maxlength="130" class="com_search" enterkeyhint="search" value="">
	                    <button class="button" type="submit" >
	                        <img src="<c:url value="/resources/img/seabut.png"/>" alt="search">
	                    </button>
                    </form>
                </div>
            </div>
        </div>
	</div>
	<hr class="borderline">
	<div class="container">
        <div class="loungebox">
            <div class="filterbox">
                <div class="filterbt">
                    <div class="radiobox">
                        <input class="radiobt" type="radio" id="newest" name="question" value="최신순" onchange="newest()" checked>
                        <label for="newest">최신순</label>
                    </div>
                </div>
                <div class="filterbt">
                    <div class="radiobox">
                        <input class="radiobt" type="radio" id="popular" name="question" value="인기순" onchange="popular()">
                        <label for="popular">인기순</label>
                    </div>
                </div>
                <div class="filterbt">
                    <div class="radiobox">
                        <input class="radiobt" type="radio" id="viewed" name="question" value="조회순" onchange="viewed()">
                        <label for="viewed">조회순</label>
                    </div>
                </div>
                <c:if test="${name != null }">
	                <div class="writebox">                	
	                   	<a href="<c:url value="/board/boardwrite"/>" class="write">글쓰기</a>                    
	                </div>
                </c:if>
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
		                                    <img src="<c:url value="/resources/img/board/${board.tagsrc }"/>" />
		                                    <div class="cattext1">${board.tagvalue }</div>
		                                </div>
		                            	<div class="colhit">조회수 : ${board.hit }</div>
	                                </div>
	                                <div>
		                                <a href="<c:url value="/board/qna/view/${page.cri.pagenum }/${board.num }"/>" class="coltitle">${board.title }</a>
		                                <a href="<c:url value="/board/qna/view/${page.cri.pagenum }/${board.num }"/>" class="coltext">${board.content }</a>	                                
		                            </div>
	                            </div>
	                       	    <div class="coreply">
		                            <div class="core1">
		                                답변 : 
		                            </div>
		                            <div class="renickname">${board.name }</div>
			                            <div class="retime">작성시간 : ${board.calregist}</div>
		                        </div>
	                        </div>
                        	<c:if test="${board.files != null && !empty board.files}">
		                        <div class="colbox">
		                        	<a href="<c:url value="/board/qna/view/${page.cri.pagenum }/${board.num }"/>" class="imgbox">
		                        		<c:forEach items="${board.files }" var="file">
										<img class="listimg" src="<c:url value="/resources/img/board/${file.filename }"/>">
										</c:forEach>
									</a>
									
	                        	</div>	
                        	</c:if>                      
                        </div>                        
                        <hr class="listgard">
                    </div>
					</c:forEach>
                </div>
            </div>
        </div>
        <c:choose>
        <c:when test="${search != null }"> <!-- 검색 페이징 -->
        <ul class="pagebutton">
        	<c:if test="${page.prev }">
            	<li>
            		<a href="<c:url value="/board/qna/search/${search }/1"/>">‹‹</a>
            	</li>
            </c:if>
        	<c:if test="${page.cri.pagenum != 1 }">        	
	            <li class="leftbt">
	                <a href="<c:url value="/board/qna/search/${search }/${page.cri.pagenum-1 }" />" aria-label="Go to befor page">‹</a>
	            </li>
            </c:if>
            <c:forEach var="i" begin="${page.startpage }" end="${page.endpage }">
	            <li class="active">
	            	<a href="<c:url value="/board/qna/search/${search }/${i}" />" aria-label="Go to page number 1">
	            		<c:choose>
		            		<c:when test="${page.cri.pagenum==i }">
		                		<font class="undefined"><b>${i }</b></font>
		                	</c:when>                	
		                	<c:otherwise>
		                		<font><b>${i }</b></font>
		                	</c:otherwise>
	                	</c:choose>
                	</a>
	            </li>
            </c:forEach>
            <c:if test="${page.cri.pagenum < page.realend }">
	            <li>
	                <a href="<c:url value="/board/qna/search/${search }/${page.cri.pagenum+1 }" />" aria-label="Go to after number ">›</a>
	            </li>
            </c:if>            
            <c:if test="${page.next }">
            	<li>
            		<a href="<c:url value="/board/qna/search/${search }/${page.realend }" />">››</a>
            	</li>
            </c:if>
        </ul>
        </c:when>
        <c:when test="${sort != null }">	<!-- 정렬 페이징 -->
        <ul class="pagebutton">
        	<c:if test="${page.prev }">
            	<li>
            		<a href="<c:url value="/board/qna/${sort }/1"/>">‹‹</a>
            	</li>
            </c:if>
        	<c:if test="${page.cri.pagenum != 1 }">        	
	            <li class="leftbt">
	                <a href="<c:url value="/board/qna/${page.cri.pagenum-1 }" />" aria-label="Go to befor page">‹</a>
	            </li>
            </c:if>
            <c:forEach var="i" begin="${page.startpage }" end="${page.endpage }">
	            <li class="active">
	            	<a href="<c:url value="/board/qna/${sort }/${i}" />" aria-label="Go to page number 1">
	            		<c:choose>
		            		<c:when test="${page.cri.pagenum==i }">
		                		<font class="undefined"><b>${i }</b></font>
		                	</c:when>                	
		                	<c:otherwise>
		                		<font><b>${i }</b></font>
		                	</c:otherwise>
	                	</c:choose>
                	</a>
	            </li>
            </c:forEach>
            <c:if test="${page.cri.pagenum < page.realend }">
	            <li>
	                <a href="<c:url value="/board/qna/${sort }/${page.cri.pagenum+1 }" />" aria-label="Go to after number ">›</a>
	            </li>
            </c:if>            
            <c:if test="${page.next }">
            	<li>
            		<a href="<c:url value="/board/qna/${sort }/${page.realend }" />">››</a>
            	</li>
            </c:if>
        </ul>
        </c:when>
        <c:otherwise>
        <ul class="pagebutton">
        	<c:if test="${page.prev }">
            	<li>
            		<a href="<c:url value="/board/qna/1"/>">‹‹</a>
            	</li>
            </c:if>
        	<c:if test="${page.cri.pagenum != 1 }">        	
	            <li class="leftbt">
	                <a href="<c:url value="/board/qna/${page.cri.pagenum-1 }" />" aria-label="Go to befor page">‹</a>
	            </li>
            </c:if>
            <c:forEach var="i" begin="${page.startpage }" end="${page.endpage }">
	            <li class="active">
	            	<a href="<c:url value="/board/qna/${i}" />" aria-label="Go to page number 1">
	            		<c:choose>
		            		<c:when test="${page.cri.pagenum==i }">
		                		<font class="undefined"><b>${i }</b></font>
		                	</c:when>                	
		                	<c:otherwise>
		                		<font><b>${i }</b></font>
		                	</c:otherwise>
	                	</c:choose>
                	</a>
	            </li>
            </c:forEach>
            <c:if test="${page.cri.pagenum < page.realend }">
	            <li>
	                <a href="<c:url value="/board/qna/${page.cri.pagenum+1 }" />" aria-label="Go to after number ">›</a>
	            </li>
            </c:if>            
            <c:if test="${page.next }">
            	<li>
            		<a href="<c:url value="/board/qna/${page.realend }" />">››</a>
            	</li>
            </c:if>
        </ul>
        </c:otherwise>
        </c:choose>
    </div>
	<jsp:include page="footer.jsp"/>
</body>
</html>