<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.springmvc.domain.productDTO"%>
<%@page import="com.springmvc.repository.productRepository"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="<c:url value = "/resources/css/catsnack.css" />">
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="container1">
        <div class="bbubbu">
            <nav class="cos_nav">
                <ul>
                    <li class = "com_name">
                        SHOP
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="lounge">
        <div class="midbox">
            <div class="sidecate">
                <div class="sidehea">
                    <a href="<c:url value="/shopmain/all"/>"><span class="catetitle">CATEGORY</span></a>
                </div>
                <hr class="sidehr">
                <div class="listnamebox">
                    <span class="listname">DOG</span>
                </div>
                <div class="listtitle">
                    <ul class="list">
                        <li class="catelist">
                            <a class="cate" href="<c:url value="/shopmain/dogfood"/>"><span class="text">사료</span></a>
                        </li>
                        <li class="catelist">
                            <a class="cate" href="<c:url value="/shopmain/dogsnack"/>"><span class="text2">간식</span></a>
                        </li>
                        <li class="catelist">
                            <a class="cate"href="<c:url value="/shopmain/dogsup"/>"><span class="text3">용품</span></a>
                        </li>
                        <li class="catelist">
                            <a class="cate"href="<c:url value="/shopmain/dogtoy"/>"><span class="text4">장난감</span></a>
                        </li>
                    </ul>
                </div>
                <div class="listnamebox">
                    <span class="listname">CAT</span>
                </div>
                <div class="listtitle">
                    <ul class="list">
                        <li class="catelist">
                            <a class="cate" href="<c:url value="/shopmain/catfood"/>"><span class="text">사료</span></a>
                        </li>
                        <li class="catelist">
                            <a class="cate" href="<c:url value="/shopmain/catsnack"/>"><span class="text">간식</span></a>
                        </li>
                        <li class="catelist">
                            <a class="cate"href="<c:url value="/shopmain/catsup"/>"><span class="text">용품</span></a>
                        </li>
                        <li class="catelist">
                            <a class="cate"href="<c:url value="/shopmain/cattoy"/>"><span class="text">장난감</span></a>
                        </li>
                    </ul>
                </div>
                <div class="listtitle">
                    <ul class="list">
                        <div class="listnamebox">
                            <span class="listname">My Page</span>
                        </div>
                        <li class="catelist">
                            <a class="cate" href="<c:url value="/mypage/cart"/>"><span class="text">장바구니</span></a>
                        </li>
                        <li class="catelist">
                            <a class="cate" href="<c:url value="/order/list"/>"><span class="text">주문목록</span></a>
                        </li>
                    </ul>
                </div>
                <div class="listtitle">
                    <ul class="list">
                        <div class="listnamebox">
                            <span class="listname">고객센터</span>
                        </div>
                        <li class="catelist">
                            <a class="cate" href="<c:url value="/board/qna"/>"><span class="text">QnA</span></a>
                        </li>
                        
                    </ul>
                </div>
                
            </div>
        </div>
        <div class="shoplistmid">
            <div class="shoplounge">
                <div class="filterbox">
                    <div class="filterbt">
                        <div class="radiobox">
                            <input class="radiobt" type="radio" id="최신순" name="question" value="new" checked>
                            <label for="new">최신순</label>
                        </div>
                    </div>
                      <div class="filterbt">
                        <div class="radiobox">
                            <input class="radiobt" type="radio" id="조회순" name="question" value="hot" checked>
                            <label for="hot">인기순</label>
                        </div>
                    </div>
                    <div class="filterbt">
                        <div class="radiobox">
                            <input class="radiobt" type="radio" id="인기순" name="question" value="hprice" checked>
                            <label for="hprice">높은가격순</label>
                        </div>
                    </div>
                    <div class="filterbt">
                        <div class="radiobox">
                            <input class="radiobt" type="radio" id="조회순" name="question" value="rprice" checked>
                            <label for="rprice">낮은가격순</label>
                        </div>
                    </div>
                </div>
                <div class="alllistbox">
                <c:forEach items="${productlist}" var="product">
                <c:if test="${product.category eq 'catsnack'}">
                    <div class="listbox">
                        <a class="prodetail"href="#"></a>
                        <div class="productbox">
                            <a class="prodetail2" href="<c:url value="/shopmain/productview?id=${product.productId }"/>">
                                <div class="proimg"><img src="/resources/img/${product.tfilename }" alt=""></div>
                                <div class="procompany">${product.manufacturer }</div>
                                <div class="proname">${product.name}</div>
                                <hr class="prohr">
                                <div class="proprice">${product.unitprice}원</div>
                                <input type="hidden" class="donnkow" value="">
                            </a>
                            <div class="cartbt"><a href="">장바구니</a></div>
                        </div>
                    </div>
                </c:if>
               	</c:forEach>
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
    </div>
</body>
</html>