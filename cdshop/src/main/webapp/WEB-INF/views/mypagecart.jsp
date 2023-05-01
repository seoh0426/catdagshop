<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/Mypagecart.css"/>">
<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/014e61e9c4.js" crossorigin="anonymous"></script>
<title>마이페이지 - 장바구니</title>
<script>
    function selectall(selectall){
        const checkboxes = document.getElementsByName('chk');
        checkboxes.forEach((checkbox) =>{checkbox.checked = selectall.checked;} )
    }
    function chkselectall()  {
        // 전체 체크박스
        const checkboxes 
            = document.querySelectorAll('input[name="chk"]');
        // 선택된 체크박스
        const checked 
            = document.querySelectorAll('input[name="chk"]:checked');
        // select all 체크박스
        const selectAll 
            = document.querySelector('input[name="allchk"]');
        
        if(checkboxes.length === checked.length)  {
            selectAll.checked = true;
        }else {
            selectAll.checked = false;
        }
    }
    //장바구니 전체 삭제 (name 찾아서 일칠하는거 삭제)
    function chkForm(){
       let name = "${name}";
       const ischk = document.getElementById('allproduct').checked;
       if(ischk == true){
          return location.href="./alldelete?name="+name;
       }
       else {
          alert("전체체크를 해주세요")
             return false;
       }
    }
    
    
    // 장바구니 개별삭제
    function deleteConfirm(id){
       if(confirm("삭제합니다 !") == true) location.href="./delete?name="+name;
       else return;
    }
   
        
    
   
