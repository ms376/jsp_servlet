<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- core 라이브러리 적용 --%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<script type="text/javascript" src="../naver-editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	function validateForm(form) {
		if(form.name.value==""){
			alert("작성자를 입력하세요");
			form.name.focus();
			return false;
		}
		if (form.title.value=="") {
			alert("제목을 입력하세요");
			form.title.focus();
			return false;
		}
		if (form.content.value=="") {
			alert("내용을 입력하세요");
			form.content.focus();
			return false;
		}
		if (form.pass.value=="") {
			alert("비밀번호를 입력하세요");
			form.pass.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h2>파일 첨부형 게시판 - 글쓰기(Write)</h2>
	<form action="../mvcboard/write.do" name="wirteFrm" method="post" enctype="multipart/form-data"	
			onsubmit="return validateForm(this)">
	<table border="1" width="90%">
		<tr>
		<td>작성자</td>
		<td>
			<input type="text" name="name" id="" style="width:150px"/>
		</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<input type="text"  name="title" style="width:90px"/>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
<!-- 				<textarea name="content" style="width:90%;height:100px"></textarea> -->
				<textarea name="content" id="ir1" rows="10" cols="100" style="width: 90%; height: 100px;"></textarea>
				<script type="text/javascript">
					var oEditors = [];
					nhn.husky.EZCreator.createInIFrame({
					    oAppRef: oEditors,
					    elPlaceHolder: "ir1",
					    sSkinURI: "../naver-editor/SmartEditor2Skin.html",
					    fCreator: "createSEditor2"
					});
				</script>
			</td>
		</tr>
		<tr>
			<td>첨부 파일</td>
			<td><input type="file" name="ofile" id="" /> </td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="pass" id="" style="width:100px" /> 
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">작성완료</button>			
				<button type="reset">RESET</button>	
				<button type="button" onclick="location.href='../mvcboard/list.do';">목록 바로가기</button>			
			</td>
		</tr>
	</table>		
	</form>
</body>
</html>