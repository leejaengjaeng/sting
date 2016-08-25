<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	
<form action="/login.do" method="post">
	
	<div c:if="${param.error}" class="alert alert-error">    
    	Invalid username and[${param.error}] password.
    </div>
	<div c:if="${param.logout}" class="alert alert-success"> 
        You have been[${param.logout}] logged out.
    </div>
    
    <sec:authorize access="isAnonymous()">
		노인증
	</sec:authorize>
    <sec:authorize access="isAuthenticated()">
		인증 되었음
	</sec:authorize>
    
    <div><label>아이디 : <input type="text" name="id"></label></div>
	<div><label>비밀번호 : <input type="password" name="password"></label></div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<div><input type="submit" value="로그인"></div>
	<a href="/logoutProcess.do">로그아웃</a>
</form>
	