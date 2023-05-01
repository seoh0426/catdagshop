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
	<title>커뮤니티 게시판</title>
</head>
<body>
	<jsp:include page="./header.jsp"/>
    <div class ="com_name">
		<h1><a href="<c:url value="/board/1"/>" >전체</a></h1>
		<h1><a href="<c:url value="/board/commu/1"/>">자랑해요</a></h1>
		<h1><a href="<c:url value="/board/qna/1"/>">Q&A</a></h1>
		<h1><a href="<c:url value="/board/recom"/>" style="color: #090909; border-bottom: 4px solid #fcd11e;">추천해요</a></h1>
    </div>
    <div class="container">
        <div class="midbox">
            <div class="seabox">
                <div class="search">
                	<form action="<c:url value="/board/recom/search"/>"  method="post" style="width:70%">
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
                <div class="filterbt">
                    <h1>추천해요</h1>
                </div>
                <c:if test="${name != null }">
                <div class="writebox">                	
                   	<a href="<c:url value="/boardwrite"/>" class="write">글쓰기</a>                    
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
		                        		<div class="colut">${board.board_type }</div>
		                        		<c:if test="${board.tagsrc != null }">
		                                <div class="colbt">
		                                    <img src="<c:url value="/resources/img/board/${board.tagsrc }" />" alt="아이콘" >
		                                    <div class="cattext1">${board.tagvalue }</div>
		                                </div>
		                                </c:if>
		                            	<div class="colhit">조회수 : ${board.hit }</div>
	                                </div>
	                                <div>
	                                	<c:choose>
	                                	<c:when test="${board.board_type == '자랑해요' }">
			                                <a href="<c:url value="/board/commu/view/${page.cri.pagenum }/${board.num }"/>" class="coltitle">${board.title }</a>
			                                <a href="<c:url value="/board/commu/view/${page.cri.pagenum }/${board.num }"/>" class="coltext">${board.content }</a>
		                                </c:when>
		                                <c:otherwise>
		                                	<a href="<c:url value="/board/qna/view/${page.cri.pagenum }/${board.num }"/>" class="coltitle">${board.title }</a>
			                                <a href="<c:url value="/board/qna/view/${page.cri.pagenum }/${board.num }"/>" class="coltext">${board.content }</a>
		                                </c:otherwise>
		                                </c:choose>	                                
		                            </div>
	                            </div>
	                       	    <div class="coreply">
		                            <div class="core1">
		                                답변 : 1
		                            </div>
		                            <div class="renickname">${board.name }</div>
		                            <div class="retime">작성시간 : ${board.calregist }</div>
		                        </div>
	                        </div>
                        	<c:if test="${board.files != null && !empty board.files}">
		                        <div class="colbox">
		                        	<c:choose>
		                        	<c:when test="${board.board_type == '자랑해요'}">
		                        		<a href="<c:url value="/board/commu/view/${page.cri.pagenum }/${board.num }"/>" class="imgbox">
			                        		<c:forEach items="${board.files }" var="file">
											<img class="listimg" src="<c:url value="/resources/img/board/${file.filename }"/>">
											</c:forEach>
										</a>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<a href="<c:url value="/board/qna/view/${page.cri.pagenum }/${board.num }"/>" class="imgbox">
			                        		<c:forEach items="${board.files }" var="file">
											<img class="listimg" src="<c:url value="/resources/img/board/${file.filename }"/>">
											</c:forEach>
										</a>
		                        	</c:otherwise>
		                        	</c:choose>
		                        	
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
                        <a href="<c:url value="/board/recom/search/${search }/1"/>">‹‹</a>
                    </li>
                </c:if>
                <c:if test="${page.cri.pagenum != 1 }">        	
                    <li class="leftbt">
                        <a href="<c:url value="/board/recom/search/${search }/${page.cri.pagenum-1 }" />" aria-label="Go to befor page">‹</a>
                    </li>
                </c:if>
                <c:forEach var="i" begin="${page.startpage }" end="${page.endpage }">
                    <li class="active">
                        <a href="<c:url value="/board/recom/search/${search }/${i}" />" aria-label="Go to page number 1">
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
                        <a href="/board/commu/${search }/${page.cri.pagenum+1 }" aria-label="Go to after number ">›</a>
                    </li>
                </c:if>            
                <c:if test="${page.next }">
                    <li>
                        <a href="<c:url value="/board/recom/search/${search }/${page.realend }" />">››</a>
                    </li>
                </c:if>
            </ul>
            </c:when>
        <c:otherwise>
        <ul class="pagebutton">
        	<c:if test="${page.prev }">
            	<li>
            		<a href="<c:url value="/board/recom/1"/>">‹‹</a>
            	</li>
            </c:if>
        	<c:if test="${page.cri.pagenum != 1 }">        	
	            <li class="leftbt">
	                <a href="<c:url value="/board/recom/${page.cri.pagenum-1 }" />" aria-label="Go to befor page">‹</a>
	            </li>
            </c:if>
            <c:forEach var="i" begin="${page.startpage }" end="${page.endpage }">
	            <li class="active">
	            	<a href="<c:url value="/board/recom/${i}" />" aria-label="Go to page number 1">
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
	                <a href="<c:url value="/board/recom/${page.cri.pagenum+1 }" />" aria-label="Go to after number ">›</a>
	            </li>
            </c:if>            
            <c:if test="${page.next }">
            	<li>
            		<a href="<c:url value="/board/recom/${page.realend }" />">››</a>
            	</li>
            </c:if>
        </ul>
        </c:otherwise>
        </c:choose>
    </div>
	<jsp:include page="footer.jsp"/>
</body>
</html>