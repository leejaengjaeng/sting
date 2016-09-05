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
<title>회원가입</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>
<body>
<div>
		<c:import url="../headerAndFooter/checkAgreementHeader.jsp">
			<c:param name="kindOfpage" value="agreement"></c:param>
		</c:import>
	</div>
	<div class="form_table">
		<span>SNS스타 회원</span>
		<form action=${url} name="signupform" method="POST" enctype="multipart/form-data" onsubmit="return execute();">
			<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
			<table>
				<tr>
					<td style="padding-top:20px; width: 100%;" colspan="4"> 						<img id="blah" src="/resources/imgs/blank_img/company_blank.jpg" alr="your image"/>
						<input type="file" name="logoimage" onchange="readURL(this);" value="로고 업로드"/  accept="image/gif, image/jpeg, image/png" id="logoimg"><br>
						<span id="img_sp">사진은 500x500px,10mb미만으로 올려주시길 바랍니다.</span>
					</td>					
				</tr>
				<tr>
					<td style="height: 40px; width:25%;">아이디</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td><input type="text" name="id" id="id" required class="inp_txt" placeholder="필수항목" style="width: 100%;"></td>					
					<td><button type="button" onclick="checkid();" id="check_btn">중복검사</button></td>
				</tr>
				<tr>
					<td style="height: 40px;">비밀번호</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="password" name="password" id="password" required placeholder="필수항목" class="inp_txt" style="width: 100%;"></td>										
					
				</tr>
				<tr>
					<td style="height: 40px;">비밀번호 확인</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="password" name="repassword" id="repassword" required placeholder="필수항목" class="inp_txt" style="width: 100%;"></td>					
				</tr>
				<tr>
					<td style="height: 40px;">E-MAIL</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td>
						<input type="text" name="email1" id="email1" required placeholder="필수항목" class="inp_txt" style="width: 100%;"></td>
					<td>						
						<select name="email2" onChange=changeEmail(this.value) required id="em_sel">
							<option value="" selected>이메일선택</option>
							<option value="naver.com">@ naver.com</option>
							<option value="hanmail.com">@ hanmail.com</option>
							<option value="daum.net">@ daum.net</option>
							<option value="nate.com">@ nate.com</option>
							<option value="gmail.com">@ gmail.com</option>
							<option value="hotmail.com">@ hotmail.com</option>
							<option value="dreamwiz.com">@ dreamwiz.com</option>
							<option value="korea.com">@ korea.com</option>
							<option value="1">직접입력</option>
						</select> 	
					</td>										
				</tr>
				<tr>
					<td style="height: 40px;">이름</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="text" name="manager_name" id="manager_name" required placeholder="필수항목" class="inp_txt" style="width: 100%;"></td>					
				</tr>
				<tr>
					<td style="height: 40px;">핸드폰</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<input type="text" name="phonenumber" id="phonenumber" required class="slice_txt" > -
						<input type="text" name="phonenumber" id="phonenumber" required class="slice_txt" > -
						<input type="text" name="phonenumber" id="phonenumber" required class="slice_txt" >
					</td>					
				</tr>
				<tr>
					<td style="height: 40px;">관심 상품 분야</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<input type="checkbox" name="favoritem" value="패션">패션
						<input type="checkbox" name="favoritem" value="패션">소품
					 	<input	type="checkbox" name="favoritem" value="뷰티">뷰티 
					 	<input	type="checkbox" name="favoritem" value="생활">생활 
					 	<input	type="checkbox" name="favoritem" value="APP">APP 
					 	<input	type="checkbox" name="favoritem" value="IDEA">IDEA
					</td>					
				</tr>
				<tr>
					<td style="height: 40px;">대표SNS</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td><input type="text" name="id" id="id" required class="inp_txt" placeholder="필수항목" style="width: 100%;"></td>					
					<td><button type="button" onclick="checkid();" id="check_btn">추가</button></td>					
				</tr>
				<tr>
					<td style="height: 40px;">은행</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2">
						<select name="bankname" id="bankname" onChange=changebank(this.value) style="width:100%; height: 30px;">
							<option value="" selected>선택</option>
						 	<option value="국민">국민</option>
						 	<option value="우리">우리</option>
						 	<option value="신한">신한</option>
						 	<option value="하나" >하나</option>
						 	<option value="외환" >외환</option>
						 	<option value="SC제일" >SC제일</option>
						 	<option value="한국시티" >한국시티</option>
						 	<option value="부산" >부산</option>
						 	<option value="대구" >대구</option>
						 	<option value="경남" >경남</option>
						 	<option value="광주" >광주</option>
						 	<option value="전북" >전북</option>
						 	<option value="제주" >제주</option>
						 	<option value="농협" >농협</option>
						 	<option value="기업" >기업</option>
						 	<option value="산업" >산업</option>
						 	<option value="수협" >수협</option>
						</select>
					</td>					
				</tr>
				<tr>
					<td style="height: 40px;">계좌번호</td>
					<td style="vertical-align: middle; padding-right: 15px;"> : </td>
					<td colspan="2"><input type="text" name="" id="" class="inp_txt" style="width: 100%;"></td>					
				</tr>				
				<tr>
					<td colspan="4"><button id = "ok_btn">가입신청</button></td>
				</tr>
				
			</table>
		</form>	
	</div>
<div style="float: left; width: 100%; margin-top:50px;">
	<c:import url="../headerAndFooter/footer.jsp"></c:import>
</div>	
</body>
</html>