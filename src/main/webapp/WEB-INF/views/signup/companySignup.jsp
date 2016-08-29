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
		        alert("����:"+data.KEY);
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
	 //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample4_postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                //document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
				
                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                if(data.autoRoadAddress) {
                    //����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';
                    

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';
                    
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
		���̵�<input type="text" name="id" id="id"> <button type="button" onclick="checkid();">�ߺ��˻�</button><br/>
		��й�ȣ<input type="password" name ="password" id ="password"><br/>
		��й�ȣ Ȯ��<input type="password" id ="repassword"><br/>
		�̸��� <input name="email1" placeholder="�̸���" type="text" >
                    <select name="email2" onChange=changeEmail(this.value)>
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
         <input type="text" name="email3" id = "email3" style="visibility:hidden"><br/>
                 �ּ��Է�
                    <input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��">
                    <input type="text" id="sample4_postcode" placeholder="�����ȣ" name="addr1" ><br/>
                    <input type="text" id="sample4_roadAddress" placeholder="���θ��ּ�" name="addr2" >
                    <input type="text" id="sample4_jibunAddress" placeholder="������ �ּ�" name="addr3"><br/>
       	ȸ���̸�	<input type="text" name="company_name" id="company_name"><br/>
       	ȸ������ 	<select id="companyselect" onChange=changeCompany(this.value)><br/>
       				<option value="" selected>��������</option>
       				<option value="�����">�����</option>
       				<option value="�����">�����</option>
       				<option value="������">������</option>
       			</select>
       			<input type="hidden" name="typeofcompany" id="typeofcompany">
       	����ڹ�ȣ <input type="text" name="registration_number" id="registration_number"><br/>
       	������̸� <input type="text" name="manager_name" id="manager_name"><br/>
		�������ȭ��ȣ<input type="text" name="manager_phonenumber" id="manager_phonenumber"><br/>
		��޻�ǰ�о�<input type="checkbox" name="interestproduct" value="�м�">�м�
		<input type="checkbox" name="interestproduct" value="�м�">��ǰ
		<input type="checkbox" name="interestproduct" value="��Ƽ">��Ƽ
		<input type="checkbox" name="interestproduct" value="��Ȱ">��Ȱ
		<input type="checkbox" name="interestproduct" value="APP">APP
		<input type="checkbox" name="interestproduct" value="IDEA">IDEA<br/>
		����ڵ���� ��ĵ�� <input type="file" name="registration_scan" id="registration_scan">
		<input type="submit" value="Ȯ��">
	</form>
	
	
	</div>
</body>
</html>