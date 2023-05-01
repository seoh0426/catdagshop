<%@page import="java.util.*"%>
<%@page import="com.springmvc.domain.productDTO"%>
<%@page import="com.springmvc.repository.productRepository"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href="<c:url value = "/resources/css/shopslide.css" />">
<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="utf-8">
<title>shopmain</title>
<script type="text/javascript"> //슬라이드 자바스크립트
        
        //SHOP 슬라이드
        $(document).ready(function () {
            $(".slide_shop").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김            
            setInterval(nextshopSlide, 10000); //10초(10000)마다 다음 슬라이드로 넘어감
        });
        
        //이전 슬라이드
        function prevshopSlide() {
            $(".slide_shop").hide(); //모든 div 숨김
            let allSlide = $(".slide_shop"); //모든 div 객체를 변수에 저장
            let currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
            
            //반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
            $(".slide_shop").each(function(index,item){ 
                if($(this).hasClass("active")) {
                    currentIndex = index;
                }
                
            });
            
            //새롭게 나타낼 div의 index
            let newIndex = 0;
            
            if(currentIndex <= 0) {
                //현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
                newIndex = allSlide.length-1;
            } else {
                //현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
                newIndex = currentIndex-1;
            }
        
            //모든 div에서 active 클래스 제거
            $(".slide_shop").removeClass("active");
            
            //새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
            $(".slide_shop").eq(newIndex).addClass("active");
            $(".slide_shop").eq(newIndex).show();
        
        }
        
        //다음 슬라이드
        function nextshopSlide() {
            $(".slide_shop").hide();
            let allSlide = $(".slide_shop");
            let currentIndex = 0;
            
            $(".slide_shop").each(function(index,item){
                if($(this).hasClass("active")) {
                    currentIndex = index;
                }
                
            });
            
            let newIndex = 0;
            
            if(currentIndex >= allSlide.length-1) {
                //현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
                newIndex = 0;
            } else {
                //현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
                newIndex = currentIndex+1;
            }
        
            $(".slide_shop").removeClass("active");
            $(".slide_shop").eq(newIndex).addClass("active");
            $(".slide_shop").eq(newIndex).show();
        }
       
        window.onload = function(){
            const add = document.getElementById('cartbt')
            add.addEventListener('click', function(){
                const data = qnt.value;
                alert("상품이 장바구니에 추가되었습니다!")
                window.location.href = "/cart/add?productId=${product.productId}"+data;
            });
            };
</script>
</head>
<body>
   <jsp:include page="header.jsp"/>
   <div class="container1">
        <div class="bbubbu" id="a">
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
                <section id="slideshop">
                   <div class="container">
                       <div class="slidebox">
                           <div class="slide_shop fade active">
                               <img src="<c:url value="/resources/img/slide01.jpg"/>">
                           </div>
                           <div class="slide_shop fade">
                               <img src="<c:url value="/resources/img/slide02.jpg"/>">
                           </div>
                           <div class="slide_shop fade">
                               <img src="<c:url value="/resources/img/slide03.jpg"/>">
                           </div>
               
                           <a class="prev" onclick="prevshopSlide()">&#10094;</a>
                           <a class="next" onclick="nextshopSlide()">&#10095;</a>
                       </div>
                    </div>
                </section>
                <div class="alllistbox">
                <c:forEach items ="${productlist}" var="product">
                    <div class="listbox">
                        <a class="prodetail" href="#"></a>
                        <div class="productbox">
                           <a class="prodetail2" href="<c:url value="/shopmain/productview?id=${product.productId }"/>">
                               <span class="proimg"><img src="/resources/img/${product.tfilename }" alt=""></span>
                               <span class="procompany">${product.manufacturer }</span>
                               <div class="proname">${product.name}</div>
                               <hr class="prohr">
                               <div class="proprice">${product.unitprice}원</div>
                               <input type="hidden" class="donnkow" value="">
                           </a>
                           <div class="cartbt"><a href="<c:url value="/mypage/cart"/>">장바구니</a></div>
                        </div>
                    </div>
                 </c:forEach>
                </div>
            </div>

        </div>
    </div>
   	<jsp:include page="footer.jsp"/>
</body>
</html>