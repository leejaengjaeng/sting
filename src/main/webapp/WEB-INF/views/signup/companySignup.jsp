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
		    url : "/checkid",
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
</script>
</head>
<body>
	<div>
		<c:import url="../headerAndFooter/checkAgreementHeader.jsp">
			<c:param name="kindOfpage" value="agreement"></c:param>
		</c:import>
	</div>
	<div style="margin-left:20%;margin-right:20%">
	<form action="/signupinput" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="text" name="id" id="id"> <button type="button" onclick="checkid();">중복검사</button>
		<input type="submit" value="확인">
	</form>
	
	
	</div>
</body>
</html>