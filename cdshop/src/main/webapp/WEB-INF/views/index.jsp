<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>index</title>
    <script>
    	$(document).ready(function(){
    		let msg = ${msg}
    		if(msg == null){    			
    		}
    		else if(msg == 1){
    			alert("어서오세요! 오늘도 좋은 하루되세요!");
    		}
    		else if(msg == 2){
    			alert("회원가입을 축하합니다!\n로그인해주세요~");
    		}
    	});
    </script>
    <script type="text/javascript"> //슬라이드 자바스크립트
        //배너 슬라이드
        $(document).ready(function () {
            $(".slide_banner").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김            
            setInterval(nextbannerSlide, 10000); //10초(10000)마다 다음 슬라이드로 넘어감
        });
        
        //이전 슬라이드
        function prevbannerSlide() {
            $(".slide_banner").hide(); //모든 div 숨김
            let allSlide = $(".slide_banner"); //모든 div 객체를 변수에 저장
            let currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
            
            //반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
            $(".slide_banner").each(function(index,item){ 
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
            $(".slide_banner").removeClass("active");
            
            //새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
            $(".slide_banner").eq(newIndex).addClass("active");
            $(".slide_banner").eq(newIndex).show();
        
        }
        
        //다음 슬라이드
        function nextbannerSlide() {
            $(".slide_banner").hide();
            let allSlide = $(".slide_banner");
            let currentIndex = 0;
            
            $(".slide_banner").each(function(index,item){
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
        
            $(".slide_banner").removeClass("active");
            $(".slide_banner").eq(newIndex).addClass("active");
            $(".slide_banner").eq(newIndex).show();
        }
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
    </script>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <!-- 슬라이드 배너 -->
    <section id="slidebanner">
	    <div class="container">
	        <div class="slidebox">
	            <div class="slide_banner fade active">
	                <img src="<c:url value="/resources/img/index/slide01.jpg"/>">
	            </div>
	            <div class="slide_banner fade">
	                <img src="<c:url value="/resources/img/index/slide02.jpg"/>">
	            </div>
	            <div class="slide_banner fade">
	                <img src="<c:url value="/resources/img/index/slide03_1.jpg"/>">
	            </div>
	
	            <a class="prev" onclick="prevbannerSlide()">&#10094;</a>
	            <a class="next" onclick="nextbannerSlide()">&#10095;</a>
	        </div>
        </div>
    </section>
    <!-- 바로가기 아이콘 -->
    <section id="shortcut">
        <div class="container">
            <h1>바로가기</h1>
            <ul class="linkbox">
                <li class="linkimgbox">
                    <a href="<c:url value="/board/commu/1"/>">
                        <img class="linkimg" src="<c:url value="/resources/img/index/commuicon.png"/>" alt="커뮤니티">
                        <span class="linkspan">우리아이자랑</span>
                    </a>
                </li>
                <li class="linkimgbox">
                    <a href="<c:url value="/notice/1"/>">
                        <img class="linkimg" src="<c:url value="/resources/img/index/noticeicon.png"/>" alt="공지사항">
                        <span class="linkspan">공지사항</span>
                    </a>
                </li>
                <li class="linkimgbox">
                    <a href="<c:url value="/hospital"/>">
                        <img class="linkimg" src="<c:url value="/resources/img/index/hosicon.png"/>" alt="병원">
                        <span class="linkspan">우리동네병원</span>
                    </a>
                </li>
                <li class="linkimgbox">
                    <a href="#">
                        <img class="linkimg" src="<c:url value="/resources/img/index/shopicon.png"/>" alt="마켓">
                        <span class="linkspan">SHOP</span>
                    </a>
                </li>
            </ul>
        </div>
    </section>
    <!-- 글 상자 -->
    <!-- 공지사항 -->
    <section id="textbox">
        <div class="container noticebox">
            <h1>
                공지사항
                <span>중요사항을 알려드립니다</span>
                <a href="#">더보기 ></a>
            </h1>
            <ul>
                <li>
                    <div class="img_box">
                        <a href="#">
                            <img src="<c:url value="/resources/img/index/1.jpg"/>">
                        </a>
                    </div>
                    <div class="txt">
                        <h3>작성자</h3>
                        <a href="#">이건 공지사항 글입니다</a>
                    </div>
                </li>
                <li>
                    <div class="img_box">
                        <a href="#">
                            <img src="<c:url value="/resources/img/index/2.jpg"/>">
                        </a>
                    </div>
                    <div class="txt">
                        <h3>작성자</h3>
                        <a href="#">이건 공지사항 글입니다</a>
                    </div>
                </li>
                <li>
                    <div class="img_box">
                        <a href="#">
                            <img src="<c:url value="/resources/img/index/3.jpg"/>">
                        </a>
                    </div>
                    <div class="txt">
                        <h3>작성자</h3>
                        <a href="#">이건 공지사항 글입니다</a>
                    </div>
                </li>
                <li>
                    <div class="img_box">
                        <a href="#">
                            <img src="<c:url value="/resources/img/index/4.jpg"/>">
                        </a>
                    </div>
                    <div class="txt">
                        <h3>작성자</h3>
                        <a href="#">이건 공지사항 글입니다</a>
                    </div>
                </li>
            </ul>
        </div>
    </section>
    <!-- 인기글 -->
    <section id="textbox">
        <div class="container noticebox">
            <h1>
                인기글
                <span>최고의 게시글을 확인하시죠</span>
                <a href="#">더보기 ></a>
            </h1>
            <ul>
                <li>
                    <div class="img_box">
                        <a href="#">
                            <img src="<c:url value="/resources/img/index/21.jpg"/>">
                        </a>
                    </div>
                    <div class="txt">
                        <h3>호롱이맘</h3>
                        <a href="#">호롱이 ㄱㅇㅇ</a>
                    </div>
                </li>
                <li>
                    <div class="img_box">
                        <a href="#">
                            <img src="<c:url value="/resources/img/index/22.jpg"/>">
                        </a>
                    </div>
                    <div class="txt">
                        <h3>친칠라</h3>
                        <a href="#">난 친칠라가 좋아</a>
                    </div>
                </li>
                <li>
                    <div class="img_box">
                        <a href="#">
                            <img src="<c:url value="/resources/img/index/23.jpg"/>">
                        </a>
                    </div>
                    <div class="txt">
                        <h3>댕댕이</h3>
                        <a href="#">우리 애는 물어요</a>
                    </div>
                </li>
                <li>
                    <div class="img_box">
                        <a href="#">
                            <img src="<c:url value="/resources/img/index/24.jpg"/>">
                        </a>
                    </div>
                    <div class="txt">
                        <h3>작성자</h3>
                        <a href="#">이건 공지사항 글입니다</a>
                    </div>
                </li>
            </ul>
        </div>
    </section>
    <!-- 병원 후기 -->
    <section id="textbox">
        <div class="container noticebox">
            <h1>
                우리동네병원 후기
                <span>소중한 병원 후기</span>
                <a href="#">더보기 ></a>
            </h1>
            <ul>
                <li>
                    <div class="img_box">
                        <a href="#">
                            <img src="<c:url value="/resources/img/index/31.jpg"/>">
                        </a>
                    </div>
                    <div class="txt">
                        <h3>시월이맘</h3>
                        <a href="#">이 병원 가지마세요</a>
                    </div>
                </li>
                <li>
                    <div class="img_box">
                        <a href="#">
                            <img src="<c:url value="/resources/img/index/32.jpg"/>">
                        </a>
                    </div>
                    <div class="txt">
                        <h3>댕댕이</h3>
                        <a href="#">우리 애는 물어요</a>
                    </div>
                </li>
                <li>
                    <div class="img_box">
                        <a href="#">
                            <img src="<c:url value="/resources/img/index/33.jpg"/>">
                        </a>
                    </div>
                    <div class="txt">
                        <h3>작성자</h3>
                        <a href="#">이건 공지사항 글입니다</a>
                    </div>
                </li>
                <li>
                    <div class="img_box">
                        <a href="#">
                            <img src="<c:url value="/resources/img/index/34.jpg"/>">
                        </a>
                    </div>
                    <div class="txt">
                        <h3>작성자</h3>
                        <a href="#">이건 공지사항 글입니다</a>
                    </div>
                </li>
            </ul>
        </div>
    </section>
    <!-- shop 광고 -->
    <section id="slideshop">
        <div class="slidebox">
            <div class="slide_shop fade active">
                <img src="<c:url value="/resources/img/index/ad1.png"/>">
            </div>
            <div class="slide_shop fade">
                <img src="<c:url value="/resources/img/index/ad2.png"/>">
            </div>
            <div class="slide_shop fade">
                <img src="<c:url value="/resources/img/index/ad3.png"/>">
            </div>
            <div class="slide_shop fade">
                <img src="<c:url value="/resources/img/index/ad4.png"/>">
            </div>
            <div class="slide_shop fade">
                <img src="<c:url value="/resources/img/index/ad5.png"/>">
            </div>

            <a class="slideprev" onclick="prevshopSlide()">&#10094;</a>
            <a class="slidenext" onclick="nextshopSlide()">&#10095;</a>
        </div>
    </section>
    <!-- 하단 -->
    <jsp:include page="footer.jsp"/>
</body>