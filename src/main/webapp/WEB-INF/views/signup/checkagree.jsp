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
		<br/><br/><br/>
			<div
				style="padding: 10px; border: 1px solid white; border-radius: 5px; width: 60%; background-color: white;">
				<p class="allagreetext">
					<br/>STING의 서비스 이용약관,<br />개인정보취급약관에 모두 동의합니다.
				</p>
				<button class="agreebtn" onclick="checkAllAgreement();">동의</button>
			</div>
		<br/><br/>
			<div>
				<b class="agreeheadertext" style="width: 60%">STING 서비스 이용약관 동의</b><br />
				<textarea rows="5" cols="30" name="contents" class="form-control"
					style="height:300px; resize: none; width: 60%" readonly>temp contents &#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content</textarea>
				<b class="agreeheadertext">STING 서비스 이용약관을 확인하였으면 이에 동의합니다.  </b><input
					type="checkbox" id="agreebtn1" class="agreecheck">
			</div>
			<br/>
			<br/>
			<br/>
			<div>
				<p class="agreeheadertext">STING 개인정보 취급 약관 동의</p>
				<textarea rows="5" cols="30" name="contents" class="form-control"
					style="height:300px; resize: none; width: 60%" readonly>temp contents &#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content</textarea>
				<b class="agreeheadertext">STING 개인정보 취급 약관을 확인하였으면 이에 동의합니다.  </b><input
					type="checkbox" id="agreebtn2" class="agreecheck">
			</div>
			<br/>
			
			<div
				style="padding: 10px;  width: 60%;">
				
				<button class="agreebtn" onclick="submitagreement()">확인</button>
			</div>
		</center>
	</div>
	
	<div>
		<c:import url="../headerAndFooter/footer.jsp"></c:import>
	</div>
</div>
</body>
</html>