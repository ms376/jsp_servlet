<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 페이지가 실행되면 loginId라는 쿠키를 읽어온다.
String loginId = CookieManager.readCookie(request, "loginId");

// 아이디 저장 체크박스에 체크를 하기위한 변수 생성
String cookieCheck = "";
// 앞에서 읽은 쿠키값이 있다면 체크박스에 checked 속성을 부여하기 위해
// 값을 설정한다.
if (!loginId.equals(""))
{
	cookieCheck = "checked";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<!-- 
		폼에서 포커스 이동을 위해 탭을 누르는경우 작성된 태그순으로
		포커스가 이동하게된다. 이를 변경할 떄 tabindex 속성을 사용한다.
	 -->
	<form action="IdSaveProcess.jsp" method="post">
	<!-- 
		쿠키를 통해 읽어온 값이 있는경우 text상자에는 
	 -->
		아이디 : <input type="text" name="user_id" value="<%=loginId%>" /> <input
			type="checkbox" name="save_check" value="Y" <%=cookieCheck%> />
		아이디 저장하기 <br /> 패스워드 : <input type="text" name="user_pw" /> <br /> <input
			type="submit" value="로그인하기" />
	</form>
</body>
</html>