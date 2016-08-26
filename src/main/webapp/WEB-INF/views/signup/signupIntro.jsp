<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="/webjars/bootstrap/3.3.7/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/3.1.0/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/signup.css">
<title>Insert title here</title>
</head>
<body>
<div style="width:100%;height:100%">
	<div>
		<c:import url="../headerAndFooter/checkAgreementHeader.jsp">
			<c:param name="kindOfpage" value="agreement"></c:param>
		</c:import>
	</div>
	<div style="margin-left:20%;margin-right:20%">
		<center>
			<div>
				<img src="/resources/imgs/signup.png" class="img-responsive">
			</div>
		</center>
	<div style="float:left;width:30%;height:30%;border:2px solid white;background-color:white">
	<p>기업회원</p>
	</div>
	<div style="float:right;width:30%;height:30%;border:2px solid white;background-color:white">
	<p>스타회원</p>
	</div>
	<div style="margin-top:30px;clear:both;float:left;width:30%;height:30%;border:2px solid white;background-color:white">
	<p>매니지먼트회원</p>
	</div>
	<div style="margin-top:30px;float:right;width:30%;height:30%;border:2px solid white;background-color:white">
	<p>SNS스타회원</p>
	</div>	
	</div>
	
	
</div>
</body>
</html>