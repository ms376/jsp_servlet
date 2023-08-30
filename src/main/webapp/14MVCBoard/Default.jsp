<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://unpkg.com/jwt-decode/build/jwt-decode.js"></script>
	<!-- 부트스트랩 사용 버전 5.3.1 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<title>게시판메인</title>
<style>
img {
  width: 300px;
  height: 150px;
  object-fit: cover;
}
</style>
</head>
<body>
	<nav class="navbar bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand">
    <img src="di.png" class="display-2">ddd</a>
<!--     <h1 class="display-2">Display</h1></a> -->
    <form class="d-flex" role="search">
      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
  </div>
</nav>
<p><a href="../mvcboard/list.do" class="text-bg-primary w-20 p-3">공지사항 게시판</a>
<a href="../mvcboard/list.do" class="text-bg-primary p-3">자유 게시판</a>
<a href="../mvcboard/list.do" class="text-bg-primary p-3">자료실 게시판</a>
</p>

	<!-- 공지사항 -->
	<!-- 로그인 -->
	<!-- 찾아오기(지도) -->
	<!-- best자유게시판(추천top10) -->
	<!-- 댓글(추천top10) -->
</body>
</html>