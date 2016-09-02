<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<link rel="stylesheet"
	href="/webjars/bootstrap/3.3.7/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/3.1.0/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/signup.css">
<script src="/resources/js/signup.js" type="text/javascript" charset="utf-8"></script>
<title>회원가입</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>
<body>
<div>
		<c:import url="../headerAndFooter/checkAgreementHeader.jsp">
			<c:param name="kindOfpage" value="agreement"></c:param>
		</c:import>
	</div>
	<div style="margin-left: 20%; margin-right: 20%">
	<form action=${url} name="signupform" method="POST" enctype="multipart/form-data" onsubmit="return execute();">
		<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
		<img id="blah" src="#" alr="your image" width="100px" height="100px"/>
		<input type="file" name="mainimg" onchange="readURL(this);" value="메인사진 업로드"/  accept="image/gif, image/jpeg, image/png">
		메인사진
		아이디<input type="text" name="id" id="id"><button type="button" onclick="checkid();">중복검사</button><br/>
		비밀번호<input type="password" name="password" id="password"><br/>
		비밀번호<input type="password" name="password" id="repassword"><br/>
		이메일 <input name="email1" placeholder="이메일" type="text"> 
				<select name="email2" onChange=changeEmail(this.value) required>
				<option value="" selected>이메일선택</option>
				<option value="naver.com">@naver.com</option>
				<option value="hanmail.com">@hanmail.com</option>
				<option value="daum.net">@daum.net</option>
				<option value="nate.com">@nate.com</option>
				<option value="gmail.com">@gmail.com</option>
				<option value="hotmail.com">@hotmail.com</option>
				<option value="dreamwiz.com">@dreamwiz.com</option>
				<option value="korea.com">@korea.com</option>
				<option value="1">직접입력</option>
			</select>
			<input type="text" name="email3" id="email3" style="visibility: hidden">
			회원유형 <select id="typeselect" onChange=changetype(this.value) required><br />
				<option value="" selected>유형선택</option>
				<option value="배우">배우</option>
				<option value="가수">가수</option>
				<option value="아나운서">아나운서</option>
				<option value="리포터">리포터</option>
				<option value="방송인">방송인</option>
			</select> 
			<input type="hidden" name="type" id="type">
			이름<input type="text" id="name" name="name" required><br />
			핸드폰 <input type="text" id="phonenumber" name="phonenumber" required><br />
			관심상품분야<input type="checkbox" name="favoritem" value="패션">패션
			<input type="checkbox" name="favoritem" value="패션">소품
			 <input	type="checkbox" name="favoritem" value="뷰티">뷰티 
			 <input	type="checkbox" name="favoritem" value="생활">생활 
			 <input	type="checkbox" name="favoritem" value="APP">APP 
			 <input	type="checkbox" name="favoritem" value="IDEA">IDEA<br />
			 SNS(선택)<br/>
			 인스타그램url<input type="text" name="SNSurl"><br />
			 페이스북url<input type="text" name="SNSurl"><br />
			 블로그url<input type="text" name="SNSurl"><br />
			 기타url<input type="text" name="SNSurl"><br />
			<input type="submit" value="가입신청">
	</form>
	</div>
</body>
</html>