<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지이서 - import 속성</title>
</head>
<body>
	<%
	Date today = new Date(); // 외부 클래스 생성
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String todatStr = dateFormat.format(today);
	out.println("오늘 날짜 : " + todatStr);	// 오늘날짜
	%>
</body>
</html>