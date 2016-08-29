<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div id="mainPageHeader" class="row">
	
	<div class="col-xs-6">
		<img class="img-responsive" src="/resources/imgs/logo.png">
	</div>
	<div class="col-xs-6">
		<div class="row">
			공지 리스트로 가기
		</div>
		<div class="row">
			<c:forEach var ="notice" items="${top2Notice }">
				 ${notice.getTitle() } |
			</c:forEach>
		</div>
		<div class="row">
			${user.getId() }님 | 회원정보 수정 | 장바구니 | 로그아웃
		</div>
	</div>
</div>	