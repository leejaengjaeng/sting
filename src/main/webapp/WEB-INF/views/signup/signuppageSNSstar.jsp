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
<title>ȸ������</title>
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
		<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
		
		���̵�<input type="text" name="id" id="id"><button type="button" onclick="checkid();">�ߺ��˻�</button><br/>
		��й�ȣ<input type="password" name="password" id="password"><br/>
		��й�ȣ<input type="password" name="password" id="repassword"><br/>
		�̸��� <input name="email1" placeholder="�̸���" type="text"> 
				<select name="email2" onChange=changeEmail(this.value) required>
				<option value="" selected>�̸��ϼ���</option>
				<option value="naver.com">@naver.com</option>
				<option value="hanmail.com">@hanmail.com</option>
				<option value="daum.net">@daum.net</option>
				<option value="nate.com">@nate.com</option>
				<option value="gmail.com">@gmail.com</option>
				<option value="hotmail.com">@hotmail.com</option>
				<option value="dreamwiz.com">@dreamwiz.com</option>
				<option value="korea.com">@korea.com</option>
				<option value="1">�����Է�</option>
			</select>
			<input type="text" name="email3" id="email3" style="visibility: hidden">
			
			�̸�<input type="text" id="name" name="name" required><br />
			�ڵ��� <input type="text" id="phonenumber" name="phonenumber" required><br />
			���ɻ�ǰ�о�<input type="checkbox" name="favoritem" value="�м�">�м�
			<input type="checkbox" name="favoritem" value="�м�">��ǰ
			 <input	type="checkbox" name="favoritem" value="��Ƽ">��Ƽ 
			 <input	type="checkbox" name="favoritem" value="��Ȱ">��Ȱ 
			 <input	type="checkbox" name="favoritem" value="APP">APP 
			 <input	type="checkbox" name="favoritem" value="IDEA">IDEA<br />
			 SNS(����)<br/>
			 �ν�Ÿ�׷�url<input type="text" name="SNSurl"><br />
			 ���̽���url<input type="text" name="SNSurl"><br />
			 ��α�url<input type="text" name="SNSurl"><br />
			 ��Ÿurl<input type="text" name="SNSurl"><br />
			 ���� <select name="bankname" id="bankname" onChange=changebank(this.value)>
			 	<option value="" selected>����</option>
			 	<option value="����" selected>����</option>
			 	<option value="�츮" selected>�츮</option>
			 	<option value="����" selected>����</option>
			 	<option value="�ϳ�" selected>�ϳ�</option>
			 	<option value="��ȯ" selected>��ȯ</option>
			 	<option value="SC����" selected>SC����</option>
			 	<option value="�ѱ���Ƽ" selected>�ѱ���Ƽ</option>
			 	<option value="�λ�" selected>�λ�</option>
			 	<option value="�뱸" selected>�뱸</option>
			 	<option value="�泲" selected>�泲</option>
			 	<option value="����" selected>����</option>
			 	<option value="����" selected>����</option>
			 	<option value="����" selected>����</option>
			 	<option value="����" selected>����</option>
			 	<option value="���" selected>���</option>
			 	<option value="���" selected>���</option>
			 	<option value="����" selected>����</option>
			 </select><br/>
			 ���¹�ȣ<input type="text" name="accountnumber" id="accountnumber"><br/>
			<input type="submit" value="���Խ�û">
	</form>
	</div>
</body>
</html>