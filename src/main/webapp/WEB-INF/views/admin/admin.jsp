<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta name="viewport" content="width=device-width">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<style>
    *{box-sizing: border-box;}
#black_wrap{
    width: 100%;
    height: 100%; 
    position: absolute; 
    left: 0;
    top: 0;
    background:rgba(0,0,0,0.5);
    display: none;
    z-index: 4
    overflow: hidden;
}    
#layer_pop{
    width: 750px;
    height: 800px; 
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%,-50%);
    z-index: 5;
    background: #fff;
    display: none;
    box-shadow: 0 0 5px 0 #000;
    border-radius: 15px;
    padding: 20px;
    
}
.inp_title{
    width: 100%;
    height: 40px;    
    border-radius:10px;
    border: 1px solid #ccc;
    background: #f1f1f1;
    padding-left: 5px;
    float: left;
    }
       .user_box{
        float: left;
        width: 100%;
    }

    .txtarea{
        float: left;
        width: 100%;
        
        background: #f1f1f1;
        border: 1px solid #ccc;
        border-radius:10px;
        height: 200px;
        margin-top: 20px;
        padding: 10px;
    }
    .btn1{
        width: 100px;
        height: 35px;
        background:none;
        border: 1px solid #ccc;
        border-radius: 10px;
        float: right;
        margin: 10px 0 10px 0;
    }
    #poz{
        position: relative;
        float: left;
        width: 100%;
    }
    #close{
        position: absolute;
        right: 0;
        top: 0;
        cursor: pointer;
        font-size: 0.7rem;
    }
</style>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="/webjars/bootstrap/3.3.7/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/3.1.0/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/less.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/body.css">


<title>Sting</title>

