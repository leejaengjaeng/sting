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
		<c:import url="../headerAndFooter/header.jsp">
			<c:param name="auth" value="${currentUser.getRole()}"></c:param>	
		</c:import>
	
		<c:choose>
			<c:when test="${currentUser.getRole() == 'ROLE_ADMIN' }">
				i am admin
			</c:when>
			<c:when test="${currentUser.getRole() == 'ROLE_STAR' }">
				i am star
			</c:when>
			<c:when test="${currentUser.getRole() == 'ROLE_SNSSTAR' }">
				i am snsStar
			</c:when>
			<c:when test="${currentUser.getRole() == 'ROLE_COMPANY' }">
				i am company
			</c:when>
			<c:when test="${currentUser.getRole() == 'ROLE_MANAGEMENT' }">
				i am management
			</c:when>
			<c:otherwise>
				i am ... what?
			</c:otherwise>			
		</c:choose>	
			
		
		<c:import url="../headerAndFooter/footer.jsp">
		</c:import>
	</div>
</body>
</html>