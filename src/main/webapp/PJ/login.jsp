<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>로그인</title>
    <link href="login.css" rel="stylesheet">
</head>

<body>

    <main class="form-signin">
        <form action="loginProcess.jsp" method="post">
            <img class="mb-4" src="../images/logo.png" alt="" width="450" height="150">
            <h1 class="h3 mb-3 fw-normal"><b>로그인</b></h1>

            <div class="form-floating">
                <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com">
                <label for="floatingInput"><b>ID(아이디@이메일)</b></label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
                <label for="floatingPassword"><b>비밀번호</b></label>
            </div>

            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" value="remember-me" name="remember"> <b>로그인 상태 유지</b>
                </label>
            </div>
            <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
        </form>
    </main>
</body>

</html>