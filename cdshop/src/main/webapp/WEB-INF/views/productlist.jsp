<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.springmvc.domain.productDTO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel = "stylesheet" href="<c:url value = "/resources/css/productlist.css" />">
    <script src="https://kit.fontawesome.com/014e61e9c4.js" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="container1">
        <div class="bbubbu">
            <div class="cos_nav">
                <ul>
                    <li class = "com_name">
                        SHOP
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="lounge">
        <div class="midbox">
            <div class="sidecate">
                <div class="sidehea">
                    <span class="catetitle">CATEGORY</span>
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
                            <input class="radiobt" type="radio" id="최신순" name="question" value="최신순" checked>
                            <label for="최신순">최신순</label>
                        </div>
                    </div>
                    <div class="filterbt">
                        <div class="radiobox">
                            <input class="radiobt" type="radio" id="인기순" name="question" value="인기순" checked>
                            <label for="인기순">인기순</label>
                        </div>
                    </div>
                    <div class="filterbt">
                        <div class="radiobox">
                            <input class="radiobt" type="radio" id="조회순" name="question" value="조회순" checked>
                            <label for="조회순">조회순</label>
                        </div>
                    </div>
    
                </div>
                <ul class="alllistbox">
                    <li class="listbox">
                    	<c:forEach items="${productlist}" var=""></c:forEach>
                        <a class="prodetail"href="./productview."></a>
                        <div class="productbox">
                            <a class="prodetail2" href="productpage.jsp">
                                <div class="proimg"><img src="<c:url value = "/resources/img/${product.tfilename}" />"alt=""></div>
                                <div class="procompany">${product.manufacturer}</div>
                                <div class="proname">${product.name }</div>
                                <hr class="prohr">
                                <div class="proprice">${product.unitprice}</div>
                                <input type="hidden" class="donnkow" value="">
                            </a>
                            <div class="cartbt"><a href="">장바구니</a></div>
                        </div>
                    </li>
                    <li class="listbox">
                        <a class="prodetail"href=""></a>
                        <div class="productbox">
                            <a class="prodetail2" href="">
                                <div class="proimg"><img src="" alt=""></div>
                                <div class="procompany">오리젠</div>
                                <div class="proname">오리젠 캣앤키튼 1.8kg</div>
                                <hr class="prohr">
                                <div class="proprice">₩38,000</div>
                                <input type="hidden" class="donnkow" value="">
                            </a>
                            <div class="cartbt"><a href="">장바구니</a></div>
                        </div>
                    </li>
                    <li class="listbox">
                        <a class="prodetail"href=""></a>
                        <div class="productbox">
                            <a class="prodetail2" href="">
                                <div class="proimg"><img src="./resources/img/origen_catkitten.jpg" alt=""></div>
                                <div class="procompany">오리젠</div>
                                <div class="proname">오리젠 캣앤키튼 1.8kg</div>
                                <hr class="prohr">
                                <div class="proprice">₩38,000</div>
                                <input type="hidden" class="donnkow" value="">
                            </a>
                            <div class="cartbt"><a href="">장바구니</a></div>
                        </div>
                    </li>
                    <li class="listbox">
                        <a class="prodetail"href=""></a>
                        <div class="productbox">
                            <a class="prodetail2" href="">
                                <div class="proimg"><img src="./resources/img/origen_catkitten.jpg" alt=""></div>
                                <div class="procompany">오리젠</div>
                                <div class="proname">오리젠 캣앤키튼 1.8kg</div>
                                <hr class="prohr">
                                <div class="proprice">₩38,000</div>
                                <input type="hidden" class="donnkow" value="">
                            </a>
                            <div class="cartbt"><a href="">장바구니</a></div>
                        </div>
                    </li>
                    <li class="listbox">
                        <a class="prodetail"href=""></a>
                        <div class="productbox">
                            <a class="prodetail2" href="">
                                <div class="proimg"><img src="./resources/img/origen_catkitten.jpg" alt=""></div>
                                <div class="procompany">오리젠</div>
                                <div class="proname">오리젠 캣앤키튼 1.8kg</div>
                                <hr class="prohr">
                                <div class="proprice">₩38,000</div>
                                <input type="hidden" class="donnkow" value="">
                            </a>
                            <div class="cartbt"><a href="">장바구니</a></div>
                        </div>
                    </li>
                    <li class="listbox">
                        <a class="prodetail"href=""></a>
                        <div class="productbox">
                            <a class="prodetail2" href="">
                                <div class="proimg"><img src="./resources/img/origen_catkitten.jpg" alt=""></div>
                                <div class="procompany">오리젠</div>
                                <div class="proname">오리젠 캣앤키튼 1.8kg</div>
                                <hr class="prohr">
                                <div class="proprice">₩38,000</div>
                                <input type="hidden" class="donnkow" value="">
                            </a>
                            <div class="cartbt"><a href="">장바구니</a></div>
                        </div>
                    </li>
                    <li class="listbox">
                        <a class="prodetail"href=""></a>
                        <div class="productbox">
                            <a class="prodetail2" href="">
                                <div class="proimg"><img src="./resources/img/origen_catkitten.jpg" alt=""></div>
                                <div class="procompany">오리젠</div>
                                <div class="proname">오리젠 캣앤키튼 1.8kg</div>
                                <hr class="prohr">
                                <div class="proprice">₩38,000</div>
                                <input type="hidden" class="donnkow" value="">
                            </a>
                            <div class="cartbt"><a href="">장바구니</a></div>
                        </div>
                    </li>
                    <li class="listbox">
                        <a class="prodetail"href=""></a>
                        <div class="productbox">
                            <a class="prodetail2" href="">
                                <div class="proimg"><img src="./resources/img/origen_catkitten.jpg" alt=""></div>
                                <div class="procompany">오리젠</div>
                                <div class="proname">오리젠 캣앤키튼 1.8kg</div>
                                <hr class="prohr">
                                <div class="proprice">₩38,000</div>
                                <input type="hidden" class="donnkow" value="">
                            </a>
                            <div class="cartbt"><a href="">장바구니</a></div>
                        </div>
                    </li>
                    <li class="listbox">
                        <a class="prodetail"href=""></a>
                        <div class="productbox">
                            <a class="prodetail2" href="">
                                <div class="proimg"><img src="/HTML&CSS/img/origen_catkitten.jpg" alt=""></div>
                                <div class="procompany">오리젠</div>
                                <div class="proname">오리젠 캣앤키튼 1.8kg</div>
                                <hr class="prohr">
                                <div class="proprice">₩38,000</div>
                                <input type="hidden" class="donnkow" value="">
                            </a>
                            <div class="cartbt"><a href="">장바구니</a></div>
                        </div>
                    </li>
                </ul>
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