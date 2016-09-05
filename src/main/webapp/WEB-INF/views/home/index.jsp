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
<link rel="stylesheet/less" type="text/css" href="/resources/css/less.css">
<script src="/webjars/jquery/3.1.0/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/body.css">
<link rel="stylesheet" href="/resources/css/less.css">
	
<title>Sting</title>
</head>
<body>
	<div>
		<c:import url="/WEB-INF/views/headerAndFooter/header.jsp"/>


<!-- body -->
		<sec:authorize access="hasRole('ADMIN')">
			<meta http-equiv="refresh" content="0; url=/adminLogin"></meta>
		</sec:authorize>
		<!-- 로그인 하지 않은유저 -->
		<sec:authorize access="isAnonymous()">
			<c:choose>
				<c:when test="${path == 'login' }">
					<img class="img-responsive" src="resources/imgs/imgText/txt_05.png" style="margin-top: 25px;" >
					<!-- 로그인 페이지 맞춤 css 넣기 -->
					<c:import url="/WEB-INF/views/forms/loginForm.jsp"/>
				</c:when>
				<c:otherwise>
					<c:import url="/WEB-INF/views/bodys/indexPageBody.jsp"></c:import>
				</c:otherwise> 	
			</c:choose>
		</sec:authorize>
		<!-- 로그인한 유저 -->		
		<sec:authorize access="isAuthenticated()">
			사용자별 메인 페이지 넣기 
		</sec:authorize>
<!-- end body -->

		<c:import url="/WEB-INF/views/headerAndFooter/footer.jsp"></c:import>
	</div>
</body>
</html>