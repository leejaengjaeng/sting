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
<link rel="stylesheet" href="/resources/css/less.css">
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
	<div class="form_table">
		<span>��Ÿȸ��</span>
		<form action=${url} name="signupform" method="POST" enctype="multipart/form-data" onsubmit="return execute();">
			<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
			<table>
				<tr>
					<td style="padding-top:20px; width: 100%;" colspan="4"> 						<img id="blah" src="/resources/imgs/blank_img/company_blank.jpg" alr="your image"/>
						<input type="file" name="logoimage" onchange="readURL(this);" value="�ΰ� ���ε�"/  accept="image/gif, image/jpeg, image/png" id="logoimg"><br>
						<span id="img_sp">������ 500x500px,10mb�̸����� �÷��ֽñ� �ٶ��ϴ�.</span>
					</td>					
				</tr>
				<tr>
					<td style="height: 40px; width:25%;">���̵�</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td><input type="text" name="id" id="id" required class="inp_txt" placeholder="�ʼ��׸�" style="width: 100%;"></td>					
					<td><button type="button" onclick="checkid();" id="check_btn">�ߺ��˻�</button></td>
				</tr>
				<tr>
					<td style="height: 40px;">��й�ȣ</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="password" name="password" id="password" required placeholder="�ʼ��׸�" class="inp_txt" style="width: 100%;"></td>										
					
				</tr>
				<tr>
					<td style="height: 40px;">��й�ȣ Ȯ��</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="password" name="repassword" id="repassword" required placeholder="�ʼ��׸�" class="inp_txt" style="width: 100%;"></td>					
				</tr>
				<tr>
					<td style="height: 40px;">�̸�</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="text" name="company_name" id="company_name" required placeholder="�ʼ��׸�" class="inp_txt" onkeyup="checkpwd();" style="width: 100%;"></td>					
				</tr>
				<tr>
					<td style="height: 40px;">ȸ������</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<select id="companyselect" onChange=changeCompany(this.value) style="width: 100%; height: 30px;">
							<option value="" selected>��������</option>
							<option value="���">���</option>
							<option value="����">����</option>
							<option value="�Ƴ��">�Ƴ��</option>
							<option value="������">������</option>
							<option value="�����">�����</option>
						</select> 						
					</td>					
				</tr>
				
				<tr>
					<td style="height: 40px;">�ڵ���</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<input type="text" name="" id="" required class="slice_txt" > -
						<input type="text" name="" id="" required class="slice_txt" > -
						<input type="text" name="" id="" required class="slice_txt" >
					</td>					
				</tr>
				<tr>
					<td style="height: 40px;">���� ��ǰ �о�</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<input type="checkbox" name="interestproduct" value="�м�">�м�
						<input type="checkbox" name="interestproduct" value="�м�">��ǰ
			 			<input	type="checkbox" name="interestproduct" value="��Ƽ">��Ƽ 
			 			<input	type="checkbox" name="interestproduct" value="��Ȱ">��Ȱ 
			 			<input	type="checkbox" name="interestproduct" value="APP">APP 
			 			<input	type="checkbox" name="interestproduct" value="IDEA">IDEA
					</td>					
				</tr>				
				<tr>
					<td>��ǥ SNS URL</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<input type="text" name="SNSurl" style="width: 100%;">
					</td>
				</tr>
			
				<tr>
					<td colspan="4"><button id = "ok_btn">���Խ�û</button></td>
				</tr>
				
			</table>
		</form>	
	</div>
</body>
</html>