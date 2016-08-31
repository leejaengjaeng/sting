

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
                                    close();
                                }
                                // 건물명이 있고, 공동주택일 경우 추가한다.
                                if(data.buildingName !== '' && data.apartment === 'Y'){
                                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                    close();
                                }
                                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                if(extraRoadAddr !== ''){
                                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                                    close();
                                }
                                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                                if(fullRoadAddr !== ''){
                                    fullRoadAddr += extraRoadAddr;
                                    close();
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
                		        if (data.KEY=="YES"){
                		        	//document.signupform.id.readOnly=true;
                		        	var q=confirm(id+"는 사용할 수 있는 아이디 입니다. 사용하시겠습니까?")
                		        	if(q==true){
                		        		document.signupform.id.readOnly=true;
                		        	}
                		        	else{
                		        		document.getElementById("id").value="";
                		        	}
                		        }
                		        else{
                		        	document.getElementById("id").value="";
                		        	alert("중복된 아이디 입니다.");
                		        }
                		        
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


                	function changeCompany ( comtype ) {
                       document.getElementById("typeofcompany").value=comtype;
                    }
                	function changetype(type){
                		document.getElementById("type").value=type;
                	}
                	function checkpwd(){
                		var pwd=document.getElementById("password").value;
                		var repwd=document.getElementById("repassword").value;
                		if(pwd==repwd){
                			document.getElementById("checkpassword").innerHTML="<b>비밀번호가 일치합니다</b>"
                		}
                		else{
                			document.getElementById("checkpassword").innerHTML="<b>비밀번호가 일치하지않습니다</b>"
                		}
                	}
                	function execute(){
                		var pwd=document.getElementById("password");
                		var repwd=document.getElementById("repassword");
                		var id=document.getElementById("id");
                		if(pwd.value!=repwd.value){
                			alert("비밀번호가 일치하지 않습니다.");
                			pwd.value="";
                			repwd.value="";
                			pwd.focus();
                			return false;
                		}
                		if(id.readOnly==false){
                			alert("아이디 중복확인을 해주세요");
                			return false;
                		}
                		return true;
                	}