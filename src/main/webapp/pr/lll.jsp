<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/navbars/">
<link rel="stylesheet"
	href="./bootstrap-5.1.3-examples/assets/dist/css/bootstrap.min.css">

<title>웹게시판이다</title>
</head>
<body>
	<!--  여기서부터 50번정도 nav까지 상단탭 -->
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark"
		aria-label="Third navbar example">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">왜 경로가 자꾸틀려</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarsExample03"
				aria-controls="navbarsExample03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarsExample03">
				<ul class="navbar-nav me-auto mb-2 mb-sm-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">홈버튼</a></li>
					<li class="nav-item"><a class="nav-link" href="#">메뉴1</a></li>
					<li class="nav-item"><a class="nav-link" href="#">메뉴2</a></li>
					<li class="nav-item"><a class="nav-link" href="#">메뉴3</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown03"
						data-bs-toggle="dropdown" aria-expanded="false">접속</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown03">
							<li><a class="dropdown-item" href="#">로그인</a></li>
							<li><a class="dropdown-item" href="#">회원가입</a></li>
						</ul></li>
				</ul>
				<form>
					<input class="form-control" type="text" placeholder="Search"
						aria-label="Search">
				</form>
			</div>
		</div>
	</nav>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="./bootstrap-5.1.3-examples/assets/dist/js/bootstrap.bundle.min.js"></script>

</body>