<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
// 팝업창 오픈 여부 판단을 위한 변수
String popupMode = "on";

// 쿠키를 배열로 얻어온 후 모든 쿠키를 읽는다
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie c : cookies) {
		String cookieName = c.getName();
		String cookieValue = c.getValue();
		// 만약 쿠키명이 아래와 일치하면 쿠키값을 읽어
		if (cookieName.equals("PopupClose")) {
	popupMode = cookieValue;
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 관리</title>
<style>
div#popup {
	position: absolute;
	top: 100px;
	left: 100px;
	color: yellow;
	width: 300px;
	height: 100px;
	background-color: gray;
}

div#popup>div {
	position: relative;
	background-color: #ffffff;
	top: 0px;
	border: 1px solid gray;
	padding: 10px;
	color: black;
}
</style>
<script src="https://code.jquery.com/jquery.js"></script>
<script>
	// jQuery의 엔트리(시작점)
	$(function() {
		// 팝업창 닫기 버튼을 누르면 아래코드를 실행한다.
		$('#closeBtn').click(function() {
			// 레이어 팝업창을 숨김처리 한다.
			$('#popup').hide();
			// 하룻동안 열지않음 체크박스에 체크한 경우에는 value를 얻어와서
			// 변수에 저장한다.
			var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
			// jQuery의 ajax()함수를 통해 요청값을 전송한다.
			$.ajax({
				// 요청할 서버의 URL(경로)
				url : './PopupCookie.jsp',
				// 전송방식
				type : 'get',
				// 요청시 전송할 파라미터. 여기선 체크박스의 값을 설정
				// 즉 체크를 했다면, 1을 전송하고, 아니면 아무값도 전송X
				data : {
					inactiveToday : chkVal
				},
				// 콜백데이터의 타입은 text형식으로 지정한다
				dataType : "text",
				// 성공시 자동호출될 콜백함수
				success : function(resData) {
					// 콜백데이터는 매개변수 redDate가 받는다
					if (resData)
						console.log("잇다");
					else
						console.log("업따");

					//콜백데이터가 있다면 화면을 새로고침 F5를 누른것과 동일
					if (resData != '')
						location.reload();
				}
			});
		});
	});
</script>
</head>
<body>
	<h2>팝업 메인 페이지</h2>
	<%
	for (int i = 1; i <= 10; i++)
	{
		out.println("현재 팝업창은 " + popupMode + " 상태입니다.<br/>");
	}
	if (popupMode.equals("on"))
	{
	%>
	<div id="popup">
		<h2 align="center">공지사항 팝업입니다.</h2>
		<div align="right">
			<form name="popFrm">
				<input type="checkbox" id="inactiveToday" value="1" /> 하루 동안 열지 않음
				<input type="button" value="닫기" id="closeBtn" />
			</form>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>
