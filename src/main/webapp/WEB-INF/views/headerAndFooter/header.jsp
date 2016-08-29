<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<link rel="stylesheet" href="resources/css/header.css">

<div id="header" class="row">

	<sec:authorize access="isAnonymous()">
		<img class="img-responsive" src="/resources/imgs/logo.png">
		<img class="img-responsive" src="/resources/imgs/imgText/txt_01.png">
		<p class="contentText">
			STING은 자금력과 홍보마케팅이 약한 중소기업 제품 및 서비스의 마케팅과 홍보를 위한 연예인 마케팅 시스템으로<br>
			연예인과 함께 디지털 마케팅을 수행함을 목적으로 기업에게는 확실한 홍보와 마케팅효과를 누리게 하고<br>
			연예인에게는 그에 대한 리워드를 주는 매칭플랫폼 시스템입니다.
		</p>
		
		<c:if test="${not path == 'login'}">
			<div id="mainPageBtnWrap" class="row">
				<div class="col-xs-6">
					<div style="float:right" class="mainPageBtn" onclick="location.href='/login'">
							Login
					</div>
				</div>
				<div class="col-xs-6">
					<div class="mainPageBtn" onclick="")>
							Sign Up
					</div>
				</div>
			</div>
		</c:if>
	</sec:authorize>	
	
	<sec:authorize access="isAuthenticated()">
		<div class="col-xs-6">
		<img class="img-responsive" src="/resources/imgs/logo.png">
		</div>
		<div class="col-xs-6">
			<div class="row">
				공지 리스트로 가기
			</div>
			<div class="row">
				<c:forEach var ="notice" items="${sessionScope.top2Notice }">
					 ${notice.getDate() } | ${notice.getTitle() } <br>
				</c:forEach>
			</div>
			<div class="row">
				${sessionScope.currentUser.getId() }님 | 회원정보 수정 | 장바구니 | <a href="/logoutProcess.do">로그아웃</a>
			</div>
		</div>	
	</sec:authorize>
</div>