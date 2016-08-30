<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta name="viewport" content="width=device-width">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/webjars/bootstrap/3.3.7/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/3.1.0/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7/dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/body.css">

<script>
	$(document).ready(function()
	{

		$.ajax({
			url : "getNoticeCnt",
			type:"GET",
			success: function(result)
			{
				for(var i=0 ; i< result; i++)
				{	
					$('#noticePageNation').append('<label>'+(i+1)+'</label> |')
				}

				getNotice(${startP});
			},
			error: function(request,status,error){
		       //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
		
		$("#noticePageNation").on("click","label",function(event)
		{
			var start = ($(this)[0].textContent-1) * 10;
			getNotice(start);
		});		
	});
	
	var getNotice = function(start)
	{
		var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content"); 
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");  // THIS WAS ADDED
		var data={};
		var headers={};
		data[csrfParameter] = csrfToken;
		headers[csrfHeader] = csrfToken; 
		
		$.ajax({
			url :  "/noticeList/"+start,
			type:"GET",
			success: function(result)
			{
				//console.log(result);
				$('#noticeList').empty();
				for(notice in result)
				{
					$('#noticeList').append('<a href=getNoticeDetail/'+result[notice].nid+'>'
							+result[notice].title+'</a><br>'
					)
				}
			},
			error: function(request,status,error){
		     //  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}
</script>

	
<title>Sting</title>
</head>
<body>
	<div>
		<c:import url="/WEB-INF/views/headerAndFooter/header.jsp"/>

<!-- body -->
		<!-- 로그인 하지 않은유저 -->
		<sec:authorize access="isAnonymous()">
			<meta http-equiv="refresh" content="0; url=/"></meta>
		</sec:authorize>
	
		<div id="notices">
		Notice 공지 사항<br>
			<div id = "noticeList"></div>
			<div id="noticePageNation"></div>
		</div>
		
	
<!-- end body -->

		<c:import url="/WEB-INF/views/headerAndFooter/footer.jsp"></c:import>
	</div>
</body>
</html>