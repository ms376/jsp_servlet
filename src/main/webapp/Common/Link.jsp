<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	BoardDAO dao = new BoardDAO(application);
	BoardDTO dto = new BoardDTO();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<title>웹게시판이다</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark"
		aria-label="Third navbar example">
		<div class="container-fluid">
			<a class="navbar-brand"></a>
			<%
			if (session.getAttribute("UserId") == null)
			{
			%>
			<a href="#">회원가입</a>&nbsp;&nbsp;&nbsp;
			<a href="../06Session/LoginForm.jsp">로그인</a>
			<%
			} else
			{
			%>
			<a><%= dto.getName() %></a>
			<a href="../06Session/Logout.jsp">로그아웃</a>
			<%
			}
			%>
			 &nbsp;&nbsp;&nbsp;
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarsExample03"
				aria-controls="navbarsExample03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarsExample03">
				<ul class="navbar-nav me-auto mb-2 mb-sm-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">버튼</a></li>
					<li class="nav-item"><a class="nav-link" href="#">코구멍</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../08Board/List.jsp">게시판(페이징X)</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../09PagingBoard/List.jsp">게시판(페이징O)</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown03"
						data-bs-toggle="dropdown" aria-expanded="false">접속</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown03">
							<li><a class="dropdown-item" href="#">응애1</a></li>
							<li><a class="dropdown-item" href="#">응애2</a></li>
						</ul></li>
				</ul>
				<form>
					<input class="form-control" type="text" placeholder="검색할거야"
						aria-label="Search">
				</form>
			</div>
		</div>
	</nav>
	
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="../pr/bootstrap-5.1.3-examples/assets/dist/js/bootstrap.bundle.min.js"></script>
	
</body>