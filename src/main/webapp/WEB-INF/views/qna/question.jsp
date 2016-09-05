<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<link rel="stylesheet"
	href="/webjars/bootstrap/3.3.7/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/3.1.0/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/signup.css">
<link rel="stylesheet" href="resources/css/less.css">
<title>Insert title here</title>
</head>
<body>
	<div id="qabox">
		<h3>문의사항</h3>		
		<form method="POST" action="/savequestion">
		<div id="qa_inp">
			<input type="text" name="title" id="title" placeholder="Title" style="padding-left: 10px;">
			<textarea name="content" id="content" style="resize:none; wrap:hard; padding: 10px;"></textarea>
			<span>문의사항은 회원가입 시 입력하신 메일로 답변이 전달됩니다.</span>
			<div id="btn_box">
				<button>전송</button>
				</form>
				<button onclick="location.href='/'">취소</button>
			</div>
		</div>
	</div>
</body>
</html>