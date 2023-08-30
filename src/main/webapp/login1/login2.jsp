<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="http://code.jquery.com/jquery.js"></script>
    
 <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script src="https://unpkg.com/jwt-decode/build/jwt-decode.js"></script>
    <script>
	function onSignIn() {
	    google.accounts.id.initialize({
	        client_id: "189499831249-07d2cl6aps62gt0istvml22gl22ntsj2.apps.googleusercontent.com",
	        callback: handleCredentialResponse
	    });
	    google.accounts.id.prompt();
	}

	function handleCredentialResponse(response) {
	    var profile = jwt_decode(response.credential);
		console.log("ID: " + profile.sub);
		console.log('Name: ' + profile.name);
	    console.log("Image URL: " + profile.picture);
	    console.log("Email: " + profile.email);    
		
		$('#login').css('display', 'none');
    	$('#logout').css('display', 'block');
    	$('#upic').attr('src', profile.picture);
    	$('#uname').html('[ ' +profile.name + ' ]');
	}
	function signOut() {
	    google.accounts.id.disableAutoSelect();
	    
        $('#login').css('display', 'block');
        $('#logout').css('display', 'none');
        $('#upic').attr('src', '');
        $('#uname').html('');
	}
	</script>
</head>
<body>
	<a href="../mvcboard/list.do">게시판 목록 바로가기</a>
	<h2>파일첨부형게시판</h2>
<div id="buttonDiv">
    <input type="button" onclick="onSignIn();" value="로그인"  src="/btn_google_signin_dark_focus_web@2x.png/"/><br>
</div>

<div id="logout" style="display: none;">
    <input type="button" onclick="signOut();" value="로그아웃" /><br>

    <img id="upic" src=""><br>
    <span id="uname"></span>
    
</div>
</body>
</html>


