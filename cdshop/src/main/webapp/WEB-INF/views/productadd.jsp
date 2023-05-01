<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품등록</title>
<link rel = "stylesheet" href="<c:url value = "/resources/css/productadd.css" />">
    <script src="https://kit.fontawesome.com/014e61e9c4.js" crossorigin="anonymous"></script>
    <script>
	    function printfile(){
	        let name = document.getElementById('file1').value;
            //파일 전체 경로를 \ 로 나눔
            let filePathSplit = name.split('\\');
            //파일 전체 경로를 \ 로 나눈 길이
            let filePathLength = filePathSplit.length;
            //마지막 경로
            let fileName = filePathSplit[filePathLength-1]
            
	        document.getElementById('result').value =fileName;
	    }
	    function printfile2(){
	        let name = document.getElementById('file2').value;
            //파일 전체 경로를 \ 로 나눔
            let filePathSplit = name.split('\\');
            //파일 전체 경로를 \ 로 나눈 길이
            let filePathLength = filePathSplit.length;
            //마지막 경로
            let fileName = filePathSplit[filePathLength-1]
            
	        document.getElementById('result2').value =fileName;
	    }
    </script>
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
                    <span class="catetitle">CATEGORY</span>
                </div>
                <hr class="sidehr">
                <div class="listnamebox">
                    <span class="listname">DOG</span>
                </div>
                <div class="listtitle">
                    <ul class="list">
                        <li class="catelist">
                            <a class="cate" href=""><img src="./img/foot-removebg-preview.png" alt=""><span class="text">사료</span><img src="./img/foot-removebg-preview.png" alt=""></a>
                        </li>
                        <li class="catelist">
                            <a class="cate" href=""><img src="./img/foot-removebg-preview.png" alt=""><span class="text2">간식</span><img src="./img/foot-removebg-preview.png" alt=""></a>
                        </li>
                        <li class="catelist">
                            <a class="cate"href=""><img src="./img/foot-removebg-preview.png" alt=""><span class="text3">용품</span><img src="./img/foot-removebg-preview.png" alt=""></a>
                        </li>
                        <li class="catelist">
                            <a class="cate"href=""><img src="./img/foot-removebg-preview.png" alt=""><span class="text4">장난감</span><img src="./img/foot-removebg-preview.png" alt=""></a>
                        </li>
                    </ul>
                </div>
                <div class="listnamebox">
                    <span class="listname">CAT</span>
                </div>
                <div class="listtitle">
                    <ul class="list">
                        <li class="catelist">
                            <a class="cate" href=""><img src="./img/foot-removebg-preview.png" alt=""><span class="text">사료</span><img src="./img/foot-removebg-preview.png" alt=""></a>
                        </li>
                        <li class="catelist">
                            <a class="cate" href=""><img src="./img/foot-removebg-preview.png" alt=""><span class="text">간식</span><img src="./img/foot-removebg-preview.png" alt=""></a>
                        </li>
                        <li class="catelist">
                            <a class="cate"href=""><img src="./img/foot-removebg-preview.png" alt=""><span class="text">용품</span><img src="./img/foot-removebg-preview.png" alt=""></a>
                        </li>
                        <li class="catelist">
                            <a class="cate"href=""><img src="./img/foot-removebg-preview.png" alt=""><span class="text">장난감</span><img src="./img/foot-removebg-preview.png" alt=""></a>
                        </li>
                    </ul>
                </div>
                <div class="listtitle">
                    <ul class="list">
                        <div class="listnamebox">
                            <span class="listname">My Page</span>
                        </div>
                        <li class="catelist">
                            <a class="cate" href=""><span class="text">장바구니</span></a>
                        </li>
                        <li class="catelist">
                            <a class="cate" href=""><span class="text">주문목록</span></a>
                        </li>
                    </ul>
                </div>
                <div class="listtitle">
                    <ul class="list">
                        <div class="listnamebox">
                            <span class="listname">고객센터</span>
                        </div>
                        <li class="catelist">
                            <a class="cate" href=""><span class="text">QnA</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="midlounge">
            <div class="writebox">
                <div id="bodertitlebox">
                    <div class="title" >
                        <h2 class="tltelcss">상품등록</h2>
                    </div>
                    <hr class="hrline">
                    <div id="write_area">
                        <form:form modelAttribute="NewProduct" enctype="multipart/form-data" action="./add" class="from-hori" method="post">
                            <div id ="product_id">
                                <p class="idname">상품ID</p>
                                <form:textarea path="productId" name="p_Id" id="idtxt" cols="30" rows="10" required="required"></form:textarea>
                            </div>
                            <hr class="hrline">
                            <div id="in_title">
                                <p class="titletxt">상품명</p>
                                <form:select path="category" name="conoption" id="conoption">  
                                      <!-- 나중에 선택은 유효성 검사 통해서 잘못선택했다고 경고창 띄워줌 -->
                                    <option id="opdefult"value="none">카테고리</option>
                                    <optgroup label="DOG">
                                        <form:option value="dogfood">사료</form:option>
                                        <form:option value="dogsnack">간식</form:option>
                                        <form:option value="dogsup">용품</form:option>
                                        <form:option value="dogtoy">장난감</form:option>
                                    </optgroup>                             
                                    <optgroup label="CAT">
                                        <form:option value="catfood">사료</form:option>
                                        <form:option value="catsnack">간식</form:option>
                                        <form:option value="catsup">용품</form:option>
                                        <form:option value="cattoy">장난감</form:option>
                                    </optgroup> 
                                </form:select>
                                <form:textarea path="name" id="utitle" rows="1" cols="55" maxlength="100" required="required"></form:textarea>
                            </div>
                            <hr class="hrline">
                            <div id ="product_id">
                                <p class="manufacturer">제조사</p>
                                <form:textarea path="manufacturer" id="matxt" cols="30" rows="10" required="required"></form:textarea>
                            </div>
                            <hr class="hrline">
                            <div id="in_content">
                                <p class = "contenttxt">상품타이틀멘트</p>
                                <form:textarea path="titlement"  id="utiment" required="required"></form:textarea>
                            </div>
                            <hr class="hrline">
                            <div id="in_content">
                                <p class = "contenttxt">상품간단설명</p>
                                <form:textarea path="simpledescription" id="ucontent" required="required"></form:textarea>
                            </div>
                            <hr class="hrline">
                            <div class="upinfo">
                                <div class="pricebox">
                                    <p class="pricetxt">판매가</p>
                                    <form:input path="unitprice" type="text" class="upload-price"  />
                                    <p class="pricetxt">원</p>
                                </div>
                                <div class="quantitybox">
                                    <p class="quantitytxt">재고수량</p>
                                    <form:input path="unitsinstock" type="text" class="upload-quantity" />
                                    <p class="quantitytxt">개</p>
                                </div>
                                <p class="waringtxt">※ 숫자로만 입력하세요 !</p>
                            </div>
                            <hr class="hrline">
                            <div class="filebox">
                                <p class="filetitle">상품 정보 이미지</p>
                                <input class="upload-name" id="result" placeholder="첨부파일" readonly="readonly"/>
                                <label for="file1"> 파일찾기</label>
                                <form:input type="file" path="detailimage" id="file1" onchange="printfile()"/>
                            </div>
                            <hr class="hrline">
                            <div class="filebox">
                                <p class="filetitle">상품 대표 이미지</p>
                                <input class="upload-name" id="result2" placeholder="첨부파일" readonly="readonly"/>
                                <label for="file2"> 파일찾기</label>
                                <form:input type="file" path="titleimage" id="file2" onchange="printfile2()"/>
                            </div>
                            <hr class="hrline">
                            <div class="bt_se">
                                <button class="subutton" type="submit">글 작성</button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>