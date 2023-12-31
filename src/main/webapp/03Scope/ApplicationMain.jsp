<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>application 영역의 공유</h2>
	<%
	/* 
		application영역 : 웹애플리케이션은 단 하나의 application객체를
			생성하고 클라가 요청하는 모든 페이지가 application객체를 공유
			하게 된다. 해당영역에 저장된 속성은 웹서버가 shutdown 될때까지
			유지된다. 즉, 웹브라우저를 닫았다가 새롭게 접속하더라도 저장된
			정보는 유지된다.
	*/
	// Map 컬렉션에 2개의 Person객체를 저장한다.
	Map<String, Person> maps = new HashMap<>();
	maps.put("actor1", new Person("이수일", 30));
	maps.put("actor2", new Person("심순애", 28));
	application.setAttribute("maps", maps);
	%>
	application 영역에 속성이 저장되었습니다.
</body>
</html>