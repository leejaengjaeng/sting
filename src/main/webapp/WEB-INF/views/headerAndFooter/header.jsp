<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" href="resources/css/header.css">

<div id="header">

	<c:choose>
		<c:when test="${param.auth == 'ROLE_ADMIN' }">
			<c:import url="/WEB-INF/views/headerAndFooter/headerContent/userHeader.jsp"/>
		</c:when>
		<c:when test="${param.auth == 'ROLE_STAR' }">
			<h1>1 ==== ${user.getRole() }</h1>
			<h1>1 ==== ${user }</h1>
			
			<c:import url="/WEB-INF/views/headerAndFooter/headerContent/userHeader.jsp"/>
		</c:when>
		<c:when test="${param.auth == 'ROLE_SNSSTAR' }">
			<c:import url="/WEB-INF/views/headerAndFooter/headerContent/userHeader.jsp"/>
		</c:when>
		<c:when test="${param.auth == 'ROLE_COMPANY' }">
			<c:import url="/WEB-INF/views/headerAndFooter/headerContent/userHeader.jsp"/>
		</c:when>
		<c:when test="${param.auth == 'ROLE_MANAGEMENT' }">
			<c:import url="/WEB-INF/views/headerAndFooter/headerContent/userHeader.jsp"/>
		</c:when>		
	
		<c:when test="${param.auth == 'anonymous' }">
			<c:import url="/WEB-INF/views/headerAndFooter/headerContent/anonymousHeader.jsp">
				<c:param name="isIndex" value="True"></c:param>
			</c:import>
		</c:when>
		<c:otherwise>
			<h1>2 ==== ${user.getRole() }</h1>
			<h1>2 ==== ${user }</h1>
			<!-- 기타 페이지들 -->
			<c:import url="/WEB-INF/views/headerAndFooter/headerContent/anonymousHeader.jsp">
				<c:param name="isIndex" value="False"></c:param>
			</c:import>
		</c:otherwise>			
	</c:choose>	
	
</div>