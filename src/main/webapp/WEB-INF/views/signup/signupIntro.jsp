<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="/webjars/bootstrap/3.3.7/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/3.1.0/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/signup.css">
<link rel="stylesheet" href="/resources/css/less.css">
<script>
function gosignup(kind){
	
	if(kind=="company"){
		location.href="/signup/companySignup";
	}
	else if(kind=="star"){
		location.href="/signup/starSignup";
	}
	else if(kind=="management"){
		location.href="/signup/managementSignup";
	}
	else if(kind=="snsstar"){
		location.href="/signup/snsstarSignup";
	}
}
</script>
<title>Insert title here</title>
</head>
<body>
<div style="width:100%;height:100%; background: #383838;">
	<div>
		<c:import url="../headerAndFooter/checkAgreementHeader.jsp">
			<c:param name="kindOfpage" value="agreement"></c:param>
		</c:import>
	</div>
	<div style="margin-left:20%;margin-right:20%; ">
		<center style="margin-top:20px;">
			<div>
				<img src="/resources/imgs/signup.png" class="img-responsive">
			</div>
		</center>	
		<div style="width:1000px; margin-top: 50px; margin-bottom:50px;">
			<div class="signgroup">
				<div class="wrap_black">
					<img src="/resources/imgs/signimg/img3.jpg">
					<div class="txt_back"></div>
					<div class="txtbox">	
						<h3>기업 회원</h3>
						<h4>기업 회원이신분들은 선택해 주세요</h4>
					</div>
					<div class="goto">
						<img src="/resources/imgs/signimg/icon.png"  onclick="gosignup('company');">
					</div>
				</div>
			</div>
			<div class="signgroup">
				<div class="wrap_black">
					<img src="/resources/imgs/signimg/img2.jpg" >
					<div class="txt_back"></div>
					<div class="txtbox">	
						<h3>스타 회원</h3>
						<h4>스타 회원이신분들은 선택해 주세요</h4>
					</div>
					<div class="goto">
						<img src="/resources/imgs/signimg/icon.png"  onclick="gosignup('star');">
					</div>							
				</div>
			</div>
			<div class="signgroup">
				<div class="wrap_black">
					<img src="/resources/imgs/signimg/img1.jpg">
					<div class="txt_back"></div>
					<div class="txtbox">	
						<h3>매니지먼트 회원</h3>
						<h4>매니지먼트 회원신분들은 선택해 주세요</h4>
					</div>
					<div class="goto">
						<img src="/resources/imgs/signimg/icon.png" onclick="gosignup('management');">
					</div>
				</div>
			</div>
			<div class="signgroup">
				<div class="wrap_black">
					<img src="/resources/imgs/signimg/img4.jpg">
					<div class="txt_back"></div>
					<div class="txtbox">	
						<h3>SNS스타 회원</h3>
						<h4>SNS스타 회원이신분들은 선택해 주세요</h4>
					</div>
					<div class="goto">
						<img src="/resources/imgs/signimg/icon.png" onclick="gosignup('snsstar');">
					</div>
				</div>
			</div>
		</div>
	</div>		
</div>
<div style="float: left; width: 100%; margin-top:50px;">
	<c:import url="../headerAndFooter/footer.jsp"></c:import>
</div>
</body>
</html>