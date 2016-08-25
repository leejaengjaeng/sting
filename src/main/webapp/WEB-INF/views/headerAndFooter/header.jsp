<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" href="resources/css/header.css">

<div id="header">

	<c:choose>
		<c:when test="${param.auth == '' }">
			<c:import url="/WEB-INF/views/headerAndFooter/mainPageHeader.jsp"/>
		</c:when>
		<c:when test="${param.auth == 'ROLE_ADMIN' }">
			i am admin
		</c:when>
		<c:when test="${param.auth == 'ROLE_STAR' }">
			i am star
		</c:when>
		<c:when test="${param.auth == 'ROLE_SNSSTAR' }">
			i am snsStar
		</c:when>
		<c:when test="${param.auth == 'ROLE_COMPANY' }">
			i am company
		</c:when>
		<c:when test="${param.auth == 'ROLE_MANAGEMENT' }">
			i am management
		</c:when>
		<c:otherwise>
			<!-- indexPage -->
			<c:import url="/WEB-INF/views/headerAndFooter/mainPageHeader.jsp"/>
		</c:otherwise>			
	</c:choose>	
		
</div>