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
<title>Get Agreement</title>
<script>
	function checkAllAgreement() {
		document.getElementById("agreebtn1").checked = true;
		document.getElementById("agreebtn2").checked = true;
	}

	function submitagreement() {
		if (document.getElementById("agreebtn1").checked == true
				&& document.getElementById("agreebtn2").checked == true)
			alert("다음페이지");
		else
			alert("모든 약관에 동의 하셔야 진행할 수 있습니다.");
	}
</script>
</head>
<body>

	<div style="width: 100%">
		<c:import url="../headerAndFooter/header.jsp">
			<c:param name="kindOfpage" value="agreement"></c:param>
		</c:import>
	</div>


	<div id="agreeheader">
		<center>
			<div
				style="padding: 10px; border: 1px solid white; border-radius: 5px; width: 60%; background-color: white;">
				<p>
					STING의 서비스 이용약관,<br />개인정보취급약관에 모두 동의합니다.
				</p>
				<button class="mainPageBtn" onclick="checkAllAgreement();">동의</button>
			</div>

			<div>
				<b class="agreetext" style="width: 60%">STING 서비스 이용약관 동의</b><br />
				<textarea rows="5" cols="30" name="contents" class="form-control"
					style="resize: none; width: 60%" readonly>temp contents &#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content</textarea>
				<b class="agreetext">STING 서비스 이용약관을 확인하였으면 이에 동의합니다.</b><input
					type="checkbox" id="agreebtn1">
			</div>
			<br/>
			<br/>
			<br/>
			<div>
				<p class="agreetext">STING 개인정보 취급 약관 동의</p>
				<textarea rows="5" cols="30" name="contents" class="form-control"
					style="resize: none; width: 60%" readonly>temp contents &#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content&#13;&#10; temp content</textarea>
				<b class="agreetext">STING 개인정보 취급 약관을 확인하였으면 이에 동의합니다.</b><input
					type="checkbox" id="agreebtn2">
			</div>
			<br/>
			
			<div
				style="padding: 10px;  width: 60%;">
				
				<button class="mainPageBtn" onclick="submitagreement()">확인</button>
			</div>
		</center>
	</div>
	
	<div>
		<c:import url="../headerAndFooter/footer.jsp"></c:import>
	</div>
</body>
</html>