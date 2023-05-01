<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 수정</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/qnawrite.css"/>">
    <script src="https://kit.fontawesome.com/014e61e9c4.js" crossorigin="anonymous"></script>
    <script>
        let filecnt = 5;
        function addfile(a){
            let fileList = document.getElementById('fileList'); //이름이 나올 div
            // fileList.innerHTML = ''; //공백처리
            let fileName = a; //배열의 인덱스마다 파일이름 나오게 하기
            let fileNode = document.createElement('div'); //파일이름을 넣을 div 생성
            fileNode.innerHTML = '<input name="filenames" class="filenames" value="' + fileName + '" readonly="true"><button type="button" class="delete-btn" onclick="deleteFile(this)">삭제</button>';
            
            fileList.appendChild(fileNode);
        }
        //기존의 배열에 새로 입력받은 파일의 이름만 추출해서 배열에 추가하기
        function printfile(){ //파일업로드시 이름 나오게 하기
        	
		    let input = document.getElementById('file'); //파일 받기
		    let files = input.files; //배열처리               
		    
		    if (files.length > filecnt) {
		        alert('최대 '+filecnt+'개까지 선택 가능합니다.');
		        document.getElementById('file').value = '';
		    }                
		    if(files.length === 0){ //파일이 없을 때 뜨게하기
		        let fileName = '첨부파일 (최대5개까지 가능합니다)';
		        document.getElementById('result').value = fileName;
		    }
		    else if(files.length === 1){ //파일이 1개일 때 해당 파일명을 result에 넣기
		        let fileName = files[0].name;
		        addfile(fileName);
		    }
		    else{ //다중 파일 일 때 파일즈의 길이 갯수만큼 첨부되었다고 알려주기
		        let fileName = files.length + '개의 파일이 첨부되었습니다.';
		        for(let i=0; i<files.length;i++){
		            let fname = files[i].name;
		            addfile(fname);
		        }
		    }
		}
            
        function deleteFile(btn){ //첨부파일 삭제하기
            let btnparent = btn.parentNode; //버튼의 부모 div 
            let fileNode = btnparent.firstChild; //div의 첫번째 자식 == input 
            let fileList = btnparent.parentNode; //fileNode의 부모노드를 fileList에 담음
            fileList.removeChild(btnparent); //fileList에서 fileNode를 삭제 == div 안의 해당div 삭제
            let files = Array.from(document.getElementById('file').files); //input="file" 에 저장된 해당 파일 삭제하기 위한 배열을 files에 담음
            for(let i = 0; i < files.length; i++){
                if(files[i].name === fileNode.value){ //fileNode의 첫번째 자식의 텍스트 = <span>fileName</span> 의 fileName 을 가져옴
                    files.splice(i, 1); //해당 파일 삭제
                    let newFileList = new DataTransfer(); //데이터 전송을 위한 API객체 삭제한 파일을 제외한 나머지 파일들을 다시 input="file" 에 담는 역할을 함
                    for (let j = 0; j < files.length; j++) {
                        newFileList.items.add(files[j]);
                    }
                    document.getElementById('file').files = newFileList.files;
                    printfile();
                    return;
                }
            }
            filecnt++;
        }
    </script>
</head>
<body>
	<jsp:include page="./header.jsp"/>
    <div class="lounge">
        <div class="midlounge">
            <div class="writebox">
                <div id="bodertitlebox">
                    <div class="title" >
                        <h2 class="tltelcss">게시글 수정</h2>
                    </div>
                    <hr class="hrline">
                    <div id="write_area">
                        <form:form modelAttribute="updateboard" enctype="multipart/form-data" action="./${updateboard.num }" method="post" onsubmit="return chkForm()">
                        	<input type="hidden" name="name" value="${name }"/>
                        	<input type="hidden" name="hit" value="${updateboard.hit }"/>
                        	<input type="hidden" name="tagsrc" value="${updateboard.tagsrc }"/>
                        	<input type="hidden" name="tagvalue" value="${updateboard.tagvalue }"/>
                        	<div class="selectbox">
                        		<form:select path="board_type" class="board_type" id="board_type" onchange="chkboardtype()">
                        			<option id="opdefult" value="none">게시판을 선택해주세요</option>
                        			<form:option value="commu">자랑해요</form:option>
                        			<form:option value="qna">Q&A</form:option>
                        			<c:if test="${level == 2 }">
                        				<form:option value="notice">공지사항</form:option>
                        			</c:if>
                        			<form:option value="event">이벤트</form:option>
                        			<form:option value="hosreview">후기에요</form:option>
                        		</form:select>
                        		<form:select path="animal_type" id="conoption">
                                    <option id="opdefult" value="none">반려동물을 선택해주세요</option>                             
                                    <form:option value="cat">[고양이]</form:option>
                                    <form:option value="dog">[강아지]</form:option>
                                </form:select>                                
                        	</div>
                            <div id="in_title">
                                <p class="titletxt">제목</p>                                
                                <form:textarea path="title" id="utitle" rows="1" cols="55" maxlength="100" required="required"></form:textarea>
                            </div>
                            <hr class="hrline">
                            <div id="in_content">
                                <p class = "contenttxt">내용</p>
                                <form:textarea path="content" id="ucontent" required="required"></form:textarea>
                            </div>
                            <hr class="hrline">
                            <div class="filebox">
                                <label for="file">파일찾기</label> 
                                <input class="upload-name" id="result"  placeholder="첨부파일 (최대5개까지 가능합니다)" readonly>
                               	<form:input path="fileimages" type="file" id="file" multiple="multiple" onchange="printfile()"/>
                            </div>
                            <div id="fileList">
                                <c:if test="${updateboard.filenames != null }">
                                <c:forEach items="${updateboard.filenames }" var="f">
                                    <script>
                                        addfile('${f}');          
                                        filecnt--;
                                    </script>                                    
                                </c:forEach>
                            </c:if>
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
    
</body>
</html>