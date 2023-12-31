<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
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
	// Object로 저장된 속성값은 Map타입으로 형변환한다.
	Map<String, Person> maps = (Map<String, Person>) application.getAttribute("maps");
	Set<String> keys = maps.keySet();
	/* 
		Map컬렉션은 key를 통해 value를 저장하므로 반복전에 key를 먼저
		얻어와야 한다. krySet()을 통해 얻어온 key의 목록을 통해 반복하고
		get()을 통해 value를 얻어와 출력한다.
	*/
	for (String key : keys)
	{
		Person person = maps.get(key);
		out.print(String.format("이름 : %s,나이 : %d<br/>", person.getName(), person.getAge()));
	}
	%>
</body>
</html>