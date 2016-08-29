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

<link rel="stylesheet" href="resources/css/common.css">
	
<title>Sting</title>
</head>
<body>
	<div class="container-fluid">
		<!-- 로그인 하지 않은유저 -->
		<sec:authorize access="isAnonymous()">
			<c:import url="../headerAndFooter/header.jsp">
				<c:param name="auth" value="anonymous"></c:param>	
			</c:import>
		
			<c:import url="../bodys/indexPageBody.jsp">
			</c:import>
			
			<c:import url="../headerAndFooter/footer.jsp">
			</c:import>
		</sec:authorize>

		<!-- 로그인한 유저 -->		
		<sec:authorize access="isAuthenticated()">
			
			<c:if test="${empty user }">
				<c:set value="${currentUser }" var="user" scope="session"/>
				<c:set value="${top2Notice }" var="top2Notice" scope="session"/>
			</c:if>
				
			<c:import url="../headerAndFooter/header.jsp">
				<c:param name="auth" value="${currentUser.getRole() }"></c:param>	
			</c:import>
		
			<h1>${user.getId()}</h1>
			<h1>${user}</h1>
			<h1>${currentUser.getId()}</h1>
			
			
			
			<c:import url="../headerAndFooter/footer.jsp">
			</c:import>
		</sec:authorize>
		
	</div>
</body>
</html>