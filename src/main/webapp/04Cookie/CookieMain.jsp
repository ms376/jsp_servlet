<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키(cookie) 설정</title>
</head>
<body>
	<h2>1. 쿠키 설정</h2>
	<%
	Cookie cookie = new Cookie("myCookie", "쿠키맛잇엉"); // 쿠키생성
	/* 
		쿠키의 경로 설정. 컨텍스트루트 경로로 지정하므로 웹에플리케이션
		전체에서 사용할 수 있게 된다.
	*/
	cookie.setPath(request.getContentType()); // 경로를 컨텍스트 루트로 설정
	cookie.setMaxAge(3600); // 유지시간을 1시간으로 설정
	// 응답헤더에 쿠키를 추가하여 클라쪽으로 전송
	response.addCookie(cookie); // 응답헤더에 쿠키 추가
	/* 
		여기까지의 코드를 통해 클라측에 쿠키를 생성
	*/
	%>
	<h2>2. 쿠키 설정 직수 쿠키값 확인</h2>
	<%
	/* 
		request 내장객체의 getCookie()를 통해 현재 생성된
	*/
	Cookie[] cookies = request.getCookies(); // 초청 헤더의 모든 쿠키 얻기
	// 개선된 for문을 통해 쿠키를 읽어서..
	if (cookie != null)
	{
		// 쿠키명과 쿠키값을 웹브라우저에 출력
		for (Cookie c : cookies)
		{
			String cookieName = c.getName(); //이름얻기
			String cookieValue = c.getValue(); //값 얻기
			// 화면출력
			out.println(String.format("%s : %s<br/>", cookieName, cookieValue));
		}
	}
	/* 
		쿠기가 생성된 직후에는 쿠키값을 읽을 수 없다. 클라측에
		있는 쿠키를 서버로 다시 젅송하기 위해 페이지 이동을 하거나 새로고침을
		하여 새로운 요청을 보내야만 읽을 수 있다.
	*/
	%>
	<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
	<a href="CookieResult.jsp"> 다음 페이지에서 쿠키값 확인하기 </a>
</body>
</html>