</script>
</head>
<body>
   <jsp:include page="./header.jsp"/>
   <section>
        <div class="cart_head">
            <h1>장바구니</h1>
        </div>
        <div class="container">
            <div class="mypagebox">
                <ul class="my_left">
                    <li class="my_left_li1">
                        <h2><a href="<c:url value="/mypage"/>">MyPage</a></h2>
                    </li>
                    <li class="my_left_li2">
                        <a href="<c:url value="/mypage/barrier"/>">
                            <label for="msb1">
                                <span>개인정보수정</span>
                                <i class="fas fa-chevron-right"></i>
                            </label>
                        </a>
                    </li>
                    <li class="my_left_li3">
                        <a href="<c:url value="/order/list"/>">
                            <label for="msb2">
                                <span>주문목록</span>
                                <i class="fas fa-chevron-right"></i>
                            </label>
                        </a>
                    </li>
                    <li class="my_left_li4">
                        <a href="<c:url value="/mypage/cart"/>">
                            <label for="msb3">
                                <span>장바구니</span>
                                <i class="fas fa-chevron-right"></i>
                            </label>
                        </a>
                    </li>
                    <li class="my_left_li5">                            
                        <a href="<c:url value="/mypage/chat"/>">
                            <label for="msb4">
                                <span>1:1 채팅창</span>
                                <i class="fas fa-chevron-right"></i>
                            </label>
                        </a>
                    </li>
                </ul>
                <div class="my_right">
                    <div class ="mr2">
                       <div class="allchkbox">
                       	   <div class="quandel2">
                                <a href="<c:url value = "javascript:chkForm()"/>">전체삭제</a>
                           </div>
                           
                           <div class="allproductbox">
	                           <label for="allproduct">전체선택</label>
	                           <input type="checkbox" id="allproduct" name="allchk" onclick="selectall(this)">
                           </div>
                       </div>
                    </div>
                    <c:forEach items="${cartlist}" var="item">
                       <div>
                            <div class="product_list">                    
                                    <div class="product_img">
                                        <img src="/resources/img/${item.tfilename }" alt="">
                                    </div>
                                    <div class="product_desc">
                                        <div class="product_desc_t">
                                            <h3>${item.productname}</h3>
                                            <input type="checkbox" id="allchk" name="chk" onclick="chkselectall()">
                                            <input type="hidden" class="price" value="${item.price}">
                                            <input type="hidden" class="totalprice_input" value="${item.price * item.quantity}">
                                            <input type="hidden" class="totalcount_input" value="${item.quantity}">
                                        </div>
                                        <div class="product_desc_b">
                                            <p> 금액 : ${item.price}</p>
                                            <div class="quanbox">                                                
                                               <p> 수량 : </p>
                                               <div class="qnt_box">
	                                               <form name="qntform" method="post" action="/cart/update" class="qntform">
		                                                <div class="quan_inbox">
		                                                       <input name="quantity" type="number"  value="${item.quantity}" class="it_quan"/>
		                                                       <input type="hidden" value="${item.productname}" name="Productname" class="uplodeid">
		                                                </div>
		                                                <button type="submit" class="updatebnt" >변경</button>
	                                                </form>
                                                </div>
                                                <div class="allprice">
                                                   <span>합계:</span><p class="sumprice"> ${item.price * item.quantity}</p> 원
                                                </div>
                                            </div>                                           
                                            <div class="quandel"><a href="<c:url value = "javascript:deleteConfirm('${item.productname}')"/>">삭제</a></div>    
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <div class="hr"></div>
                      </c:forEach>
                          
                        <div class="product_sum" >
                            <div class="opricebox">
                                <span>총 상품가격</span><div id="orderPrice"></div><span>원</span>
                            </div> 
                            <i class="fas fa-plus"></i>
                            <div class="delbox">
                                <span>총 배송비</span><div id="delPrice">2500</div><span>원</span>
                            </div>
                            <i class="fas fa-equals"></i>
                            <div class="tpricebox">
                                <span>총 주문 금액</span><div id="totalPriceDisplay"></div><span>원</span>
                                <input type="hidden" id="totalPrice" value="[total price]">
                            </div>
                        </div>
                        <div class="orderbnt_bnt">
                               <button type="button" class="orderbnt">주문하기</button>
                           </div>
                    </div>
                </div>
            </div>
    </section>
    <script>
    //체크박스 클릭시 클릭된 상품 합계 내주는 js
    let checkboxes = document.getElementsByName('chk');
    let allchkbox = document.getElementById('allproduct');
    let sumPriceElems = document.getElementsByClassName('sumprice');
    let orderPriceElem = document.getElementById('orderPrice');
    let totalPriceElem = document.getElementById('totalPrice');
    let totalPriceDisplayElem = document.getElementById('totalPriceDisplay');
    function updateOrderPrice() {
      let sum = 0;
      for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
          sum += parseInt(sumPriceElems[i].textContent);
        }
      }
      let del = 2500;
      orderPriceElem.innerText = sum;
      totalPriceElem.value = sum + del;
      if(sum == 0) {
        totalPriceElem.value = 0;
      }
      totalPriceDisplayElem.textContent = totalPriceElem.value;
    }
    function selectall(elem) {
      for (let i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = elem.checked;
      }
      updateOrderPrice();
    }
    allchkbox.addEventListener('change', function() {
      selectall(this);
    });
    for (let i = 0; i < checkboxes.length; i++) {
      checkboxes[i].addEventListener('change', function() {
        updateOrderPrice();
      });
    }
    updateOrderPrice();
    document.body.appendChild(totalPriceElem);
    
    </script>
    <script>
    // 선택된 상품을 상품 name과 totalprice 가지고 주문목록으로 이동하는 js
    
    document.querySelector('.orderbnt').addEventListener('click', function() {
         // 선택된 체크박스의 productId와 totalPrice 값을 담을 배열
         var selectedIds = [];
         var totalPrice = 0;
         
         // 체크된 상품들의 productId와 totalPrice 값을 배열에 담는다.
         document.querySelectorAll('.product_desc_t input[type="checkbox"]:checked').forEach(function(checkbox) {
           var productId = checkbox.parentElement.querySelector('h3').textContent;
           var price = parseFloat(checkbox.parentElement.querySelector('.price').value);
           var quantity = parseInt(checkbox.parentElement.querySelector('.totalcount_input').value);
           var totalprice = price * quantity;
           
           selectedIds.push(productId);
           totalPrice += totalprice;
         });
         
         // 선택된 상품이 없을 경우 alert 메시지 출력
         if(selectedIds.length === 0) {
           alert('선택된 상품이 없습니다.');
           return;
         }
         
         // 선택된 상품들의 productId와 totalPrice 값을 쿼리스트링으로 전달하여 페이지 이동
         var url = '/order/add?list='+selectedIds;
         /* url += '?productId=' + encodeURIComponent(selectedIds.join(',')); */
         url += '&totalPrice=' + encodeURIComponent(totalPrice);
         
         location.href = url;
       });

    </script>
</body>
</html>