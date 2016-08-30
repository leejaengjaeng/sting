<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta name="viewport" content="width=device-width">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/webjars/bootstrap/3.3.7/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/3.1.0/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7/dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/body.css">
	
<title>Sting</title>
</head>
<body>
	<div>
		<c:import url="/WEB-INF/views/headerAndFooter/header.jsp"/>

		<!-- 로그인 하지 않은유저 -->
		<sec:authorize access="isAnonymous()">
			<meta http-equiv="refresh" content="0; url=/"></meta>
		</sec:authorize>
	
	
		<div id="notices">
			${noticeDetail.getNid() }<br>
			${noticeDetail.getTitle() }<br>
			${noticeDetail.getContent() }<br>
			${noticeDetail.getDate() }<br>
			${noticeDetail.getHit() }<br>
		</div>
		
		



		<c:import url="/WEB-INF/views/headerAndFooter/footer.jsp"></c:import>
	</div>
</body>
</html>