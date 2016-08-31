<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<link rel="stylesheet"
	href="/webjars/bootstrap/3.3.7/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/3.1.0/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/signup.css">
<script src="/resources/js/signup.js" type="text/javascript" charset="utf-8"></script>
<title>회원가입</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>
<body>
	<div>
		<c:import url="../headerAndFooter/checkAgreementHeader.jsp">
			<c:param name="kindOfpage" value="agreement"></c:param>
		</c:import>
	</div>
	<div style="margin-left: 20%; margin-right: 20%">
	
		<form action=${url} name="signupform" method="POST" enctype="multipart/form-data" onsubmit="return execute();">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> 아이디<input type="text" name="id" id="id" required>
			<button type="button" onclick="checkid();">중복검사</button>
			<br /> 비밀번호<input type="password" name="password" id="password" required><br />
			비밀번호 확인<input type="password" id="repassword"  onkeyup="checkpwd();" required><div id="checkpassword"> </div><br/>
			이메일 <input
				name="email1" placeholder="이메일" type="text"> <select
				name="email2" onChange=changeEmail(this.value) required>
				<option value="" selected>이메일선택</option>
				<option value="naver.com">@naver.com</option>
				<option value="hanmail.com">@hanmail.com</option>
				<option value="daum.net">@daum.net</option>
				<option value="nate.com">@nate.com</option>
				<option value="gmail.com">@gmail.com</option>
				<option value="hotmail.com">@hotmail.com</option>
				<option value="dreamwiz.com">@dreamwiz.com</option>
				<option value="korea.com">@korea.com</option>
				<option value="1">직접입력</option>
			</select> 
			<input type="text" name="email3" id="email3" style="visibility: hidden"><br /> 주소입력 <input type="button"
				onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <input
				type="text" id="sample4_postcode" placeholder="우편번호" name="addr1"><br />
			<input type="text" id="sample4_roadAddress" placeholder="도로명주소"
				name="addr2"> <input type="text" id="sample4_jibunAddress"
				placeholder="나머지 주소" name="addr3"><br /> 
				회사이름 <input type="text" name="company_name" id="company_name" required><br />
			회사유형 <select id="companyselect" onChange=changeCompany(this.value)><br />
				<option value="" selected>유형선택</option>
				<option value="대행사">대행사</option>
				<option value="유통사">유통사</option>
				<option value="제조사">제조사</option>
			</select> <input type="hidden" name="typeofcompany" id="typeofcompany">
			사업자번호 <input type="text" name="registration_number"
				id="registration_number"><br /> 
				담당자이름 <input type="text" name="manager_name" id="manager_name" required><br /> 
				담당자전화번호<input type="text" name="manager_phonenumber" id="manager_phonenumber" required><br />
			취급상품분야<input type="checkbox" name="interestproduct" value="패션">패션
			<input type="checkbox" name="interestproduct" value="패션">소품
			 <input	type="checkbox" name="interestproduct" value="뷰티">뷰티 
			 <input	type="checkbox" name="interestproduct" value="생활">생활 
			 <input	type="checkbox" name="interestproduct" value="APP">APP 
			 <input	type="checkbox" name="interestproduct" value="IDEA">IDEA<br />
			사업자등록증 스캔본 <input type="file" name="registration_scan"id="registration_scan" required> 
			
			<input type="submit" value="가입신청">
		</form>


	</div>
</body>
</html>