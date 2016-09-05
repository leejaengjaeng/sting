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
		<span>SNS��Ÿ ȸ��</span>
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
					<td style="height: 40px;">E-MAIL</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td>
						<input type="text" name="email1" id="email1" required placeholder="�ʼ��׸�" class="inp_txt" style="width: 100%;"></td>
					<td>						
						<select name="email2" onChange=changeEmail(this.value) required id="em_sel">
							<option value="" selected>�̸��ϼ���</option>
							<option value="naver.com">@ naver.com</option>
							<option value="hanmail.com">@ hanmail.com</option>
							<option value="daum.net">@ daum.net</option>
							<option value="nate.com">@ nate.com</option>
							<option value="gmail.com">@ gmail.com</option>
							<option value="hotmail.com">@ hotmail.com</option>
							<option value="dreamwiz.com">@ dreamwiz.com</option>
							<option value="korea.com">@ korea.com</option>
							<option value="1">�����Է�</option>
						</select> 	
					</td>										
				</tr>
				<tr>
					<td style="height: 40px;">�̸�</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="text" name="manager_name" id="manager_name" required placeholder="�ʼ��׸�" class="inp_txt" style="width: 100%;"></td>					
				</tr>
				<tr>
					<td style="height: 40px;">�ڵ���</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<input type="text" name="phonenumber" id="phonenumber" required class="slice_txt" > -
						<input type="text" name="phonenumber" id="phonenumber" required class="slice_txt" > -
						<input type="text" name="phonenumber" id="phonenumber" required class="slice_txt" >
					</td>					
				</tr>
				<tr>
					<td style="height: 40px;">���� ��ǰ �о�</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<input type="checkbox" name="favoritem" value="�м�">�м�
						<input type="checkbox" name="favoritem" value="�м�">��ǰ
					 	<input	type="checkbox" name="favoritem" value="��Ƽ">��Ƽ 
					 	<input	type="checkbox" name="favoritem" value="��Ȱ">��Ȱ 
					 	<input	type="checkbox" name="favoritem" value="APP">APP 
					 	<input	type="checkbox" name="favoritem" value="IDEA">IDEA
					</td>					
				</tr>
				<tr>
					<td style="height: 40px;">��ǥSNS</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td><input type="text" name="id" id="id" required class="inp_txt" placeholder="�ʼ��׸�" style="width: 100%;"></td>					
					<td><button type="button" onclick="checkid();" id="check_btn">�߰�</button></td>					
				</tr>
				<tr>
					<td style="height: 40px;">����</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<select name="bankname" id="bankname" onChange=changebank(this.value) style="width:100%; height: 30px;">
							<option value="" selected>����</option>
						 	<option value="����">����</option>
						 	<option value="�츮">�츮</option>
						 	<option value="����">����</option>
						 	<option value="�ϳ�" >�ϳ�</option>
						 	<option value="��ȯ" >��ȯ</option>
						 	<option value="SC����" >SC����</option>
						 	<option value="�ѱ���Ƽ" >�ѱ���Ƽ</option>
						 	<option value="�λ�" >�λ�</option>
						 	<option value="�뱸" >�뱸</option>
						 	<option value="�泲" >�泲</option>
						 	<option value="����" >����</option>
						 	<option value="����" >����</option>
						 	<option value="����" >����</option>
						 	<option value="����" >����</option>
						 	<option value="���" >���</option>
						 	<option value="���" >���</option>
						 	<option value="����" >����</option>
						</select>
					</td>					
				</tr>
				<tr>
					<td style="height: 40px;">���¹�ȣ</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="text" name="" id="" class="inp_txt" style="width: 100%;"></td>					
				</tr>				
				<tr>
					<td colspan="4"><button id = "ok_btn">���Խ�û</button></td>
				</tr>
				
			</table>
		</form>	
	</div>
<div style="float: left; width: 100%; margin-top:50px;">
	<c:import url="../headerAndFooter/footer.jsp"></c:import>
</div>	
</body>
</html>