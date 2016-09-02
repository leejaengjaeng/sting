<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta name="viewport" content="width=device-width">
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
<title>Get Agreement</title>
<script>
	function checkAllAgreement() {
		document.getElementById("agreebtn1").checked = true;
		document.getElementById("agreebtn2").checked = true;
	}

	function submitagreement() {
		if (document.getElementById("agreebtn1").checked == true
				&& document.getElementById("agreebtn2").checked == true)
			location.href="/signup/signupintro"
		else
			alert("모든 약관에 동의 하셔야 진행할 수 있습니다.");
	}
</script>
<style>

</style>
</head>
<body>
<div style="width:100%; height:100%">
	<div style="width: 100%">
		<c:import url="../headerAndFooter/checkAgreementHeader.jsp">
			<c:param name="kindOfpage" value="agreement"></c:param>
		</c:import>
	</div>


	<div id="agreeheader">
		<center>
			<div id="agreeallcont">
				<div id="agreetxtbox">
					<span class="allagreetext">
						STING의 서비스 이용약관,<br>
						개인정보취급약관에 모두 동의합니다.							
					</span>				
					<button class="agreebtn" onclick="checkAllAgreement();">전체 동의</button>
				</div>
			</div>		
			<div style="margin-top:30px;">
				<div class="agreetxtbox">
					<b class="agreeheadertext">STING 서비스 이용약관 동의</b>
					<input type="checkbox" id="agreebtn1" class="agreecheck">
				</div>				
				<textarea rows="5" cols="30" name="contents" class="form-control"
					style="height:300px; resize: none; width: 1000px;" readonly>temp contents &#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content</textarea>
			</div>
			<div>
				<div class="agreetxtbox" style="margin-top: 30px;">
					<p class="agreeheadertext">STING 개인정보 취급 약관 동의</p>
					<input type="checkbox" id="agreebtn2" class="agreecheck">
				</div>				
				<textarea rows="5" cols="30" name="contents" class="form-control"
					style="height:300px; resize: none; width: 1000px;" readonly>temp contents &#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content</textarea>		
			</div>			
			<div style="padding: 10px;  width: 1000px; height: 150px;">				
				<button class="agreebtn2" onclick="submitagreement()">확인</button>
			</div>
		</center>
	</div>	
	<div>
		<c:import url="../headerAndFooter/footer.jsp"></c:import>
	</div>
</div>
</body>
</html>