<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<link rel="stylesheet"
	href="/webjars/bootstrap/3.3.7/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/3.1.0/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.7/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/signup.css">
<link rel="stylesheet" href="resources/css/less.css">

<title>Insert title here</title>
</head>
<body>
<div id="black_wrap"></div>    
<div id="layer_pop">
    <div id="poz">
        <a id="close">Close</a>
        <h3>문의</h3>
        <div class="user_box">
            <input class="inp_title" placeholder="Title" value="제목제목">
            <textarea class="txtarea">TextTeext</textarea>        
          
        </div>
          <br/>
        <h3>답변</h3>
        <div class="user_box" style="margin-top:20px;">
            <input class="inp_title" placeholder="Title">
            <textarea class="txtarea">TextTeext</textarea>        
            <button class="btn1">Send</button>
        </div>
    </div>
</div>
<button id="btn">POPUP</button>
<script>
    $("#btn").click(function(){
        $("#black_wrap").fadeIn(); 
        $("#layer_pop").fadeIn();
    });
    $("#black_wrap").click(function(){
       $("#layer_pop").fadeOut();
       $(this).fadeOut();
    });
    $("#close").click(function(){
        $("#layer_pop").fadeOut();
        $("#black_wrap").fadeOut();
    })
</script>
</body>
</html>