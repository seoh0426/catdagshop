<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/resources/css/singup.css"/>">
    <!-- 카카오 우편번호 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                document.querySelector("#postcode").value = data.zonecode;
	                document.querySelector("#address").value = data.address
	            }
	        }).open();
	    }
	</script>
    <script>
    	//전체 동의 눌리면 하위체크박스 같이 눌러지게 하기
        function selectAll(selectAll){
            const checkboxes = document.getElementsByName('agree');
            checkboxes.forEach((checkbox) =>{checkbox.checked = selectAll.checked;} )
        }
    	//하위 체크박스 중 하나라도 체크가 취소되면 전체체크박스의 체크 취소되기
        function checkselectAll()  {
            // 전체 체크박스
            const checkboxes 
                = document.querySelectorAll('input[name="agree"]');
            // 선택된 체크박스
            const checked 
                = document.querySelectorAll('input[name="agree"]:checked');
            // select all 체크박스
            const selectAll 
                = document.querySelector('input[name="allagree"]');
            
            if(checkboxes.length === checked.length)  {
                selectAll.checked = true;
            }else {
                selectAll.checked = false;
            }
        }
    	
    	function chkemail(){
    		var v = document.getElementById('email').value;
    		window.open("chkemail?email="+v,'_blank','width=500,height=300,top=200,left=200');
    	}
    	function chkname(){
    		var v = document.getElementById('name').value;
    		window.open("chkname?name="+v,'_blank','width=500,height=300,top=200,left=200');
    	}
    </script>
    <title>회원가입</title>
</head>
<body>
    <section>		
        <div class="container">
            <div class="header">
                <h1>회원가입</h1>
                <div class="hr1"></div>
            </div>
            <form:form modelAttribute="member" action="./signup" method="post">
                <div class="input_box">
                    <p>
                        이메일
                        <form:input type="email" path="email" id="email" class="email"   required="required"/>
                        <input type="button" onclick="chkemail()" class="email_check" value="중복확인">
                    </p>
                    <br>
                    <p>
                        비밀번호
                        <form:input type="password" path="pw" class="pw" required="required" placeholder="ex)비밀번호양식"/>
                    </p>
                    <br>
                    <p>
                        비밀번호확인
                        <input type="password" class="pw2" required="required">
                    </p>
                    <br>
                    <p>
                        닉네임
                        <form:input type="text" path="name" id="name" class="name"  required="required"/>                    
                        <input type="button" onclick="chkname()" class="name_check" value="중복확인">
                    </p>
                    <br>
                    <p>
                        전화번호
                        <form:input type="text" id="num1" path="phone1" class="num1" value="010" size="1" readonly="readonly"/>
                        <span>-</span>
                        <form:input type="text" id="num2" path="phone2" class="num2" maxlength="4" pattern="[0-9]{4}" size="4" title="'1234와 같은 4자리 숫자'" required="required"/>                        
                        <span>-</span>
                        <form:input type="text" id="num3" path="phone3" class="num3" pattern="[0-9]{4}" size="4" title="'1234와 같은 4자리 숫자'" maxlength="4" required="required"/>
                    </p>
                    <br>
                    <p>
                        주소
                        <form:input type="text" id="postcode" path="post" class="addr1" readonly="readonly"/>
                        <input type="button" onclick="execDaumPostcode()" class="postbox" name="post" value="우편번호">
                    </p>
                    <p>
                        <form:input type="text" id="address" path="addr1" class="addr2" size ="30" readonly="readonly"/>
                    </p>
                    <p>
                        <form:input type="text" id="detailadress" path="addr2" class="addr3" size ="30"  placeholder="상세주소"/>
                    </p>
                </div>
                <div class="sub_header">
                    <h3>약관동의</h3>
                    <div class="hr2"></div>
                </div>
                <div class="agreebox">
                    <div class="allagree_box">
                        <label for="allagree" class="s_pointer">회원가입 약관에 모두 동의합니다</label>  
                        <input type="checkbox" id="allagree" name="allagree" class="allagree_input s_pointer" onclick="selectAll(this)">              
                    </div>
                    <div class="hr3"></div>
                    <div class="a_agree_box">
                        <label for="a_agree" class="s_pointer"><a href="#">이용약관 동의<span class="a_as">[필수]</span></a></label>
                        <input type="checkbox"  id="a_agree" name="agree" class="a_agree_input s_pointer" onclick="checkselectAll()">                        
                    </div>
                    <textarea name="agreebox" class="agreebox"  cols="58" rows="5" readonly>나중에 이용약관 넣을 것
                    </textarea>
                    <br>
                    <div class="b_agree_box">
                        <label for="b_agree" class="s_pointer"><a href="#">개인정보 수집 및 이용 동의<span class="b_as">[필수]</span></a></label>
                        <input type="checkbox"  id="b_agree" name="agree" class="b_agree_input s_pointer" onclick="checkselectAll()" >
                    </div>
                    <textarea name="agreebox" class="agreebox"  cols="58" rows="5" readonly>나중에 개인정보 수집 및 이용 동의 넣을 것
                    </textarea>
                    <br>
                    <div class="sign_submit">
                    	<a href="<c:url value="/login"/>">돌아가기</a>
                        <input type="submit" value="가입하기">
                    </div>
                </div>
            </form:form>
        </div>
    </section>
    
</body>
</html>