<script>
	$(document).ready(function()
	{
		var reqContent = $('#reqContent').detach();
		var memberContent = $('#memberContent').detach();
		var productContent = $('#productContent').detach();
		var noticeContent = $('#noticeContent').detach();
		var qnaContent = $('#qnaContent').detach();

		changeContent(reqContent,memberContent,productContent,noticeContent,qnaContent);
	});
	
	var changeContent = function(reqContent,memberContent,productContent,noticeContent,qnaContent)
	{
		$('#adminContainer label').click(function()
		{
			
			$('#adminContent').empty();

			var menuSelector = this.id;
			var menuUrl = "/adminMenu/"+this.id;

			switch(menuSelector)
			{
			case "Menu_req" :
				$('#adminContent').append(reqContent);
				getReqContent(menuUrl);
				break;
			case "Menu_member" :
				$('#adminContent').append(memberContent);
				//getReqContent(menuUrl);
				break;
			case "Menu_product" :
				$('#adminContent').append(productContent);
				//getReqContent(menuUrl);
				break;
			case "Menu_notice" :
				$('#adminContent').append(noticeContent);
				//getReqContent("/adminMenu/reqList");
				break;
			case "Menu_qna" :
				alert("aa");
				$('#adminContent').append(qnaContent);
				getQnaContent(menuUrl);
				break;
			default:
				alert('너는 뭐니 ' + menuSelector)
			}
		});
	}
	
	
	var getReqContent = function(reqUrl)
	{
		$.ajax({
			url : reqUrl,
			type:"GET",
			success:function(result)
			{
				var appendCode = "";
				
				for(user in result)
				{
					appendCode = appendCode + 
					"<li class='reqItem'><input type='hidden' value='"+result[user].uid+"'/>"+result[user].id+
					"|"+result[user].role+" <label> 승인 </label></li> <br>";
				}
			
				$('#adminReqList').empty();
				$('#adminReqList').append(appendCode);
				
				//click Listener
				$('.reqItem label').click(function(){
					var uid = $(this).parent().children('input')[0].value;
					$(this).parent().remove();
					
					var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
					var csrfToken = $("meta[name='_csrf']").attr("content"); 
					var csrfHeader = $("meta[name='_csrf_header']").attr("content");  // THIS WAS ADDED
					var data={};
					var headers={};
					
					data[csrfParameter] = csrfToken;
					data["uid"] = uid;
					headers[csrfHeader] = csrfToken; 
					
					$.ajax({
						url : "/adminMenu/userPermitOk",
						type:"POST",
						data:data,
						headers:headers,
					    success:function(result)
						{
							console.log(result)
						},
						error:function(error)
						{
							console.log(error)
						}
					});
					
				});
			},
			error: function(request,status,error)
			{
			       //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});	
	}
	var getQnaContent = function(reqUrl)
	{
		$.ajax({
			url : reqUrl,
			type:"GET",
			success:function(result)
			{
				var appendCode = "";
				
				for(qna in result)
				{
					appendCode = appendCode + 
					"<li class='qnaItem'><input type='hidden' value='"+result[qna].uid+"'/>"+result[qna].title+
					"| "+result[qna].id+"|"+result[qna].content+"<button onclick='answer("+result[qna].uid+","+result[qna].title+","+result[qna].content+");'> 응답 </button></li><br>";
					
				}
				$('#adminQnaList').empty();
				$('#adminQnaList').append(appendCode);
				
			},
			error:function(error)
			{
				alert(error);
			}
		})
	}
	
</script>


</head>
<body>
	<c:import url="/WEB-INF/views/headerAndFooter/header.jsp"/>
	
	<div id="adminContainer">
		<!-- id와 같은 이름의 jsp 파일 필요 -->
		<label id="Menu_req" href="#">요청 보기</label>
		<label id="Menu_member" href="#">회원 관리</label>
		<label id="Menu_product" href="#">상품 관리</label>
		<label id="Menu_notice" href="#">공지사항</label>
		<label id="Menu_qna" href="#">문의사항</label>
		<div id="adminContent">
			관<br>
			리<br>
			자<br>
			페<br>
			이<br>
			지<br>
			<!-- include 될 부분 -->
			<div id="reqContent">
				<c:import url="/WEB-INF/views/bodys/admin/reqList.jsp"/>
			</div>
			<div id="memberContent">
				<c:import url="/WEB-INF/views/bodys/admin/reqList.jsp"/>
			</div>
			<div id="productContent">
				<c:import url="/WEB-INF/views/bodys/admin/reqList.jsp"/>
			</div>
			<div id="noticeContent">
				<c:import url="/WEB-INF/views/bodys/admin/reqList.jsp"/>
			</div>
			<div id="qnaContent">
				<c:import url="/WEB-INF/views/bodys/admin/qnaList.jsp"/>
			</div>
		</div>
	</div>	
	<div id="black_wrap"></div>    
<div id="layer_pop">
    <div id="poz">
        <a id="close">Close</a>
        <h3>문의</h3>
        <div class="user_box">
            <input class="inp_title" placeholder="Title" id="qtitle" readOnly>
            <textarea class="txtarea" id="qcontents" readOnly></textarea>        
          
        </div>
          <br/>
        <h3>답변</h3>
        <div class="user_box" style="margin-top:20px;">
        	<input id="reuid" hidden>
            <input id="retitle" class="inp_title" placeholder="Title">
            <textarea id="recontent" class="txtarea"></textarea>        
            <button class="btn1" onclick="sendmail();">Send</button>
        </div>
    </div>
</div>

<script>
function sendmail(){
	var qtitle=document.getElementById("retitle").value;
	var qcontent=document.getElementById("recontent").value;
	var quid=document.getElementById("reuid").value;
	
	var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content"); 
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");  // THIS WAS ADDED
	var data={};
	var headers={};
	
	
	data[csrfParameter] = csrfToken;
	data["title"] = qtitle;
	data["content"]=qcontent;
	data["uid"]=quid;
	headers[csrfHeader] = csrfToken; 
	
	$.ajax({
		url : "/sendmail",
		type:"POST",
		data:data,
		header:headers,
		success:function(result)
		{
			alert("ok");
			$("#layer_pop").fadeOut();
			$("#black_wrap").fadeOut();
		},
		error:function(error)
		{
			console.log(error);
			alert("error:"+error);
		}
	})
	
}
function answer(uid,qtitle1,qcontents1){
	var qtitle=document.getElementById("qtitle");
	qtitle.value=qtitle1;
	var qcontent=document.getElementById("qcontents");
	qcontents.value=qcontents1;
	var quid=document.getElementById("reuid");
	quid.value=uid;
	   $("#black_wrap").fadeIn(); 
	   $("#layer_pop").fadeIn();
}
$("#black_wrap").click(function(){
    $("#layer_pop").fadeOut();
    $(this).fadeOut();
 });
$("#close").click(function(){
    $("#layer_pop").fadeOut();
    $("#black_wrap").fadeOut();
})
</script>
	<c:import url="/WEB-INF/views/headerAndFooter/footer.jsp"></c:import>	
</body>
</html>