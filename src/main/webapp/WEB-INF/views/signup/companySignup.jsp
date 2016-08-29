<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<link rel="stylesheet"
	href="/webjars/bootstrap/3.3.7/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/3.1.0/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7/dist/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/signup.css">
<title>Insert title here</title>
<script>
	function checkid(){
		var id = document.getElementById("id").value;
		var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content"); 
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");  // THIS WAS ADDED
	    var id = document.getElementById("id").value; 
	    var data = {};
		var headers = {};
	    data[csrfParameter] = csrfToken;
	    data["id"] = id;
	    headers[csrfHeader] = csrfToken; 
		$.ajax({
		    url : "/signup/checkid",
		    dataType : "json",
		    type : "POST",
		    headers: headers,
		    data : data,
		    success: function(data) {
		        alert("성공:"+data.KEY);
		    },
		    error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"error:"+error);
		    }
		 
		}); 
	}
	function changeEmail ( email ) {
        if(email == "1") {
            document.getElementById("email3").style.visibility = "visible";
            document.form1.email3.value = "";
        } else {
            document.getElementById("email3").style.visibility = "hidden";
            document.form1.email3.value = email;
        }
    }
</script>
<script>
	 //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                //document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
				
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    
                } else {
                    document.getElementById('guide').innerHTML = '';
                    
                }
            }
        
        }).open();
    }
	function changeCompany ( comtype ) {
       document.getElementById("typeofcompany").value=comtype;
    }
</script>
</head>
<body>
	<div>
		<c:import url="../headerAndFooter/checkAgreementHeader.jsp">
			<c:param name="kindOfpage" value="agreement"></c:param>
		</c:import>
	</div>
	<div style="margin-left:20%;margin-right:20%">
	<form action="/signup/signupinput" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		아이디<input type="text" name="id" id="id"> <button type="button" onclick="checkid();">중복검사</button><br/>
		비밀번호<input type="password" name ="password" id ="password"><br/>
		비밀번호 확인<input type="password" id ="repassword"><br/>
		이메일 <input name="email1" placeholder="이메일" type="text" >
                    <select name="email2" onChange=changeEmail(this.value)>
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
         <input type="text" name="email3" id = "email3" style="visibility:hidden"><br/>
                 주소입력
                    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                    <input type="text" id="sample4_postcode" placeholder="우편번호" name="addr1" ><br/>
                    <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addr2" >
                    <input type="text" id="sample4_jibunAddress" placeholder="나머지 주소" name="addr3"><br/>
       	회사이름	<input type="text" name="company_name" id="company_name"><br/>
       	회사유형 	<select id="companyselect" onChange=changeCompany(this.value)><br/>
       				<option value="" selected>유형선택</option>
       				<option value="대행사">대행사</option>
       				<option value="유통사">유통사</option>
       				<option value="제조사">제조사</option>
       			</select>
       			<input type="hidden" name="typeofcompany" id="typeofcompany">
       	사업자번호 <input type="text" name="registration_number" id="registration_number"><br/>
       	담당자이름 <input type="text" name="manager_name" id="manager_name"><br/>
		담당자전화번호<input type="text" name="manager_phonenumber" id="manager_phonenumber"><br/>
		취급상품분야<input type="checkbox" name="interestproduct" value="패션">패션
		<input type="checkbox" name="interestproduct" value="패션">소품
		<input type="checkbox" name="interestproduct" value="뷰티">뷰티
		<input type="checkbox" name="interestproduct" value="생활">생활
		<input type="checkbox" name="interestproduct" value="APP">APP
		<input type="checkbox" name="interestproduct" value="IDEA">IDEA<br/>
		사업자등록증 스캔본 <input type="file" name="registration_scan" id="registration_scan">
		<input type="submit" value="확인">
	</form>
	
	
	</div>
</body>
</html>