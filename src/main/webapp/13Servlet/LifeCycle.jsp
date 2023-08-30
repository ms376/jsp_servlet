<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	/*
		JS에서 전송방식을 추가한 후
	*/
		function requestAction(frm,met) {
			if(met==1){
				frm.method = 'get';
			}else{
				frm.method='post';
			}
			frm.submit();
		}
	</script>
	<h2>서블릿 수명주기(Life Cycle)메서드</h2>
	<!-- 
		JSscripter를 통해 form값을 전송하므로 input태그는 버튼타입으로
	 -->
	<form action="./LifeCycle.do">
		<input type="button" value="Get방식 요청하기"
		onclick="requestAction(this.form, 1);"/>
		<input type="button" value="Post방식 요청하기"
		onclick="requestAction(this.form, 2);"/>
	</form>
</body>
</html>